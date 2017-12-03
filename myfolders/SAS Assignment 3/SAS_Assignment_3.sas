Libname Asigmnt3 "/folders/myfolders/SAS Assignment 3";

proc import datafile="/folders/myfolders/SAS Assignment 3/car_sales.csv" out=Asigmnt3.car_sales;
run;

/* Problem-1 */

proc freq data=asigmnt3.car_sales;
table Manufacturer;
run;

data cars_origin(keep=manufacturer model car_origin);
set asigmnt3.car_sales;
lenght Manufacturer $ Mcar_Origin $20.;
Select(manufacturer);
	when("Acura") car_origin="Japan";
	when("Audi") car_origin="Germany";
	When("BMW") car_origin="Germany";
	When("Buick") car_origin="";
	When("Cadillac") car_origin="";
	When("Chevrole") car_origin="";
	When("Chrysler") car_origin="";
	Otherwise car_origin="Other";
end;
run;

/* Problem-2 */
Data asigmnt3.car_sales;
set asigmnt3.car_sales;
Unique_ID=Trim(Model)||'_'||Trim(Manufacturer);
run;
/* Problem-3 */

Data cars_sales_1 (keep=Unique_ID Manufacturer Model Latest_Launch Sales_in_thousands _4_year_resale_value price_in_thousands)
cars_sales_2(Drop=Manufacturer Model Latest_Launch Sales_in_thousands _4_year_resale_value price_in_thousands);
set asigmnt3.car_sales;
run;

/* Problem-4 */

Data Hyundai;
Input Manufacturer$ Model$ Sales_in_thousands _4_year_resale_value Latest_Launch date7.;
Format Latest_Launch date7.;
datalines;
Hyundai Tuscon 16.919 16.36 2Feb12
Hyundai i45 39.384 19.875 3jun11
Hyundai Verna 14.114 18.225 4jan12
Hyundai Terracan 8.588 29.725 10Mar11
;
run;

data Hyundai;
set Hyundai;
Unique_ID=Trim(Manufacturer)||'_'||Trim(Model);
run;

/* Problem-5 */

data Total_Sales;
set cars_sales_1 Hyundai;
run;

/* Problem-6 */

Proc sort data=Total_sales;
by Unique_ID;
run;

Proc sort data=cars_sales_2;
by Unique_ID;
run;

data MERGED;
MERGE Total_sales cars_sales_2;
by Unique_ID;
run;

/* Problem-7 */

Proc sort data=Total_sales;
by Unique_ID;
run;

Proc sort data=cars_sales_2;
by Unique_ID;
run;

Data Common_Merged;
merge Total_Sales(in=temp_total_sales) cars_sales_2(in=temp_cars_sales_2);
by Unique_ID;
if temp_total_sales=1 and temp_cars_sales_2=1;
run;