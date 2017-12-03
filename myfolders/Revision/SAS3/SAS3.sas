libname sas3 '/folders/myfolders/revision/sas3';
run;

proc import datafile='/folders/myfolders/revision/sas3/car_sales.csv'
			out=sas3.cars
			dbms=csv
			replace;
			getnames=yes;
			datarow=2;
run;

Proc freq data=sas3.cars;
tables manufacturer;
run;

/* Question-1 */
Data cars_q1;
set sas3.cars;
length country_of_origin $15.;
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

proc sql;

create table cars_q1_sql as
select *,
case
when(manufacturer in ('Mercedes','Audi','BMW','Porsche','Volkswagen')) then 'Germany'
when(manufacturer in ('Toyota','Mitsubis','Nissan','Honda','Lexus','Subaru','Acura'))then 'Japan'
when(manufacturer in ('Infiniti')) then 'Hongkong'
when(manufacturer = 'Hyundai') then 'South Korea'
when(manufacturer = 'Jaguar') then 'United Kingdoms'
when(manufacturer in ('Saab','Volvo')) then 'Sweden'
else 'USA'
end as country_of_origin
from sas3.cars;

quit;

/* Question-2 */

Data cars_q2;
retain Unique_ID;
set sas3.cars;
length Unique_id $20.;
Unique_ID = trim(manufacturer)||trim(model);
run;

proc sql;

create table cars_q2_sql as
select cats(manufacturer,model) as unique_id Format $20.,*
from sas3.cars;

quit;

/* Question-3 */

