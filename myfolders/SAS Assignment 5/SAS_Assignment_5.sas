Libname Asigmnt5 '/folders/myfolders/SAS Assignment 5';
run;

proc import datafile='/folders/myfolders/SAS Assignment 5/Grocery_Coupons.xls'
			out=asigmnt5.Grocery
			dbms=xls
			replace;
range="Data$A1:P1405";
run;


/* Problem-1 */

Data asigmnt5.grocery;
set asigmnt5.grocery;
Years = intck('year',couponexpiry,today());
Months = intck('month',couponexpiry,today());
Weeks = intck('week',couponexpiry,today());

Proc print data=asigmnt5.grocery(keep=couponexpiry Years Months Weeks) ;
run;

/* Problem-2 */

Data asigmnt5.grocery;
set asigmnt5.grocery;
issuanceDate = intnx('month',couponexpiry,-3,'s');
format issuanceDate date9.;
Proc print Data=asigmnt5.grocery(keep=couponexpiry issuanceDate);
run;

/* Problem-3 */

Data asigmnt5.grocery;
set asigmnt5.grocery;
daysLeft = datdif(couponexpiry,'30sep2014'd,'30/ACT');
Proc print Data=asigmnt5.grocery(keep=couponexpiry daysleft);
run;

/* Problem-4 */
Data grocery_Amount(keep=Amtspent intAmount roundamount AmountDiff) sum;
set asigmnt5.grocery;
intAmount = int(amtspent);
roundAmount = round(amtspent);
AmountDiff = intAmount - roundAmount;
proc print data=grocery_Amount(keep=amtspent intAmount roundAmount AmountDiff);
run;

proc means data=grocery_amount sum;
var AmountDiff;
output out=profit_loss sum=Total_sum;
run;

Data profit_loss;
set profit_loss;
if total_sum > 0 then result = "Loss";
else result = "Gain";
run;
/* ----------------------------------------------------------------------- */

filename depart '/folders/myfolders/SAS Assignment 5/department.csv' encoding='wlatin1';

proc import datafile=depart
			out=asigmnt5.department
			dbms=csv
			replace;
run;

/* Problem-5 */

data asigmnt5.department;
set asigmnt5.department;
LastName = scan(name,1,',');
proc print data=asigmnt5.department(keep=name lastname);
run;

/* Problem-6 */

Data asigmnt5.department;
set asigmnt5.department;
FirstName_Start_position = index(name,',') + 2;
Proc print data=asigmnt5.department(keep=name FirstName_Start_position);
run;

/* Problem-7 */

Data department;
set asigmnt5.department;
FirstName = substr(name,FirstName_Start_position,Length(name) - Firstname_Start_Position -1);
proc print data=department(keep=name firstname);
run;