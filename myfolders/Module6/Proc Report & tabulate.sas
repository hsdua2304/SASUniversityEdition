/*The COLUMN statement is insufficient to provide total control of the appearance of individual columns and how they are to be*/
/*used. This task falls to the DEFINE statement.*/
/*DEFINE types include:*/
/*• display Shows or displays the value of the variable (default for character variables).*/
/*• group Consolidate observations using this variable.*/
/*• analysis Used in calculations with a statistic (default type for numeric variables).*/
/*• computed Specifies a variable not on the incoming data set that is to be created in a compute block.*/
/*• order Sorts the data and forms groups when summary statistics are requested.*/
/*• across Used to create groups across the page rather than down the page.*/

/*OTHER DEFINE STATEMENT OPTIONS*/
/*A number of supplemental options can be used with the design statement to augment the display of the information. Some of*/
/*these other options include:*/
/*• format Specifies how the information within this column is to be formatted.*/
/*• width Width of column, number of characters to allocate.*/
/*• noprint This column is not to be displayed.*/
/*• flow Text that is wider than the 'width=' option wraps within the block (split characters are*/
/*supported).*/
/*• statistic Statistic to be calculated (analysis variables).*/

/*A number of options are available with the BREAK and RBREAK statements. These include:*/
/*• OL inserts an overline*/
/*• DOL inserts a double overline*/
/*• UL inserts an underline*/
/*• DUL inserts a double underline*/
/*• summarize calculates an across group summary*/
/*• skip skips a line after the break*/
/*• suppress suppresses the printing or overlines and underlines around the group variables. */


proc report data=c.cust_seg nowd split='*';
column region sex post_usage_1month post_usage_1month=post_usage_1month_avg;
define region / group width=6 'Region*--';
define sex / group width=6 'Gender*--' ;
define post_usage_1month / analysis n format=5. 'Count*--';
define post_usage_1month_avg / analysis mean format=dollar8.2 'Mean*--';
break after region / ol skip summarize style=[foreground=black background=blue];
rbreak after / dol skip summarize;
title1 'Using Proc REPORT';
title2 'RBREAK At the End of the Report';
run;

proc report data=sashelp.pricedata;
columns date cost sale discount price;
define date/display;
define cost/display;
define sale/display;
define discount/display;
define price/display;
run;


proc report data= flightsum nowd;
column flight capacity deplaned EmptySeats;
define EmptySeats/computed 'EmptySeats';
compute EmptySeats;
EmptySeats=capacity.sum-deplaned.sum;
endcomp;
run;



/*      PROC TABULATE *****************************************************/





libname c "D:\Google Drive\alabs\Analytics\SAS\Sample codes for class";

proc contents data=c.cust_seg varnum; run;

proc tabulate data =c.cust_seg;
Title " SUMMARY of POST USAGE BY REGION and GENDER";
  class region sex;
  var post_usage_1month;
  table sex*mean, post_usage_1month*region;
run;

proc tabulate data =c.cust_seg;
Title " SUMMARY of PREUSAGE VS. POST USAGE BY REGION, GENDER and SEGMENT";
  class region sex segment;
  var post_usage_1month pre_usage;
  table (segment=segment * sex = Gender) , region = cust_region*(post_usage_1month=PostUsage pre_usage=Pre_usage)*(mean="")
;
/*  where region=1;*/
run;

proc tabulate data = c.cust_seg;
  class region sex;
  var post_usage_1month;
  table region='customer region'*mean,
        post_usage_1month='Mean post usage'*sex;
run;

proc tabulate data=c.cust_seg;
  class region sex;
  var post_usage_1month;
  table region='Customer region',
        mean=' '*post_usage_1month='Mean post usage'*sex='';
run;

proc tabulate data=c.cust_seg;
  class region sex;
  var post_usage_1month;
  table region=''*mean,
        post_usage_1month=''*sex='' / box=[label="Mean of Post usage of campaign by region and sex"
            style=[font_style=italic]] rtspace=42;
run;

proc tabulate data=c.cust_seg;
/*  class region sex;*/
  class region/ style=[foreground=black background=red];
  class sex/  style=[foreground=black background=blue];
  var post_usage_1month;
  table region*mean, 
        post_usage_1month*sex /style=[foreground=black background=red] ;
run;

proc tabulate data = c.cust_seg;
  class region sex;
  var post_usage_1month post_usage_2ndmonth;
  table region*mean*(post_usage_1month post_usage_2ndmonth),
        sex;
run;



proc tabulate data = c.cust_seg;
  class region sex segment;
  var post_usage_1month post_usage_2ndmonth;
  table region='customer region'*segment='segment Type'*(mean std),
        (post_usage_1month='post usage of campaign from 1 month' post_usage_2ndmonth='Post Usage of campaing from 2nd month')*sex=''/ rts=43 ;
run;

/*ODS - Output delivery systems************************************************************************************************/

ods html body = "C:\Users\Desktop\Stats Test\Summary1.html";
ods pdf file = "/folders/myfolders/Stats Test/Summary1.pdf";

proc tabulate data = c.cust_seg;
Title 'Summary report by region & gender';
  class region sex;
  var post_usage_1month post_usage_2ndmonth;
  table region*mean*(post_usage_1month post_usage_2ndmonth), 
        sex;
run;

proc tabulate data = c.cust_seg;
  class region sex segment;
  var post_usage_1month post_usage_2ndmonth;
  table region='customer region'*segment='segment Type'*(mean std),
        (post_usage_1month='post usage of campaign from 1 month' post_usage_2ndmonth='Post Usage of campaing from 2nd month')*sex=''/ rts=43 ;
run;

Title '';

ods html close;
ods pdf close;
/*ods _all_ colse;*/
