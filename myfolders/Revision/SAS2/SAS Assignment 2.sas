
                            /*******Assignment-2*********/

/*assigning permanant library*/
libname sas2 '/folders/myfolders/5 - Data Exploration/5 - Data Exploration (SAS Module 2)';

/******Question-1*******/
/*import grocery_coupons excel file into permanant library*/

proc import datafile='/folders/myfolders/5 - Data Exploration/5 - Data Exploration (SAS Module 2)/grocery_coupons.xls'
out=sas2.grocery_coupons dbms=xls replace;
sheet=data;getnames=yes;datarow=2;
run;

/*removing the extra rows from file*/

data sas2.grocery_coupons0;
set sas2.grocery_coupons;
whee storeid not is missing;
run;

/*providing proper variable names*/

data sas2.grocery_coupons1;
set sas2.grocery_coupons0;
label storeid=Store ID
hlthfood=Health food store
size=Size of store
org=Store organization
custid=Customer ID
gender=Gender
shopfor=Who shopping for
veg=Vegetarian
style=Shopping style
usecoup=Use coupons
week=Week
seq=Sequence
carry=Carryover
coupval=Value of coupon
amtspent=Amount spent;
rename storeid=Store_ID
hlthfood=Health_food_store
size=Size_of_store
org=Store_organization
custid=Customer_ID
gender=Gender
shopfor=Who_shopping_for
veg=Vegetarian
style=Shopping_style
usecoup=Use_coupons
week=Week
seq=Sequence
carry=Carryover
coupval=Value_of_coupon
amtspent=Amount_spent;
run;

/*formating for value labels*/
proc format;
value hfs
0='No'  1= 'Yes';
value sos
1='Small'       2='Medium'      3='Large';
value so
1='Emphasizes produce'  2='Emphasizes deli'     3='Emphasizes bakery'   4='No emphasis';
value gen
0='Male'        1='Female';
value wsf
1='Self'        2='Self and spouse'     3='Self and family';
value veg
0='No'  1='Yes';
value ss
1='Biweekly; in bulk'   2='Weekly; similar items'       3="Often; what's on sale";
value uc
1='No'  2='From newspaper'      3='From mailings'       4='From both';
value co
0='First period'        1='No coupon'   2='5 percent'   3='15 percent'  4='25 percent';
value voc
1='No value'    2='5 percent'   3='15 percent'  4='25 percent';
run;

/*providing the value labels to the variables*/

data sas2.grocery_coupons1;
set sas2.grocery_coupons1;
format Health_food_store hfs.
Size_of_store sos.
Store_organization so.
Gender gen.
Who_shopping_for wsf.
Vegetarian veg.
Shopping_style ss.
Use_coupons uc.
Carryover co.
Value_of_coupon voc.;
run;

/*****Question-2*********/
/*distribution table of coupon values and shopping style for overall data*/
proc freq data=sas2.grocery_coupons1;
table Value_of_coupon Shopping_style;
run;

/*table separately for gender*/
proc sort data=sas2.grocery_coupons1;
by gender;
run;
proc freq data=sas2.grocery_coupons1;
table Value_of_coupon Shopping_style;
by gender;
run;

/******Question-3********/
/*distribution table of store size by store organisation,
seprate tables one with cell frequencies and other with cell percentages*/

proc freq data=sas2.grocery_coupons1;
table Size_of_store*Store_organization;
table Size_of_store*Store_organization/nocol nocum nopercent norow;
table Size_of_store*Store_organization/nocol nocum nofreq norow;
run;

/*******Question-4*******/
/*avg,min,max,variance,total amount spent at overall levels
by different store size & store organisation*/

proc means data=sas2.grocery_coupons1 mean min max var sum;
class Size_of_store Store_organization;
var amount;
run;


                     /************End of assignment 2**************/
