/*Steps for Regression Modeling:
1. Business problem definition - 
   a. What are features driving my sales.
   b. Given the features & values, what is predicted sales?
2. convert business problem into statistical problem:
     sales_in_thousands = F(resale, type of vehicle, fuel efficiency, other product feastures etc..)
3. Finding the right technique -OLS regression
4. Data colletion(Y, X) - marketing, distributor info, r&d,  .
5. Consolidate the data - aggregate and consolidate the data at manufacturer & model level
6. Data preparation for modeling
    a. missing value treatment - impute/remove missings
    b. Outlier treatment - remove/cap-floor outliers
    c. dummy variable creation - create n-1 dummies for categorical variable with n categories
7. Variable creation by using transformation and derived variable creation. - look at the relatioship between y & x
8. Basic assumptions - Normality/Linearity/outliers/multi collinierity
9. Variable reduction techniques (removing multicollinerity)-Factor analysis/correlation metrics/VIF/based on Variable significance etc.
10. Create dev and validation data sets - proc survey select
11. Modeling on dev data set
12. validating on validation data set - two methods(run model on val data and scoring the data)
13. Output intrepretation and derive insights 
14. convert statistical solution into business solutions*/

libname linear '~/Linear Regression';

/* data linear.car_sales; */
/* set linear.car_sales; /*(drop=Ln_Sales Vehicle_dummy); */
/* rename __year_resale_value=Resale_value; */
/* run; */

/* Descriptive Statistics */
proc contents data=linear.car_sales varnum;
run;

proc means data=linear.car_sales n nmiss mean std min P1 P5 P50 P95 P99 max;
run;

proc freq data=linear.car_sales;
table Manufacturer Vehicle_type / nocum nopercent nocol missprint;
run;

proc format;
 value $missfmt ' '='Missing' other='Not Missing';
 value  missfmt  . ='Missing' other='Not Missing';
run;
 
proc freq data=linear.car_sales; 
format Manufacturer Vehicle_type $missfmt.; /* apply format for the duration of this PROC */
tables Manufacturer Vehicle_type / missprint nocum nopercent;
run;
/* format _NUMERIC_ missfmt.; */
/* tables _NUMERIC_ / missing missprint nocum nopercent; */
/* run; */

Data Car_Sales;
set linear.car_sales;
run;

/* Outlier treatment */
Data car_sales;
set car_sales;
if Sales_in_thousands > 276.747 then Sales_in_thousands = 276.747;
if Resale_value > 60.625 then Resale_value = 60.625;
if Price_in_thousands > 82.6 then Price_in_thousands = 82.6;
if Engine_size > 5.7 then Engine_size = 5.7;
if Horsepower > 345 then Horsepower = 345;
if Wheelbase > 138.5 then Wheelbase = 138.5;
if Width > 79.3 then Width = 79.3;
if Length > 224.2 then Length = 224.2;
if Curb_weight > 5.401 then Curb_weight = 5.401;
if Fuel_capacity > 32 then Fuel_capacity = 32;
if Fuel_efficiency > 33 then Fuel_efficiency = 33;
if Power_perf_factor > 141.14115 then Power_perf_factor = 141.14115;
run;
/*  */
/* proc means data=car_sales n nmiss mean std min P1 P5 P50 P95 P99 max; */
/* run; */

/* Missing Value Treatment */
/* Mean Imputations */
data car_sales;
set car_sales;
if Sales_in_thousands = .  then Sales_in_thousands = 52.9980764;
if Resale_value = .  then Resale_value = 18.0729752;
if Price_in_thousands = .  then Price_in_thousands = 27.3907548;
if Engine_size = .  then Engine_size = 3.0608974;
if Horsepower = .  then Horsepower = 185.9487179;
if Wheelbase = .  then Wheelbase = 107.4871795;
if Width = .  then Width = 71.15;
if Length = .  then Length = 187.3435897;
if Curb_weight = .  then Curb_weight = 3.3780258;
if Fuel_capacity = .  then Fuel_capacity = 17.9519231;
if Fuel_efficiency = .  then Fuel_efficiency = 23.8441558;
if Power_perf_factor = .  then Power_perf_factor = 77.0435912;
run;


/* proc means data=car_sales n nmiss; */
/* run; */

/* Relationship between Dependent Variable and Independent Variable */
/* Numerical and Categorical variable */

