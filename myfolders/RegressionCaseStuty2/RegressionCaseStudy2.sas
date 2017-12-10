/* Leading e-commerce company have point of sale data for each customer with demographics */
/* and would like to solve the following problems. */

/* 1. The drivers for the store purchase event count and would like to predict */
/* the store purchase event count for given drivers */
/* 2. The drivers for the customer churn and predict the customer churn (churn_status) */
/* given the drivers */

libname regcs2 '~/RegressionCaseStuty2';
run;

/* Importing Dataset */
proc import datafile='/folders/myfolders/RegressionCaseStuty2/E_Commerce_Data.csv'
out=Regcs2.ecom dbms=csv replace;
getnames=yes;
datarow=2;
run;

/* Description of Data */
proc contents data=regcs2.ecom varnum;
run;

proc means data=regcs2.ecom n nmiss mean std min P1 P5 P50 P95 P99 max;
run;

proc freq data=regcs2.ecom;
table churn_status / nocol nopercent nocum;
run;


/* Converting Dependent Variables */

Data ecom;
set regcs2.ecom;
if churn_status='Stayed' then churn_status=0;
else churn_status=1;
run;

Data ecom;
set ecom;
churnStatus = input(churn_status,Best12.);
run;

/* Outlier Treatment */

DATA ecom;
set ecom;
if session_length_seconds > 357137.5 then session_length_seconds = 357137.5;
if session_count > 465.5 then session_count = 465.5;
if event_count > 6603 then event_count = 6603;
if closed_session_event_count > 896 then closed_session_event_count = 896;
if open_session_event_count > 895 then open_session_event_count = 895;
if quest_completed_event_count > 3090.5 then quest_completed_event_count = 3090.5;
if store_purchase_event_count > 71.5 then store_purchase_event_count = 71.5;
run;

/* proc means data=ecom n nmiss mean std min P1 P5 P50 P95 P99 max; */
/* run; */

/* Relationship Between Variables */
/* Categorical vs Numerical */

proc anova data=ecom plots(maxpoints=10000);
class churn_status;
model store_purchase_event_count=churn_status;
run;

proc corr data=ecom noprob;
var session_length_seconds
session_count
event_count
closed_session_event_count
open_session_event_count
quest_completed_event_count
store_purchase_event_count;
run;



/* -------------------------------------------------------- */
/* Spliting Data into Training and Testing Dataset */

proc surveyselect data=ecom samprate=0.7 out=ecom outall seed=1234;
run;

data train test;
set ecom;
if selected=1 then output train;
else output test;
run;

/* -------------------------------------------------------------- */
/* Training Dataset */
/* Iteration-1 */
proc logistic data=train descending outest=modelest outmodel=model;
model churnStatus = session_length_seconds
session_count
event_count
closed_session_event_count
open_session_event_count
quest_completed_event_count
store_purchase_event_count
active_days / selection=stepwise STB lackfit;
output out=train_pred p=prob;
run;

/* Iteration-2 */
proc logistic data=train descending outest=modelest outmodel=model plots(maxpoints=none only)=(roc(id=obs) effect);
model churnStatus=session_length_seconds
event_count
closed_session_event_count
quest_completed_event_count
active_days / STB lackfit;
output out=train_pred p=prob;
run;

/* Testing Dataset */
proc logistic inmodel=model;
score data=test out=test_pred;
run;

/* --------------------------------------------------------------------- */
/* Decile Analysis */

/* Training Dataset */
proc rank data=train_pred groups=10 out=train_decile;
var prob;
ranks deciles;
run;

proc sql;
select deciles, count(deciles) as cnt,sum(churnStatus) as Churn_cnt, min(prob) as min_p, max(prob) as max_p from train_decile
group by deciles;
run;

/* Scoring using Proc Score */
/* Testing Dataset */

proc rank data=test_pred groups=10 out=test_decile;
var P_1;
ranks deciles;
run;

proc sql;
select deciles, count(deciles) as cnt,sum(churnStatus) as Churn_cnt, min(P_1) as min_p, max(P_1) as max_p from test_decile
group by deciles;
run;