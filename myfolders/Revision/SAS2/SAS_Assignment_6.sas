libname asigmnt6 '/folders/myfolders/SAS Assignment 6';
run;

/* Question-1 */

Proc import datafile='/folders/myfolders/SAS Assignment 6/SMB usage and billing sample for PSTN line (April- Sep).CSV'
			out=asigmnt6.smb
			dbms=csv
			replace;
			getnames=yes;
			
run;

Proc sql;
alter table asigmnt6.smb
modify PRODUCT_ID label="Line number"
modify Year label="Year"
modify AON label="Age on network"
modify CELL_CALL_CNT_M1 label="count of cell calls-April"
modify CELL_CALL_CNT_M2 label="count of cell calls-May"
modify CELL_CALL_CNT_M3 label="count of cell calls-June"
modify CELL_CALL_CNT_M4 label="count of cell calls-July"
modify CELL_CALL_CNT_M5 label="count of cell calls-August "
modify CELL_CALL_CNT_M6 label="count of cell calls-September"
modify CELL_CALL_SEC_M1 label="Cell calls duration in seconds-April"
modify CELL_CALL_SEC_M2 label="Cell calls duration in seconds-May"
modify CELL_CALL_SEC_M3 label="Cell calls duration in seconds-June"
modify CELL_CALL_SEC_M4 label="Cell calls duration in seconds-July"
modify CELL_CALL_SEC_M5 label="Cell calls duration in seconds-August "
modify CELL_CALL_SEC_M6 label="Cell calls duration in seconds-September"
modify CELL_CALL_avg_dur_M1 label="Average cell calls duration-April"
modify CELL_CALL_avg_dur_M2 label="Average cell calls duration-May"
modify CELL_CALL_avg_dur_M3 label="Average cell calls duration-June"
modify CELL_CALL_avg_dur_M4 label="Average cell calls duration-July"
modify CELL_CALL_avg_dur_M5 label="Average cell calls duration-August "
modify CELL_CALL_avg_dur_M6 label="Average cell calls duration-September"
modify CELL_USAGE_CHARGE_AMT_M1 label="Cell usage charge amount-April"
modify CELL_USAGE_CHARGE_AMT_M2 label="Cell usage charge amount-May"
modify CELL_USAGE_CHARGE_AMT_M3 label="Cell usage charge amount-June"
modify CELL_USAGE_CHARGE_AMT_M4 label="Cell usage charge amount-July"
modify CELL_USAGE_CHARGE_AMT_M5 label="Cell usage charge amount-August "
modify CELL_USAGE_CHARGE_AMT_M6 label="Cell usage charge amount-September"
modify DATA_CALL_CNT_M1 label="count of Data calls-April"
modify DATA_CALL_CNT_M2 label="count of Data calls-May"
modify DATA_CALL_CNT_M3 label="count of Data calls-June"
modify DATA_CALL_CNT_M4 label="count of Data calls-July"
modify DATA_CALL_CNT_M5 label="count of Data calls-August "
modify DATA_CALL_CNT_M6 label="count of Data calls-September"
modify DATA_CALL_SEC_M1 label="Data calls duration in seconds-April"
modify DATA_CALL_SEC_M2 label="Data calls duration in seconds-May"
modify DATA_CALL_SEC_M3 label="Data calls duration in seconds-June"
modify DATA_CALL_SEC_M4 label="Data calls duration in seconds-July"
modify DATA_CALL_SEC_M5 label="Data calls duration in seconds-August "
modify DATA_CALL_SEC_M6 label="Data calls duration in seconds-September"
modify DATA_CALL_avg_dur_M1 label="Average Data calls duration-April"
modify DATA_CALL_avg_dur_M2 label="Average Data calls duration-May"
modify DATA_CALL_avg_dur_M3 label="Average Data calls duration-June"
modify DATA_CALL_avg_dur_M4 label="Average Data calls duration-July"
modify DATA_CALL_avg_dur_M5 label="Average Data calls duration-August "
modify DATA_CALL_avg_dur_M6 label="Average Data calls duration-September"
modify DATA_USAGE_CHARGE_AMT_M1 label="Data usage charge amount-April"
modify DATA_USAGE_CHARGE_AMT_M2 label="Data usage charge amount-May"
modify DATA_USAGE_CHARGE_AMT_M3 label="Data usage charge amount-June"
modify DATA_USAGE_CHARGE_AMT_M4 label="Data usage charge amount-July"
modify DATA_USAGE_CHARGE_AMT_M5 label="Data usage charge amount-August "
modify DATA_USAGE_CHARGE_AMT_M6 label="Data usage charge amount-September"
modify INT_CALL_CNT_M1 label="count of International calls calls-April"
modify INT_CALL_CNT_M2 label="count of International calls calls-May"
modify INT_CALL_CNT_M3 label="count of International calls calls-June"
modify INT_CALL_CNT_M4 label="count of International calls calls-July"
modify INT_CALL_CNT_M5 label="count of International calls calls-August "
modify INT_CALL_CNT_M6 label="count of International calls calls-September"
modify INT_CALL_SEC_M1 label="International calls calls duration in seconds-April"
modify INT_CALL_SEC_M2 label="International calls calls duration in seconds-May"
modify INT_CALL_SEC_M3 label="International calls calls duration in seconds-June"
modify INT_CALL_SEC_M4 label="International calls calls duration in seconds-July"
modify INT_CALL_SEC_M5 label="International calls calls duration in seconds-August "
modify INT_CALL_SEC_M6 label="International calls calls duration in seconds-September"
modify INT_CALL_avg_dur_M1 label="Average International calls calls duration-April"
modify INT_CALL_avg_dur_M2 label="Average International calls calls duration-May"
modify INT_CALL_avg_dur_M3 label="Average International calls calls duration-June"
modify INT_CALL_avg_dur_M4 label="Average International calls calls duration-July"
modify INT_CALL_avg_dur_M5 label="Average International calls calls duration-August "
modify INT_CALL_avg_dur_M6 label="Average International calls calls duration-September"
modify INT_USAGE_CHARGE_AMT_M1 label="International calls usage charge amount-April"
modify INT_USAGE_CHARGE_AMT_M2 label="International calls usage charge amount-May"
modify INT_USAGE_CHARGE_AMT_M3 label="International calls usage charge amount-June"
modify INT_USAGE_CHARGE_AMT_M4 label="International calls usage charge amount-July"
modify INT_USAGE_CHARGE_AMT_M5 label="International calls usage charge amount-August "
modify INT_USAGE_CHARGE_AMT_M6 label="International calls usage charge amount-September"
modify LOCAL_CALL_CNT_M1 label="count of Local calls calls-April"
modify LOCAL_CALL_CNT_M2 label="count of Local calls calls-May"
modify LOCAL_CALL_CNT_M3 label="count of Local calls calls-June"
modify LOCAL_CALL_CNT_M4 label="count of Local calls calls-July"
modify LOCAL_CALL_CNT_M5 label="count of Local calls calls-August "
modify LOCAL_CALL_CNT_M6 label="count of Local calls calls-September"
modify LOCAL_CALL_SEC_M1 label="Local calls calls duration in seconds-April"
modify LOCAL_CALL_SEC_M2 label="Local calls calls duration in seconds-May"
modify LOCAL_CALL_SEC_M3 label="Local calls calls duration in seconds-June"
modify LOCAL_CALL_SEC_M4 label="Local calls calls duration in seconds-July"
modify LOCAL_CALL_SEC_M5 label="Local calls calls duration in seconds-August "
modify LOCAL_CALL_SEC_M6 label="Local calls calls duration in seconds-September"
modify LOCAL_CAL_avg_dur_M1 label="Average Local calls calls duration-April"
modify LOCAL_CAL_avg_dur_M2 label="Average Local calls calls duration-May"
modify LOCAL_CAL_avg_dur_M3 label="Average Local calls calls duration-June"
modify LOCAL_CAL_avg_dur_M4 label="Average Local calls calls duration-July"
modify LOCAL_CAL_avg_dur_M5 label="Average Local calls calls duration-August "
modify LOCAL_CAL_avg_dur_M6 label="Average Local calls calls duration-September"
modify LOCAL_USAGE_CHARGE_AMT_M1 label="Local calls usage charge amount-April"
modify LOCAL_USAGE_CHARGE_AMT_M2 label="Local calls usage charge amount-May"
modify LOCAL_USAGE_CHARGE_AMT_M3 label="Local calls usage charge amount-June"
modify LOCAL_USAGE_CHARGE_AMT_M4 label="Local calls usage charge amount-July"
modify LOCAL_USAGE_CHARGE_AMT_M5 label="Local calls usage charge amount-August "
modify LOCAL_USAGE_CHARGE_AMT_M6 label="Local calls usage charge amount-September"
modify NAT_CALL_CNT_M1 label="count of National calls calls-April"
modify NAT_CALL_CNT_M2 label="count of National calls calls-May"
modify NAT_CALL_CNT_M3 label="count of National calls calls-June"
modify NAT_CALL_CNT_M4 label="count of National calls calls-July"
modify NAT_CALL_CNT_M5 label="count of National calls calls-August "
modify NAT_CALL_CNT_M6 label="count of National calls calls-September"
modify NAT_CALL_SEC_M1 label="National calls calls duration in seconds-April"
modify NAT_CALL_SEC_M2 label="National calls calls duration in seconds-May"
modify NAT_CALL_SEC_M3 label="National calls calls duration in seconds-June"
modify NAT_CALL_SEC_M4 label="National calls calls duration in seconds-July"
modify NAT_CALL_SEC_M5 label="National calls calls duration in seconds-August "
modify NAT_CALL_SEC_M6 label="National calls calls duration in seconds-September"
modify NAT_CALL_avg_dur_M1 label="Average National calls calls duration-April"
modify NAT_CALL_avg_dur_M2 label="Average National calls calls duration-May"
modify NAT_CALL_avg_dur_M3 label="Average National calls calls duration-June"
modify NAT_CALL_avg_dur_M4 label="Average National calls calls duration-July"
modify NAT_CALL_avg_dur_M5 label="Average National calls calls duration-August "
modify NAT_CALL_avg_dur_M6 label="Average National calls calls duration-September"
modify NAT_USAGE_CHARGE_AMT_M1 label="National calls usage charge amount-April"
modify NAT_USAGE_CHARGE_AMT_M2 label="National calls usage charge amount-May"
modify NAT_USAGE_CHARGE_AMT_M3 label="National calls usage charge amount-June"
modify NAT_USAGE_CHARGE_AMT_M4 label="National calls usage charge amount-July"
modify NAT_USAGE_CHARGE_AMT_M5 label="National calls usage charge amount-August "
modify NAT_USAGE_CHARGE_AMT_M6 label="National calls usage charge amount-September"
modify ONE_TIME_CHARGE_AMT_M1 label="One time charge-April"
modify ONE_TIME_CHARGE_AMT_M2 label="One time charge-May"
modify ONE_TIME_CHARGE_AMT_M3 label="One time charge-June"
modify ONE_TIME_CHARGE_AMT_M4 label="One time charge-July"
modify ONE_TIME_CHARGE_AMT_M5 label="One time charge-August "
modify ONE_TIME_CHARGE_AMT_M6 label="One time charge-September"
modify OTHER_CALL_CNT_M1 label="count of cell calls-April"
modify OTHER_CALL_CNT_M2 label="count of cell calls-May"
modify OTHER_CALL_CNT_M3 label="count of cell calls-June"
modify OTHER_CALL_CNT_M4 label="count of cell calls-July"
modify OTHER_CALL_CNT_M5 label="count of cell calls-August "
modify OTHER_CALL_CNT_M6 label="count of cell calls-September"
modify OTHER_CALL_SEC_M1 label="Cell calls duration in seconds-April"
modify OTHER_CALL_SEC_M2 label="Cell calls duration in seconds-May"
modify OTHER_CALL_SEC_M3 label="Cell calls duration in seconds-June"
modify OTHER_CALL_SEC_M4 label="Cell calls duration in seconds-July"
modify OTHER_CALL_SEC_M5 label="Cell calls duration in seconds-August "
modify OTHER_CALL_SEC_M6 label="Cell calls duration in seconds-September"
modify OTHER_CAL_avg_dur_M1 label="Average cell calls duration-April"
modify OTHER_CAL_avg_dur_M2 label="Average cell calls duration-May"
modify OTHER_CAL_avg_dur_M3 label="Average cell calls duration-June"
modify OTHER_CAL_avg_dur_M4 label="Average cell calls duration-July"
modify OTHER_CAL_avg_dur_M5 label="Average cell calls duration-August "
modify OTHER_CAL_avg_dur_M6 label="Average cell calls duration-September"
modify OTHER_USAGE_CHARGE_AMT_M1 label="Cell usage charge amount-April"
modify OTHER_USAGE_CHARGE_AMT_M2 label="Cell usage charge amount-May"
modify OTHER_USAGE_CHARGE_AMT_M3 label="Cell usage charge amount-June"
modify OTHER_USAGE_CHARGE_AMT_M4 label="Cell usage charge amount-July"
modify OTHER_USAGE_CHARGE_AMT_M5 label="Cell usage charge amount-August "
modify OTHER_USAGE_CHARGE_AMT_M6 label="Cell usage charge amount-September"
modify OVR_CALL_AVG_DURATION_M1 label="Overall average calls duration-April"
modify OVR_CALL_AVG_DURATION_M2 label="Overall average calls duration-May"
modify OVR_CALL_AVG_DURATION_M3 label="Overall average calls duration-June"
modify OVR_CALL_AVG_DURATION_M4 label="Overall average calls duration-July"
modify OVR_CALL_AVG_DURATION_M5 label="Overall average calls duration-August "
modify OVR_CALL_AVG_DURATION_M6 label="Overall average calls duration-September"
modify RECURRING_CHARGE_AMT_M1 label="Recurring bill amount-April"
modify RECURRING_CHARGE_AMT_M2 label="Recurring bill amount-May"
modify RECURRING_CHARGE_AMT_M3 label="Recurring bill amount-June"
modify RECURRING_CHARGE_AMT_M4 label="Recurring bill amount-July"
modify RECURRING_CHARGE_AMT_M5 label="Recurring bill amount-August "
modify RECURRING_CHARGE_AMT_M6 label="Recurring bill amount-September"
modify SPEND_AMT_M1 label="Spend amount-April"
modify SPEND_AMT_M2 label="Spend amount-May"
modify SPEND_AMT_M3 label="Spend amount-June"
modify SPEND_AMT_M4 label="Spend amount-July"
modify SPEND_AMT_M5 label="Spend amount-August "
modify SPEND_AMT_M6 label="Spend amount-September"
modify TOT_CALL_CNT_M1 label="Total calls counts-April"
modify TOT_CALL_CNT_M2 label="Total calls counts-May"
modify TOT_CALL_CNT_M3 label="Total calls counts-June"
modify TOT_CALL_CNT_M4 label="Total calls counts-July"
modify TOT_CALL_CNT_M5 label="Total calls counts-August "
modify TOT_CALL_CNT_M6 label="Total calls counts-September"
modify TOT_CALL_SEC_M1 label="Total calls seconds-April"
modify TOT_CALL_SEC_M2 label="Total calls seconds-May"
modify TOT_CALL_SEC_M3 label="Total calls seconds-June"
modify TOT_CALL_SEC_M4 label="Total calls seconds-July"
modify TOT_CALL_SEC_M5 label="Total calls seconds-August "
modify TOT_CALL_SEC_M6 label="Total calls seconds-September"
modify TOT_CHARGE_AMT_M1 label="Total charge amount-April"
modify TOT_CHARGE_AMT_M2 label="Total charge amount-May"
modify TOT_CHARGE_AMT_M3 label="Total charge amount-June"
modify TOT_CHARGE_AMT_M4 label="Total charge amount-July"
modify TOT_CHARGE_AMT_M5 label="Total charge amount-August "
modify TOT_CHARGE_AMT_M6 label="Total charge amount-September"
modify USAGE_CHARGE_AMT_M1 label="Total usage charge amount-April"
modify USAGE_CHARGE_AMT_M2 label="Total usage charge amount-May"
modify USAGE_CHARGE_AMT_M3 label="Total usage charge amount-June"
modify USAGE_CHARGE_AMT_M4 label="Total usage charge amount-July"
modify USAGE_CHARGE_AMT_M5 label="Total usage charge amount-August "
modify USAGE_CHARGE_AMT_M6 label="Total usage charge amount-September"
modify TCL_DLM label="Ratio of total calls seconds in last month to previous 5 months"
modify TCL_DL2M label="Ratio of total calls seconds in last 2 month to previous 4 months"
modify TCL_DL3M label="Ratio of total calls seconds in last 3 month to previous 3 months"
modify TCH_DLM label="Ratio of total charge amount in last month to previous 5 months"
modify TCH_DL2M label="Ratio of total charge amount in last 2 month to previous 4 months"
modify TCH_DL3M label="Ratio of total charge amount in last 3 month to previous 3 months"
modify LCL_DLM label="Ratio of Local calls seconds in last month to previous 5 months"
modify LCL_DL2M label="Ratio of Local calls seconds in last 2 month to previous 4 months"
modify LCL_DL3M label="Ratio of Local calls seconds in last 3 month to previous 3 months"
modify NCL_DLM label="Ratio of National calls seconds in last month to previous 5 months"
modify NCL_DL2M label="Ratio of National calls seconds in last 2 month to previous 4 months"
modify NCL_DL3M label="Ratio of National calls seconds in last 3 month to previous 3 months"
modify CELL_CALL_SEC_Avg6 label="Cell calls duration in seconds (Last 6 months Average)"
modify CELL_CALL_avg_dur_Avg6 label="Average cell calls duration (Last 6 months Average)"
modify CELL_USAGE_CHARGE_AMT_Avg6 label="Cell usage charge amount (Last 6 months Average)"
modify DATA_CALL_CNT_Avg6 label="Count of Data calls (Last 6 months Average)"
modify DATA_CALL_SEC_Avg6 label="Data calls duration in seconds (Last 6 months Average)"
modify DATA_CALL_avg_dur_Avg6 label="Average data calls duration (Last 6 months Average)"
modify DATA_USAGE_CHARGE_AMT_Avg6 label="Data usage charge amount (Last 6 months Average)"
modify INT_CALL_CNT_Avg6 label="Count of international calls (Last 6 months Average)"
modify INT_CALL_SEC_Avg6 label="international calls duration in seconds (Last 6 months Average)"
modify INT_CALL_avg_dur_Avg6 label="Average international calls duration (Last 6 months Average)"
modify INT_USAGE_CHARGE_AMT_Avg6 label="international calls usage charge amount (Last 6 months Average)"
modify LOCAL_CALL_CNT_Avg6 label="Count of Local calls (Last 6 months Average)"
modify LOCAL_CALL_SEC_Avg6 label="Local calls duration in seconds (Last 6 months Average)"
modify LOCAL_CAL_avg_dur_Avg6 label="Average local calls duration (Last 6 months Average)"
modify LOCAL_USAGE_CHARGE_AMT_Avg6 label="Local calls usage charge amount (Last 6 months Average)"
modify NAT_CALL_CNT_Avg6 label="Count of National calls (Last 6 months Average)"
modify NAT_CALL_SEC_Avg6 label="National calls duration in seconds (Last 6 months Average)"
modify NAT_CALL_avg_dur_Avg6 label="Average national calls duration (Last 6 months Average)"
modify NAT_USAGE_CHARGE_AMT_Avg6 label="National calls usage charge amount (Last 6 months Average)"
modify ONE_TIME_CHARGE_AMT_Avg6 label="One time charge amount (Last 6 months Average)"
modify OTHER_CALL_CNT_Avg6 label="Count of other calls (Last 6 months Average)"
modify OTHER_CALL_SEC_Avg6 label="Other calls duration in seconds (Last 6 months Average)"
modify OTHER_CAL_avg_dur_Avg6 label="Average others calls duration (Last 6 months Average)"
modify OTHER_USAGE_CHARGE_AMT_Avg6 label="Other usage charge amount (Last 6 months Average)"
modify OVR_CALL_AVG_DURATION_Avg6 label="Overall average calls duration (Last 6 months Average)"
modify RECURRING_CHARGE_AMT_Avg6 label="Recurring bill amount (Last 6 months Average)"
modify SPEND_AMT_Avg6 label="Spend amount (Last 6 months Average)"
modify TOT_CALL_CNT_Avg6 label="Total call count (Last 6 months Average)"
modify TOT_CALL_SEC_Avg6 label="Total call seconds (Last 6 months Average)"
modify TOT_CHARGE_AMT_Avg6 label="Total charge amount (Last 6 months Average)"
modify USAGE_CHARGE_AMT_Avg6 label="Total usage charge amount (Last 6 months Average)"
modify CELL_CALL_SEC_Avg3 label="Cell calls duration in seconds (Last 3 months Average)"
modify CELL_CALL_avg_dur_Avg3 label="Average cell calls duration (Last 3 months Average)"
modify CELL_USAGE_CHARGE_AMT_Avg3 label="Cell usage charge amount (Last 3 months Average)"
modify DATA_CALL_CNT_Avg3 label="Count of Data calls (Last 3 months Average)"
modify DATA_CALL_SEC_Avg3 label="Data calls duration in seconds (Last 3 months Average)"
modify DATA_CALL_avg_dur_Avg3 label="Average data calls duration (Last 3 months Average)"
modify DATA_USAGE_CHARGE_AMT_Avg3 label="Data usage charge amount (Last 3 months Average)"
modify INT_CALL_CNT_Avg3 label="Count of international calls (Last 3 months Average)"
modify INT_CALL_SEC_Avg3 label="international calls duration in seconds (Last 3 months Average)"
modify INT_CALL_avg_dur_Avg3 label="Average international calls duration (Last 3 months Average)"
modify INT_USAGE_CHARGE_AMT_Avg3 label="international calls usage charge amount (Last 3 months Average)"
modify LOCAL_CALL_CNT_Avg3 label="Count of Local calls (Last 3 months Average)"
modify LOCAL_CALL_SEC_Avg3 label="Local calls duration in seconds (Last 3 months Average)"
modify LOCAL_CAL_avg_dur_Avg3 label="Average local calls duration (Last 3 months Average)"
modify LOCAL_USAGE_CHARGE_AMT_Avg3 label="Local calls usage charge amount (Last 3 months Average)"
modify NAT_CALL_CNT_Avg3 label="Count of National calls (Last 3 months Average)"
modify NAT_CALL_SEC_Avg3 label="National calls duration in seconds (Last 3 months Average)"
modify NAT_CALL_avg_dur_Avg3 label="Average national calls duration (Last 3 months Average)"
modify NAT_USAGE_CHARGE_AMT_Avg3 label="National calls usage charge amount (Last 3 months Average)"
modify ONE_TIME_CHARGE_AMT_Avg3 label="One time charge amount (Last 3 months Average)"
modify OTHER_CALL_CNT_Avg3 label="Count of other calls (Last 3 months Average)"
modify OTHER_CALL_SEC_Avg3 label="Other calls duration in seconds (Last 3 months Average)"
modify OTHER_CAL_avg_dur_Avg3 label="Average others calls duration (Last 3 months Average)"
modify OTHER_USAGE_CHARGE_AMT_Avg3 label="Other usage charge amount (Last 3 months Average)"
modify OVR_CALL_AVG_DURATION_Avg3 label="Overall average calls duration (Last 3 months Average)"
modify RECURRING_CHARGE_AMT_Avg3 label="Recurring bill amount (Last 3 months Average)"
modify SPEND_AMT_Avg3 label="Spend amount (Last 3 months Average)"
modify TOT_CALL_CNT_Avg3 label="Total call count (Last 3 months Average)"
modify TOT_CALL_SEC_Avg3 label="Total call seconds (Last 3 months Average)"
modify TOT_CHARGE_AMT_Avg3 label="Total charge amount (Last 3 months Average)"
modify USAGE_CHARGE_AMT_Avg3 label="Total usage charge amount (Last 3 months Average)"
modify CELL_CALL_CNT_DEC2_1 label="Total cell calls count-Change from 2 months to 1 month "
modify CELL_CALL_CNT_DEC3_2 label="Total cell calls count-Change from 3 months to 2 month "
modify CELL_CALL_CNT_DEC4_3 label="Total cell calls count-Change from 4 months to 3 month "
modify CELL_CALL_CNT_DEC5_4 label="Total cell calls count-Change from 5 months to 4 month "
modify CELL_CALL_CNT_DEC6_5 label="Total cell calls count-Change from 6 months to 5 month "
modify CELL_CALL_SEC_DEC2_1 label="Total cell calls seconds-Change from 2 months to 1 month "
modify CELL_CALL_SEC_DEC3_2 label="Total cell calls seconds-Change from 3 months to 2 month "
modify CELL_CALL_SEC_DEC4_3 label="Total cell calls seconds-Change from 4 months to 3 month "
modify CELL_CALL_SEC_DEC5_4 label="Total cell calls seconds-Change from 5 months to 4 month "
modify CELL_CALL_SEC_DEC6_5 label="Total cell calls seconds-Change from 6 months to 5 month "
modify CELL_CALL_avg_dur_DEC2_1 label="Average cell calls duration-Change from 2 months to 1 month "
modify CELL_CALL_avg_dur_DEC3_2 label="Average cell calls duration-Change from 3 months to 2 month "
modify CELL_CALL_avg_dur_DEC4_3 label="Average cell calls duration-Change from 4 months to 3 month "
modify CELL_CALL_avg_dur_DEC5_4 label="Average cell calls duration-Change from 5 months to 4 month "
modify CELL_CALL_avg_dur_DEC6_5 label="Average cell calls duration-Change from 6 months to 5 month "
modify CELL_USAGE_CHARGE_AMT_DEC2_1 label="Cell usage charge amount-Change from 2 months to 1 month "
modify CELL_USAGE_CHARGE_AMT_DEC3_2 label="Cell usage charge amount-Change from 3 months to 2 month "
modify CELL_USAGE_CHARGE_AMT_DEC4_3 label="Cell usage charge amount-Change from 4 months to 3 month "
modify CELL_USAGE_CHARGE_AMT_DEC5_4 label="Cell usage charge amount-Change from 5 months to 4 month "
modify CELL_USAGE_CHARGE_AMT_DEC6_5 label="Cell usage charge amount-Change from 6 months to 5 month "
modify INT_CALL_CNT_DEC2_1 label="Total international calls count-Change from 2 months to 1 month "
modify INT_CALL_CNT_DEC3_2 label="Total international calls count-Change from 3 months to 2 month "
modify INT_CALL_CNT_DEC4_3 label="Total international calls count-Change from 4 months to 3 month "
modify INT_CALL_CNT_DEC5_4 label="Total international calls count-Change from 5 months to 4 month "
modify INT_CALL_CNT_DEC6_5 label="Total international calls count-Change from 6 months to 5 month "
modify INT_CALL_SEC_DEC2_1 label="Total international calls seconds-Change from 2 months to 1 month "
modify INT_CALL_SEC_DEC3_2 label="Total international calls seconds-Change from 3 months to 2 month "
modify INT_CALL_SEC_DEC4_3 label="Total international calls seconds-Change from 4 months to 3 month "
modify INT_CALL_SEC_DEC5_4 label="Total international calls seconds-Change from 5 months to 4 month "
modify INT_CALL_SEC_DEC6_5 label="Total international calls seconds-Change from 6 months to 5 month "
modify INT_CALL_avg_dur_DEC2_1 label="Average international calls duration-Change from 2 months to 1 month "
modify INT_CALL_avg_dur_DEC3_2 label="Average international calls duration-Change from 3 months to 2 month "
modify INT_CALL_avg_dur_DEC4_3 label="Average international calls duration-Change from 4 months to 3 month "
modify INT_CALL_avg_dur_DEC5_4 label="Average international calls duration-Change from 5 months to 4 month "
modify INT_CALL_avg_dur_DEC6_5 label="Average international calls duration-Change from 6 months to 5 month "
modify INT_USAGE_CHARGE_AMT_DEC2_1 label="international usage charge amount-Change from 2 months to 1 month "
modify INT_USAGE_CHARGE_AMT_DEC3_2 label="international usage charge amount-Change from 3 months to 2 month "
modify INT_USAGE_CHARGE_AMT_DEC4_3 label="international usage charge amount-Change from 4 months to 3 month "
modify INT_USAGE_CHARGE_AMT_DEC5_4 label="international usage charge amount-Change from 5 months to 4 month "
modify INT_USAGE_CHARGE_AMT_DEC6_5 label="international usage charge amount-Change from 6 months to 5 month "
modify LOCAL_CALL_CNT_DEC2_1 label="Total Local calls count-Change from 2 months to 1 month "
modify LOCAL_CALL_CNT_DEC3_2 label="Total Local calls count-Change from 3 months to 2 month "
modify LOCAL_CALL_CNT_DEC4_3 label="Total Local calls count-Change from 4 months to 3 month "
modify LOCAL_CALL_CNT_DEC5_4 label="Total Local calls count-Change from 5 months to 4 month "
modify LOCAL_CALL_CNT_DEC6_5 label="Total Local calls count-Change from 6 months to 5 month "
modify LOCAL_CALL_SEC_DEC2_1 label="Total Local calls seconds-Change from 2 months to 1 month "
modify LOCAL_CALL_SEC_DEC3_2 label="Total Local calls seconds-Change from 3 months to 2 month "
modify LOCAL_CALL_SEC_DEC4_3 label="Total Local calls seconds-Change from 4 months to 3 month "
modify LOCAL_CALL_SEC_DEC5_4 label="Total Local calls seconds-Change from 5 months to 4 month "
modify LOCAL_CALL_SEC_DEC6_5 label="Total Local calls seconds-Change from 6 months to 5 month "
modify LOCAL_CAL_avg_dur_DEC2_1 label="Average Local calls duration-Change from 2 months to 1 month "
modify LOCAL_CAL_avg_dur_DEC3_2 label="Average Local calls duration-Change from 3 months to 2 month "
modify LOCAL_CAL_avg_dur_DEC4_3 label="Average Local calls duration-Change from 4 months to 3 month "
modify LOCAL_CAL_avg_dur_DEC5_4 label="Average Local calls duration-Change from 5 months to 4 month "
modify LOCAL_CAL_avg_dur_DEC6_5 label="Average Local calls duration-Change from 6 months to 5 month "
modify LOCAL_USAGE_CHARGE_AMT_DEC2_1 label="Local usage charge amount-Change from 2 months to 1 month "
modify LOCAL_USAGE_CHARGE_AMT_DEC3_2 label="Local usage charge amount-Change from 3 months to 2 month "
modify LOCAL_USAGE_CHARGE_AMT_DEC4_3 label="Local usage charge amount-Change from 4 months to 3 month "
modify LOCAL_USAGE_CHARGE_AMT_DEC5_4 label="Local usage charge amount-Change from 5 months to 4 month "
modify LOCAL_USAGE_CHARGE_AMT_DEC6_5 label="Local usage charge amount-Change from 6 months to 5 month "
modify NAT_CALL_CNT_DEC2_1 label="Total National calls count-Change from 2 months to 1 month "
modify NAT_CALL_CNT_DEC3_2 label="Total National calls count-Change from 3 months to 2 month "
modify NAT_CALL_CNT_DEC4_3 label="Total National calls count-Change from 4 months to 3 month "
modify NAT_CALL_CNT_DEC5_4 label="Total National calls count-Change from 5 months to 4 month "
modify NAT_CALL_CNT_DEC6_5 label="Total National calls count-Change from 6 months to 5 month "
modify NAT_CALL_SEC_DEC2_1 label="Total National calls seconds-Change from 2 months to 1 month "
modify NAT_CALL_SEC_DEC3_2 label="Total National calls seconds-Change from 3 months to 2 month "
modify NAT_CALL_SEC_DEC4_3 label="Total National calls seconds-Change from 4 months to 3 month "
modify NAT_CALL_SEC_DEC5_4 label="Total National calls seconds-Change from 5 months to 4 month "
modify NAT_CALL_SEC_DEC6_5 label="Total National calls seconds-Change from 6 months to 5 month "
modify NAT_CALL_avg_dur_DEC2_1 label="Average National calls duration-Change from 2 months to 1 month "
modify NAT_CALL_avg_dur_DEC3_2 label="Average National calls duration-Change from 3 months to 2 month "
modify NAT_CALL_avg_dur_DEC4_3 label="Average National calls duration-Change from 4 months to 3 month "
modify NAT_CALL_avg_dur_DEC5_4 label="Average National calls duration-Change from 5 months to 4 month "
modify NAT_CALL_avg_dur_DEC6_5 label="Average National calls duration-Change from 6 months to 5 month "
modify NAT_USAGE_CHARGE_AMT_DEC2_1 label="National usage charge amount-Change from 2 months to 1 month "
modify NAT_USAGE_CHARGE_AMT_DEC3_2 label="National usage charge amount-Change from 3 months to 2 month "
modify NAT_USAGE_CHARGE_AMT_DEC4_3 label="National usage charge amount-Change from 4 months to 3 month "
modify NAT_USAGE_CHARGE_AMT_DEC5_4 label="National usage charge amount-Change from 5 months to 4 month "
modify NAT_USAGE_CHARGE_AMT_DEC6_5 label="National usage charge amount-Change from 6 months to 5 month "
modify SPEND_AMT_DEC2_1 label="Total spend amount-Change from 2 months to 1 month "
modify SPEND_AMT_DEC3_2 label="Total spend amount-Change from 3 months to 2 month "
modify SPEND_AMT_DEC4_3 label="Total spend amount-Change from 4 months to 3 month "
modify SPEND_AMT_DEC5_4 label="Total spend amount-Change from 5 months to 4 month "
modify SPEND_AMT_DEC6_5 label="Total spend amount-Change from 6 months to 5 month "
modify TOT_CALL_CNT_DEC2_1 label="Total calls count-Change from 2 months to 1 month "
modify TOT_CALL_CNT_DEC3_2 label="Total calls count-Change from 3 months to 2 month "
modify TOT_CALL_CNT_DEC4_3 label="Total calls count-Change from 4 months to 3 month "
modify TOT_CALL_CNT_DEC5_4 label="Total calls count-Change from 5 months to 4 month "
modify TOT_CALL_CNT_DEC6_5 label="Total calls count-Change from 6 months to 5 month "
modify TOT_CALL_SEC_DEC2_1 label="Total calls seconds-Change from 2 months to 1 month "
modify TOT_CALL_SEC_DEC3_2 label="Total calls seconds-Change from 3 months to 2 month "
modify TOT_CALL_SEC_DEC4_3 label="Total calls seconds-Change from 4 months to 3 month "
modify TOT_CALL_SEC_DEC5_4 label="Total calls seconds-Change from 5 months to 4 month "
modify TOT_CALL_SEC_DEC6_5 label="Total calls seconds-Change from 6 months to 5 month "
modify TOT_CHARGE_AMT_DEC2_1 label="Total charge amount-Change from 2 months to 1 month "
modify TOT_CHARGE_AMT_DEC3_2 label="Total charge amount-Change from 3 months to 2 month "
modify TOT_CHARGE_AMT_DEC4_3 label="Total charge amount-Change from 4 months to 3 month "
modify TOT_CHARGE_AMT_DEC5_4 label="Total charge amount-Change from 5 months to 4 month "
modify TOT_CHARGE_AMT_DEC6_5 label="Total charge amount-Change from 6 months to 5 month "
modify USAGE_CHARGE_AMT_DEC2_1 label="Total usage charge amount-Change from 2 months to 1 month "
modify USAGE_CHARGE_AMT_DEC3_2 label="Total usage charge amount-Change from 3 months to 2 month "
modify USAGE_CHARGE_AMT_DEC4_3 label="Total usage charge amount-Change from 4 months to 3 month "
modify USAGE_CHARGE_AMT_DEC5_4 label="Total usage charge amount-Change from 5 months to 4 month "
modify USAGE_CHARGE_AMT_DEC6_5 label="Total usage charge amount-Change from 6 months to 5 month "
modify Avg_DEC_6M_CELL_CALL_CNT label="Total cell calls count (Average change in last 6 months)"
modify Avg_DEC_6M_CELL_CALL_SEC label="Total cell calls seconds (Average change in last 6 months)"
modify Avg_DEC_6M_CELL_CALL_avg_dur label="Average cell calls duration (Average change in last 6 months)"
modify Avg_DEC_6M_CELL_USAGE_CHARGE_AMT label="Cell usage charge amount (Average change in last 6 months)"
modify Avg_DEC_6M_INT_CALL_CNT label="Total international calls count (Average change in last 6 months)"
modify Avg_DEC_6M_INT_CALL_SEC label="Total international calls seconds (Average change in last 6 months)"
modify Avg_DEC_6M_INT_CALL_avg_dur label="Average international calls duration (Average change in last 6 months)"
modify Avg_DEC_6M_INT_USAGE_CHARGE_AMT label="international usage charge amount (Average change in last 6 months)"
modify Avg_DEC_6M_LOCAL_CALL_CNT label="Total Local calls count (Average change in last 6 months)"
modify Avg_DEC_6M_LOCAL_CALL_SEC label="Total Local calls seconds (Average change in last 6 months)"
modify Avg_DEC_6M_LOCAL_CAL_avg_dur label="Average Local calls duration (Average change in last 6 months)"
modify Avg_DEC_6M_LOC_USAGE_CHRG_AMT label="Local usage charge amount (Average change in last 6 months)"
modify Avg_DEC_6M_NAT_CALL_CNT label="Total National calls count (Average change in last 6 months)"
modify Avg_DEC_6M_NAT_CALL_SEC label="Total National calls seconds (Average change in last 6 months)"
modify Avg_DEC_6M_NAT_CALL_avg_dur label="Average National calls duration (Average change in last 6 months)"
modify Avg_DEC_6M_NAT_USAGE_CHARGE_AMT label="National usage charge amount (Average change in last 6 months)"
modify Avg_DEC_6M_SPEND_AMT label="Total spend amount (Average change in last 6 months)"
modify Avg_DEC_6M_TOT_CALL_CNT label="Total calls count (Average change in last 6 months)"
modify Avg_DEC_6M_TOT_CALL_SEC label="Total calls seconds (Average change in last 6 months)"
modify Avg_DEC_6M_TOT_CHARGE_AMT label="Total charge amount (Average change in last 6 months)"
modify Avg_DEC_6M_USAGE_CHARGE_AMT label="Total usage charge amount (Average change in last 6 months)"
modify Avg_DEC_3M_CELL_CALL_CNT label="Total cell calls count (Average change in last 3 months)"
modify Avg_DEC_3M_CELL_CALL_SEC label="Total cell calls seconds (Average change in last 3 months)"
modify Avg_DEC_3M_CELL_CALL_avg_dur label="Average cell calls duration (Average change in last 3 months)"
modify Avg_DEC_3M_CELL_USAGE_CHARGE_AMT label="Cell usage charge amount (Average change in last 3 months)"
modify Avg_DEC_3M_INT_CALL_CNT label="Total international calls count (Average change in last 3 months)"
modify Avg_DEC_3M_INT_CALL_SEC label="Total international calls seconds (Average change in last 3 months)"
modify Avg_DEC_3M_INT_CALL_avg_dur label="Average international calls duration (Average change in last 3 months)"
modify Avg_DEC_3M_INT_USAGE_CHARGE_AMT label="international usage charge amount (Average change in last 3 months)"
modify Avg_DEC_3M_LOCAL_CALL_CNT label="Total Local calls count (Average change in last 3 months)"
modify Avg_DEC_3M_LOCAL_CALL_SEC label="Total Local calls seconds (Average change in last 3 months)"
modify Avg_DEC_3M_LOCAL_CAL_avg_dur label="Average Local calls duration (Average change in last 3 months)"
modify Avg_DEC_3M_LOC_USAGE_CHRG_AMT label="Local usage charge amount (Average change in last 3 months)"
modify Avg_DEC_3M_NAT_CALL_CNT label="Total National calls count (Average change in last 3 months)"
modify Avg_DEC_3M_NAT_CALL_SEC label="Total National calls seconds (Average change in last 3 months)"
modify Avg_DEC_3M_NAT_CALL_avg_dur label="Average National calls duration (Average change in last 3 months)"
modify Avg_DEC_3M_NAT_USAGE_CHARGE_AMT label="National usage charge amount (Average change in last 3 months)"
modify Avg_DEC_3M_SPEND_AMT label="Total spend amount (Average change in last 3 months)"
modify Avg_DEC_3M_TOT_CALL_CNT label="Total calls count (Average change in last 3 months)"
modify Avg_DEC_3M_TOT_CALL_SEC label="Total calls seconds (Average change in last 3 months)"
modify Avg_DEC_3M_TOT_CHARGE_AMT label="Total charge amount (Average change in last 3 months)"
modify Avg_DEC_3M_USAGE_CHARGE_AMT label="Total usage charge amount (Average change in last 3 months)";