proc anova data=car_sales;
class manufacturer;
model Sales_In_Thousands = Manufacturer;
run;

proc anova data=car_sales;
class vehicle_type ;
model Sales_In_Thousands = Vehicle_type;
run;

/* Normality to Check */
proc univariate data= car_sales;
var ln_sales;/*Sales_in_thousands; */
histogram;
run;

/*Transforming dependent variable to make it normal*/

Data car_sales;
set car_sales;
Ln_sales=log(sales_in_thousands);
run;

Data car_sales;
set car_sales;
if ln_sales <= -0.5 then delete;
run;

/*Cross check the normality*/
proc univariate data= car_sales ;
var sales_in_thousands Ln_sales ;
histogram;
run;

/* Creating Dummy Variables */
Data car_sales;
set car_sales;
if vehicle_type='Car' then Vehicle_Dummy=0;
else Vehicle_Dummy=1;
run;

proc glmmod data=car_sales outdesign=manufacturer_dummy_data outparm=manufacturer_dummy;
class manufacturer;
model sales_in_thousands=manufacturer;
run;

data car_sales;
merge car_sales manufacturer_dummy_data;
run;

data car_sales;
set car_sales (drop=col1);
run;

/* Numerical vs Numerical variable */
proc corr data=car_sales noprob;
run;


/* Creating development and Validation Dataset */
proc surveyselect data=car_sales samprate=0.7 out=car_sales outall seed=123;
run;

data dev val;
set car_sales;
if selected=1 then output dev;
else output val;
run;


/* Linear Regression on development */
/* Iteration-0 */

proc reg data=dev outest=reg_est;;
model Ln_sales=price_in_thousands
engine_size
/* horsepower */
wheelbase
width
/* length */
/* curb_weight */
/* fuel_capacity */
fuel_efficiency
Vehicle_dummy
Col2
Col3
Col4
Col5
Col6
Col7
Col8
Col9
Col10
Col11
Col12
Col13
Col14
Col15
Col16
Col17
Col18
Col19
Col20
Col21
Col22
Col23
Col24
Col25
Col26
Col27
Col28
Col29
Col30
Col31
 / VIF STB;
output out=dev1 p=Ln_pre_sales;
run;

/* Iteration-1 */

proc reg data=dev outest=reg_est;;
model Ln_sales=price_in_thousands
engine_size
horsepower
wheelbase
width
length
curb_weight
fuel_capacity
fuel_efficiency
Vehicle_dummy
Col2
Col3
Col4
Col5
Col6
Col7
Col8
Col9
Col10
Col11
Col12
Col13
Col14
Col15
Col16
Col17
Col18
Col19
Col20
Col21
Col22
Col23
Col24
Col25
Col26
Col27
Col28
Col29
Col30
Col31
 / selection = stepwise VIF STB;
output out=dev1 p=Ln_pre_sales;
run;

/* Iteration-2 */
proc reg data=dev outest=reg_est;;
model Ln_sales=Price_in_thousands
Engine_size
Wheelbase
Width
Fuel_efficiency
Vehicle_Dummy
Col10
Col15
Col21
Col22
Col23
Col29
 / VIF STB;
output out=dev1 p=Ln_pre_sales;
run;

/* Decile Analysis on Development Data */

Data dev1;
set dev1;
Pre_Sales = exp(Ln_Pre_Sales);
run;

proc rank data=dev1 out=dev_decile ties=low descending groups=10;
var Pre_Sales;
ranks decile;
run;

Proc means data=dev_decile;
class decile;
var Sales_in_thousands Pre_Sales;
output out=report_dev mean=actual_avg predicted_avg sum=Actual_Sum Predicted_Sum;
run;

/* Decile Analysis on the Validation Data */
/* Scoring Validation dataset */

proc score data=val score=reg_est out =val1 TYPE=PARMS;
var Price_in_thousands
Engine_size
Wheelbase
Width
Fuel_efficiency
Vehicle_Dummy
Col10
Col15
Col21
Col22
Col23
Col29;
run;

data val2;
set val1;
Pre_sales=Exp(Model1);
run;

proc rank data=val2 out=Val_Decile ties=low descending groups=10;
var pre_sales;
ranks decile;
run;

Proc means data=val_decile;
class decile;
var Sales_in_thousands Pre_Sales;
output out=report_val mean=actual_avg predicted_avg sum=Actual_Sum Predicted_Sum;
run;
