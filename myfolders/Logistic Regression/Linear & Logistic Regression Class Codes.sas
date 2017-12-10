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

libname S "C:\Users\Chandra Mouli Kotta\Documents\Projects\Desktop\alabs\6. Class Notes\Regression Class Excercise";
proc univariate data=s.car_sales;
var Sales_in_thousands;
run;

proc means data=s.car_sales N Nmiss mean std min P1 P5 P10 P25 P50 P75 P90 P95 P99 max ;
run;

data car_sales;
set s.car_sales;
/*Outliers Capping*/
if sales_in_thousands>211.4609185 then sales_in_thousands=211.4609185;
if  __year_resale_value>46.5031612 then  __year_resale_value=46.5031612;
if price_in_thousands>61.3738747 then price_in_thousands=61.3738747;
if engine_size>7.4728832 then engine_size=7.4728832;
if horsepower>404.5471037 then horsepower=404.5471037;
if wheelbase>136.255644 then wheelbase=136.255644;
if width>84.0382506 then width=84.0382506;
if length>235.2786589 then length=235.2786589;
if curb_weight>5.5431788 then curb_weight=5.5431788;
if fuel_capacity>33.192071 then fuel_capacity=33.192071;
if fuel_efficiency>39.9982037 then fuel_efficiency=39.9982037;
if latest_launch>19401.2040907 then latest_launch=19401.2040907;

run;

proc means data=car_sales Nmiss mean;
run;


/*Mean imputation*/
data car_sales;
set car_sales;
 if Sales_in_thousands= .  Then Sales_in_thousands=49.7528308;
 if __year_resale_value= .  Then __year_resale_value=17.5514529;
 if Price_in_thousands= .  Then Price_in_thousands=26.836575;
 if Engine_size= .  Then Engine_size=3.0575185;
 if Horsepower= .  Then Horsepower=185.6573532;
 if Wheelbase= .  Then Wheelbase=107.4571236;
 if Width= .  Then Width=71.15;
 if Length= .  Then Length=187.3435897;
 if Curb_weight= .  Then Curb_weight=3.3778399;
 if Fuel_capacity= .  Then Fuel_capacity=17.9519231;
 if Fuel_efficiency= .  Then Fuel_efficiency=23.8116766;
run;

/*Creating dummy variables*/
data car_sales;
set car_sales;
if vehicle_type="Car" then Vehicle_dummy=0; else Vehicle_dummy=1;
run;

/*Assumptions*/
proc univariate data= car_sales;
var Sales_in_thousands;
histogram;
run;

/*Transforming dependent variable to make it normal*/

Data car_sales;
set car_sales;
Ln_sales=log(sales_in_thousands);
run;

/*Cross check the normality*/
proc univariate data= car_sales ;
var sales_in_thousands Ln_sales ;
histogram;
run;

/*Running correlations matrix*/
proc corr data=car_sales;
var  Ln_sales
price_in_thousands
engine_size
horsepower
wheelbase
/*width*/
length
/*curb_weight*/
/*fuel_capacity*/
fuel_efficiency
Vehicle_dummy;
run;


/*Dev - validation*/

/*Last two year data Jan -2012 Dec 2013 */
/*in time data customers be Jan-2012 to Oct 2013*/
/*developement  700  intime validation on validation data set 300*/


proc surveyselect data=car_sales out=car_sales outall samprate=0.7 seed=123; run;

data dev val;
set car_sales;
if selected=1 then output dev;
else output val;
run;
/*Regression Modelling*/
/*Iteration - 0*/
proc reg data=dev;
model Ln_sales=price_in_thousands
engine_size
horsepower
wheelbase
width
length
curb_weight
fuel_capacity
fuel_efficiency
Vehicle_dummy /selection=stepwise VIF STB;
run;

/*Validation*/

/*Method-1*/
proc reg data=val;
model Ln_sales=Price_in_thousands
Wheelbase
Width
Vehicle_Dummy
 / VIF STB;
run;

/*Method-2*/
data val1;
set val;
Ln_pre_sales=((price_in_thousands*-0.06499)+ (width*0.06208) +
(wheelbase*0.03094)+ (Vehicle_dummy*-0.34039))-2.42198
;
Pre_sales=Exp(Ln_pre_sales);
run;

proc rank data=val1 out=val2 ties=low 
 descending groups=10; 
 var Pre_sales; 
 ranks Decile; 
run; 

proc means data=val2 ;  
 class Decile; 
 var Sales_in_thousands Pre_sales; 
 output out=report 
 mean=actualavg predicted_avg; 
run; 


/************************Logistic Regression********************************/
libname k "~/Regression";
proc contents data=k.bankloan;
run;

proc freq data=k.bankloan;
table default;
run;

data bankloan;
set k.bankloan;
if default=. then New_customer=1; else New_customer=0;
run;

data existing;
set bankloan;
if New_customer=0;
run;


data dev val;
set existing;
if ranuni(12345)<=0.7 then output dev;
else output val;
run;

/*proc surveyselect data=bankloan out=bankloan1 outall samprate=0.7 seed=12345; run;*/
/**/
/*data dev val;*/
/*set bankloan1;*/
/*if selected = 1 then output dev;*/
/*else output val;*/
/*run;*/


proc freq data=dev;
table ed; run;


/*Logistic regression - Iter 1*/
proc logistic data = dev descending /*by default it models for zero(ascending option)*/ 
outest=modelest outmodel=model;
class ed;
model default = 
employ
address
income
debtinc
creddebt
othdebt ed/ selection=stepwise stb lackfit;
output out =tmp p=newpred;
/*where New_customer=0;*/
run;

/*Logistic regression - val*/

data val;
set val;
Odds_ratio=EXP(-0.8161+(employ*-0.2601)+(address*-0.0812)+(debtinc*0.0936)+(creddebt*0.5843));
Prob=(Odds_ratio/(1+Odds_ratio));
run;

proc logistic inmodel=model;
      score data=val out=val1;
run;

/*Development - Decile Analysis */
proc rank data=tmp groups=10 out=dev1;
/*by descending prob;*/
var newpred;
ranks probrank;
run;

proc sql;
select probrank, count(probrank) as cnt,sum(default) as default_cnt, min(newpred) as min_p, max(newpred) as max_p from dev1
group by probrank;
quit;

/*Validation - Decile Analysis */
proc rank data=val1 groups=10 out=val1;
/*by descending prob;*/
var Prob;
ranks probrank;
run;

proc sql;
select probrank, count(probrank) as cnt,sum(default) as default_cnt, min(Prob) as min_p, max(Prob) as max_p from dev1
group by probrank;
quit;

/*scoring new customers(classifying new customers)*/
data NewCust_class;
set bankloan;
if New_customer=1;
Odds_ratio=EXP(-0.8161+(employ*-0.2601)+(address*-0.0812)+(debtinc*0.0936)+(creddebt*0.5843));
Prob=(Odds_ratio/(1+Odds_ratio));
if prob >0.5 then Pred_default=1; else pred_default=0;
run;

proc freq data=NewCust_class; tables Pred_default;
run;