run;


/* Question-2 */
Proc Import datafile='/folders/myfolders/SAS Assignment 6/Churners and labels.xls'
			out=asigmnt6.churners
			dbms=xls
			replace;
run;

/* Adding Churn month for the respective Churners */

Proc sql;

create table asigmnt6.smb as
Select * 
from asigmnt6.smb as smb left join 
(Select distinct product_id,churn_month from asigmnt6.churners)
as churn on smb.Product_id = churn.product_id;
quit;

/* Question-3 */
/* Average, Minimum and Maximum Age on Network of each line number */
proc sql;

Create table Summarized_AON as
select Product_id,mean(AON) as AVG_AON Format BESTD6.2,min(AON) as MIN_AON,max(AON) as MAX_AON
from asigmnt6.smb
group by product_id;

quit;

/* Question-4 */

/* Creating table with Max Age on Network */
proc sql;

create table max_aon as 
select Product_id,max(AON) as Max_AON
from asigmnt6.smb
group by product_id;

quit;

/* Updating the Age on network Column */
proc sql;

update asigmnt6.smb as smb
set AON = (select Max_Aon from max_aon 
					where smb.Product_id = Product_id);

quit;


/* Question-5 */

/* Summarizing data for Churners for Year 2010 and 2011 */
proc sql;

