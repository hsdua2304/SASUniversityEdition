libname S "~/Logistic Regression";

proc contents data=s.bankloan varnum;
run;

proc freq data=s.bankloan;
table default;
run;

Data bankloan;
set s.bankloan;
if default=. then NewCustomer=1;
else NewCustomer=0;

Data existing;
set bankloan;
if NewCustomer=0;
run;

data dev val;
set existing;
if ranuni(12345) <= 0.7 then output dev;
else output val;
run;

proc freq data=dev;
table ed;
run;

/*Logistic regression - Iter 1*/
proc logistic data = dev descending /*by default it models for zero(ascending option)*/ 
outest=model;
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
/*Method-1*/
proc logistic data = val descending /*by default it models for*/ 
outest=model;
class ed;
model default = 
employ
address
debtinc
creddebt
/ stb lackfit;
output out =tmp1 p=newpred;
run;

/*#Method-2*/
data val;
set val;
Odds_ratio=EXP(-0.8161+(employ*-0.2601)+(address*-0.0812)+(debtinc*0.0936)+(creddebt*0.5843));
Prob=(Odds_ratio/(1+Odds_ratio));
run;

proc sort data=tmp;
by descending newpred;
run;

proc rank data=tmp groups=10 out=dev1;
/*by descending prob;*/
var newpred;
ranks probrank;
run;

proc sql;
select probrank, count(probrank) as cnt,sum(default) as default_cnt, min(newpred) as min_p, max(newpred) as max_p from dev1
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