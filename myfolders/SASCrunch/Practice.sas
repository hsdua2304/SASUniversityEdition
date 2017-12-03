/* Datalines,Format and Informat*/
Data Demo;
	Length ID $6. Race $9. Gender $6.;
	informat Date DATE11.;
	format date DDMMYY8.;
	Input ID $ Race $ Gender $ Age Date;

	/* obs_num = _n_; */
	/* error_status = _error_; */
	Datalines;
APP001 Black Male 23 23/MAR/2017.
APP002 Caucasian Female 25 02/Mar/2017
APP003 White Male 24 22/Mar/2017
APP004 Black Female 32 22/Apr/2017
APP005 Caucasian Female 26 22/feb/2016
;

	/* proc print data=demo; */
Run;

/* Datalines4 */
Data Demo;
	Length ID $6. Race $9. Gender $6.;
	Input ID $ Race $ Gender $ Age Date date11.;
	Datalines4;
APP001 Bla;ck Male 23 22/Mar/2017.
APP002 Caucas;ian Female 25 02/Mar/2017
APP003  . Male 24 22/Mar/2017
APP004 Black Fem;ale 32 22/Apr/2017
APP005 Caucasian Female 26 22/feb/2016
;;;;

proc print data=demo;
Run;

/* Date : 8th July, 2017 */
Libname Practice "/folders/myfolders/Practice";
libname Root1 "/folders/myfolders/Practice/root1";
libname Root2 "/folders/myfolders/Practice/root2";

/* Compilation and Execution */
data Practice.class;
	set sashelp.class;
	obs_num=_n_;
	if_error=_error_;
run;

/* Copy Data Sets */
proc copy in=sashelp out=practice;
	select cars air gas;
run;

proc copy in=practice out=root1;
	select cars air class;
run;

proc copy in=root1 out=root2;
run;

/* Deleting datasets */
proc delete data=practice.cars practice.gas;
run;

proc delete data=root1._all_;
run;

proc delete data=practice.cars root2.class;
run;

/* Contents */
proc contents data=practice.air;
run;

proc contents data=practice._all_;
run;

proc contents data=practice._all_ nodetails;
run;

proc contents data=sashelp.class varnum;
run;

/* Importing Datasets */
proc import datafile='/folders/myfolders/sascrunch/kpi.txt' out=root1.kpi 
		dbms=dlm replace;
	getnames=yes;
	datarow=5;
run;

proc import datafile='/folders/myfolders/practice/test123.xlsx' out=root1.alabs 
		dbms=xlsx replace;
	getnames=yes;
run;

/* 11/07/2017 */
proc import datafile="/folders/myfolders/Car_sales.csv" out=root1.Car_Sales 
		dbms=csv replace;
run;

/* First observation */
data root1.car_sales;
	set root1.car_sales (firstobs=5 obs=100);
run;

/* Label and Rename */
proc print data=root1.car_sales label;
	label model='Year of Manufacturing';
run;

data car_sales;
	set root1.car_sales;
	label Model='Year of Manufacturing';
	Rename model=Car_Model;
run;

/* Drop and Keep */
proc print data=root1.car_sales (keep=Manufacturer Model);
run;

proc print data=root1.car_sales (drop=Manufacturer Model);
run;

data car_sales;
	set root1.car_sales;
	keep Model Manufacturer;

proc print data=car_sales;
run;

/* Sorting */
proc sort data=root1.car_sales;
	/* by descending Manufacturer; */
	by Manufacturer;
run;

proc print data=root1.car_sales;
	profit=Sales_in_thousands - Price_in_thousands;
	var Manufacturer Model Sales_in_thousands Price_in_thousands Latest_Launch;
run;

/* ID Var Sum BY */
proc print data=cars_profit;
	id Manufacturer;
	var Model Sales_in_thousands Price_in_thousands Latest_Launch Profit;
	by Manufacturer;
	sum Profit;
run;

data root1.cars_profit;
	set root1.car_sales;

	/* Manufacturer Model Sales_in_thousands Price_in_thousands Latest_Launch; */
	profit=Sales_in_thousands - Price_in_thousands;

	/* by Manufacturer; */
	/* sum profit; */
run;

/* Condiational Statements */
/* Where */
proc print data=cars_profit;
	where profit between 10 and 30;
run;

proc print data=cars_profit;
	where Vehicle_Type="Car";
run;

proc print data=cars_profit;
	where manufacturer Contains "Mer" and _4_year_resale_value is null;
run;

/* If-Then */
data root1.cars_profit;
	set root1.cars_profit;

	if profit<0 then
		State="In Loss";
	else if profit>0 then
		State="In Profit";
run;

data count;
	set root1.cars_profit;
	var count=0;

	if _4_year_resale_value=. then
		count+1;

proc print data=count;
run;

/* Proc Frequency */
data cars;
	set sashelp.cars (firstobs=1 obs=200);
run;

proc freq data=cars;
run;

proc freq data=cars;
	table make type;
run;

proc freq data=cars;
	table make*type;
run;

/* proc freq data=cars; */
/* table type*make*origin; */
/* run; */
proc freq data=cars;
	table make*type/norow nocol;
run;

proc freq data=cars;
	where type in ('Hybrid', 'Sedan');
	table make*type/crosslist norow nocol;
run;

proc freq data=cars nlevels;
	table make type model origin;
run;

/* Proc Means */
proc means data=cars std min max nmiss;
run;

proc means data=cars min max maxdec=2;
	var mpg_city mpg_highway;
run;

proc sort data=cars;
	by type;
run;

proc means data=cars min max maxdec=2;
	var mpg_city mpg_highway;
	by type;
run;

proc means data=cars min max maxdec=2;
	var mpg_city mpg_highway;
	class make type;
run;

proc means data=cars maxdec=2;
	var mpg_city mpg_highway;
	class make type;
	output out=cars_stats mean=city_avg highway_avg min=city_mpg_min 
		highway_mpg_min max=city_mpg_max highway_mpg_max;
run;

proc summary data=cars maxdec=2;
	var mpg_city mpg_highway;
	class make type;
	output out=cars_stats mean=city_avg highway_avg min=city_mpg_min 
		highway_mpg_min max=city_mpg_max highway_mpg_max;
run;

/* Appending Data Sets */
Data A;
	input id varA$;
	datalines;
1 A1
2 A2
3 A3
;

Data B;
	input id varA$ varB$;
	datalines;
1 A1 B1
2 A2 B2
4 A3 B3
;
run;

Data combined;
	set A B;
run;

proc append base=A data=B force;
run;

/* Merging */
data dads;
	Input Famid name$ inc;
	cards;
2 art 22000
1 Bill 30000
3 Paul 25000
;
run;

data faminc;
	input famid faminc96 faminc97 faminc98;
	datalines;
3 75000 76000 77000
1 40000 40500 41000
2 45000 45400 45800
;
run;

Proc sort data=dads;
	by famid;
run;

/* Sorting Using nodup nodupkey dupout */
Data class;
	set sashelp.class;
run;

proc sort data=class out=class_sort;
	by height;
run;

proc sort data=class_sort dupout=class_duplicates nodupkey;
	by height;
run;