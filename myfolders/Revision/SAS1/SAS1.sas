libname sas1 '/folders/myfolders/revision/sas1';
run;

/* Question-1 */
proc import datafile='/folders/myfolders/revision/sas1/Car_sales.csv'
			out=sas1.cars
			dbms=csv
			replace;
			getnames=yes;
			datarow=2;
run;

/* Question-2 */
/* removing obseervation which have missing values in resale or price variable */

/* For Numeric Variables */
proc means data=cars NMISS N;
run;

/* For character and numeric Variables */

Proc format;
value $missfmt ' '='Missing' other='Not Missing';
value missfmt .='Missing' other='Not Missing';
run;

Proc freq data=sas1.cars;
format _CHAR_ $missfmt.;
table _CHAR_ / missprint missing nocum nopercent;
format _NUMERIC_ missfmt.;
table _NUMERIC_ / missprint missing nocum nopercent;
run;

Data sas1.cars;
set sas1.cars;
if (_4_year_resale_value=. or Price_in_Thousands = .) then delete;
run;

Proc sql;

create table cars_sql as
select * from sas1.cars
where _4_year_resale_value is not null and Price_in_thousands is not null;

quit;


/* Question-3 */

DATA lt_15k lt_20k lt_30k lt_40k gt_40k;
set sas1.cars;
if price_in_thousands le 15 then Output lt_15k;
if (15<price_in_thousands<=20) then Output lt_20k;
if (20<price_in_thousands<=30) then Output lt_30k;
if (30<price_in_thousands<=40) then Output lt_40k;
if (price_in_thousands>40) then output gt_40k;

run;

Proc sql;

create table lt_15k as select * from sas1.cars where price_in_thousands le 15 ;
create table lt_20k as select * from sas1.cars where price_in_thousands between 15 and 20 ; 
create table lt_30k as select * from sas1.cars where price_in_thousands between 20 and 30 ; 
create table lt_40k as select * from sas1.cars where price_in_thousands between 30 and 40 ; 
create table gt_40k as select * from sas1.cars where price_in_thousands gt 40;

quit;

/* Question-4 */

Data cars_q4(keep=Manufacturer Model Sales_in_thousands Price_in_thousands);
set sas1.cars;
run;

Proc sql;

create table cars_q4_sql as
select Manufacturer,Model,Sales_in_thousands,Price_in_thousands
from sas1.cars;

quit;

/* Question-5 */

data cars_q5;
set sas1.cars;
where Latest_launch gt '01oct2014'd;
run;

Proc sql;

create table cars_q5_sql as
select * from sas1.cars
where Latest_launch > '01-oct-14'd;

quit;