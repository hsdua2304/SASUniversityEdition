Data Number;
Var1 = 123;
Var2 = 356;
Var3 = 923;

Data Test;
Name = 'Harman';
Class = 'Data Science';
run;

Data Test;
	Input a b c;
	Datalines;
	1 2 3
	2 3 4
	4 5 6
	;
run;

Data Score;
	Input Score1 Score2 Score3;
	Datalines;
	56 234 23
	56 33 12
	23 54 21
	;
run;


Data Profile;
	length Pat_ID $12;
	Input Pat_ID $ Enroll $ Bscore;
	Datalines;
	P00112345678 Yes 99
	P00212345678 Yes 101
	P00212345678 No 125
	;
run;

Data New_Profile;
	Set Profile;
run;

Data Enroll;
	Set Profile;
	If Enroll = "Yes";
run;

Data JanHol;
	Set Sashelp.Holiday;
	if month = 1;
run;

libname Proj1 "/folders/myfolders";

libname Proj2 "/folders/myfolders/DS1";
data Income;
retain n;
set Proj2.Income;
run;

Data Proj1.Test;
	set sashelp.cp951;
run;

Proc export data=Income
	OutFile='/folders/myfolders/Income.xls'
	replace
	dbms=xls;
run;

Proc export data=sashelp.electric
	outfile='/folders/myfolders/Electric.csv'
	replace
	dbms=csv;
run;