create table summarise_churners as 
select Product_id,mean(mean(cell_call_avg_dur_M1,cell_call_avg_dur_M2,cell_call_avg_dur_M3,cell_call_avg_dur_M4,cell_call_avg_dur_M5,cell_call_avg_dur_M6)) as Average_Call_Duration,
		sum(sum(Local_call_cnt_m1,Local_call_cnt_M2,Local_call_cnt_M3,Local_call_cnt_M4,Local_call_cnt_M5,Local_call_cnt_M6)) as Local_Call_Count,
		sum(sum(Cell_usage_charge_amt_m1,cell_usage_charge_amt_m2,cell_usage_charge_amt_m3,cell_usage_charge_amt_m4,cell_usage_charge_amt_m5,cell_usage_charge_amt_m6)) as Total_Usage_Charge
from asigmnt6.smb
where Churn_month ne . and (year = 2010 or year = 2011)
group by product_id;


Title "Average call Duration, Total local Calls and Total Cell Usage for Churners for year 2010 and 2011";
select *
from summarise_churners
where Average_call_duration < 60;

quit;

/* Summarizing Data for Non-Churners for year 2010 and 2011 */
proc sql;

create table summarise_non_churners as 
select Product_id,mean(mean(cell_call_avg_dur_M1,cell_call_avg_dur_M2,cell_call_avg_dur_M3,cell_call_avg_dur_M4,cell_call_avg_dur_M5,cell_call_avg_dur_M6)) as Average_Call_Duration Format bestd6.2,
		sum(sum(Local_call_cnt_m1,Local_call_cnt_M2,Local_call_cnt_M3,Local_call_cnt_M4,Local_call_cnt_M5,Local_call_cnt_M6)) as Local_Call_Count,
		sum(sum(Cell_usage_charge_amt_m1,cell_usage_charge_amt_m2,cell_usage_charge_amt_m3,cell_usage_charge_amt_m4,cell_usage_charge_amt_m5,cell_usage_charge_amt_m6)) as Total_Usage_Charge
