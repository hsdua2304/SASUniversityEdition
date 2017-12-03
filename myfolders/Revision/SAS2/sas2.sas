libname sas2 '/folders/myfolders/revision/sas2';
run;

Proc import datafile='/folders/myfolders/revision/sas2/Grocery_Coupons.xls'
			out=sas2.grocery
			dbms=xls
			replace;
			getnames=yes;
run;

/* Removing empty observation from the Grocery dataset */

data sas2.grocery_coupons;
set sas2.grocery;
where storeid is not missing;
run;

proc sql;

create table grocery_sql as
select * from sas2.grocery
where storeid is not null;

quit;

/* Providing Proper Value labels */

data sas2.grocery_coupons;
set sas2.grocery_coupons;
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

Proc sql;

Alter table grocery_sql
modify storeid label = "Store_ID"
modify hlthfood label = "Health_food_store"
modify size label = "Size_of_store"
modify org label = "Store_organization"
modify custid label = "Customer_ID"
modify gender label = "Gender"
modify shopfor label = "Who_shopping_for"
modify veg label = "Vegetarian"
modify style label = "Shopping_style"
modify usecoup label = "Use_coupons"
modify week label = "Week"
modify seq label = "Sequence"
modify carry label = "Carryover"
modify coupval label = "Value_of_coupon"
modify amtspent label = "Amount_spent";


quit;

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

data sas2.grocery_coupons;
set sas2.grocery_coupons;
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


/* Distribution of Coupon Values and shopping styles */

Proc freq data=sas2.grocery_coupons;
table Value_of_coupon shopping_style;
run;

Proc sort data=sas2.grocery_coupons;
by gender;

Proc freq data=sas2.grocery_coupons;
table Value_of_coupon shopping_style;
by gender;
run;

proc sql;

select distinct Value_of_coupon,distinct Count(value_of_coupons)
from sas2.grocery_coupons
group by gender;

quit;
