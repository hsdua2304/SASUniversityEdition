                               /*******Assignment-3*********/

/*creating a library for assignment3*/
libname sas3 '/folders/myfolders/4 - Getting Started (SAS Module 1)';

/*import car_sales data given in xls format into permanant library*/
proc import datafile='/folders/myfolders/4 - Getting Started (SAS Module 1)/car_sales.xls'
out=sas3.car_sales dbms=xls replace;
getnames=yes; datarow=2;
run;

/*****Question-1*****/
/*checking the list of manufactures*/

proc freq data=sas3.car_sales;
run;

/*define a new varible country of origin based on each manufacturer*/

data que1;
set sas3.car_sales;
length country_of_origin $15;
select(manufacturer);
when('Mercedes','Audi','BMW','Porsche','Volkswagen')country_of_origin='Germany';
when('Toyota','Mitsubis','Nissan','Honda','Lexus','Subaru','Acura')country_of_origin='Japan';
when('Infiniti')country_of_origin='Hongkong';
when('Hyundai')country_of_origin='South Korea';
when('Jaguar')country_of_origin='United Kingdoms';
when('Saab','Volvo')country_of_origin='Sweden';
otherwise country_of_origin='USA';
end;
run;

/******Question-2******/
/*creating unique id in data set using model and manufacturer*/
data que2_1;
set sas3.car_sales;
length uniqueID $20;
uniqueID=trim(manufacturer)||trim(model);
run;

/*******Question-3(a)******/
/*3a: create data set containing unique id,manufacturer,model,launch data,sales,resale and price
 3b: create data set containing unique id and remaining technical variables*/

data que3a_1 (keep= uniqueID manufacturer model latest_launch sales_in_thousands price_in_thousands _4_year_resale_value)
que3b_1 (drop= latest_launch manufacturer model sales_in_thousands price_in_thousands _4_year_resale_value vehicle_type);
set que2_1;
run;

/******Question-4*****/
/*create data file "Hyundai" by giving data and create unique id*/

data Hyundai;
input Manufacturer$ model $ sales_in_thousands _4_year_resale_value  Latest_launch date7.;
cards;
Hyundai Tuscon 16.919  16.36  2feb12
Hyundai i45    39.384  19.875 3jun11
Hyundai Verna  14.114  18.225 4jan12
Hyundai Terracan 8.588 29.725 10mar11
;
format latest_launch date7.;
run;

data Hyundai;
set Hyundai;
length uniqueID $12;
uniqueID=trim(manufacturer)||trim(model);
run;

/*******Question-5*****/
/*giving new name total_sales to the file que3a*/

data total_sales;
set que3a_1;
run;

/*appending the files total_sales and hyundai*/

proc append base=total_sales data=Hyundai force;
run;

/******Question-6******/
/*sorting and merging by unique id in total_sales and que3b file*/

proc sort data=total_sales;
by uniqueID;
run;

proc sort data=que3b_1;
by uniqueID;
run;

data que6;
merge total_sales que3b_1;
by uniqueID;
run;

/*Question-7*/
/*after merging creating a new file which have common records from both the files*/

data que7;
merge total_sales(in=a)  que3b_1(in=b);
by uniqueID;
if a=1 and b=1;
run;

                             /********End of assignment3**********/