from asigmnt6.smb
where Churn_month eq . and (year=2010 or year=2011)
group by Product_id;

Title "Average call Duration, Total local Calls and Total Cell Usage for Non-Churners for year 2010 and 2011";
select *
from summarise_non_churners
where Average_call_duration < 60;

quit;

/* Question-6 */

/* Subseting the SMB Dataset for Months July, August, September */
Proc sql;

Select name into :List separated by ','
from sashelp.vcolumn
where upcase(memname) ='SMB' and (name like '%_M4' or name like '%_M5' or name like '%_M6');

Create table Subset_SMB as
select &List from asigmnt6.smb;

quit;

/* Question-7 */

/* Importing Grocery dataset */
Proc import datafile='/folders/myfolders/SAS Assignment 6/Grocery_coupons.xls'
			out=asigmnt6.grocery
			dbms=xls
			replace;
			getnames=yes;
			range="Data$A1:P1405";
run;

/* Categoring Custormer based on amount spent */
Proc sql;

create table grocery as
Select *,
Case 
	when (0 < amtspent < 100) then 'Low'
	when (100 < amtspent < 200) then 'Medium'
	else 'High'
end as Spent_Category
from asigmnt6.grocery;

quit;

/* Number of Unique Customer in each group */
Proc sql;

Select Spent_Category,count(distinct custid) as Distinct_Cust_Count
from  grocery
group by spent_category;

quit;


/* Question-8 */

Proc sql;

Create table Airlines as
Select Loc,Client_name,
sum(case when airlines='Jet Airways' or airlines='Air India' then amout else 0 end) as Group1,
sum(case when Airlines ne 'Jet Airways' and Airlines ne 'Air India' then amout else 0 end) as Group2,
(calculated Group1 + calculated Group2) as Total,
(calculated Group1 / calculated Total) * 100 as Group1_Percent format=3.,
(calculated Group2 / calculated Total) * 100 as Group2_Percent format=3.
from asigmnt6.airlines
group by loc,client_name
order by loc,calculated Total desc;

quit;

/* Ranking based on Location */
Proc rank data=Airlines out=Airlines descending;
by loc;
var total;
ranks rank;
run;

/* Top 15 Clients Location wise */
Data Airlines;
Retain Rank;
set Airlines;
where rank<16;
run;

