libname mcs1 '/folders/myfolders/masterCaseStudy1';
run;

/* Importing Sample Dataset into working directory */
Proc Import datafile='/folders/myfolders/masterCaseStudy1/Olympics.xls'
			out=mcs1.olympics
			dbms=xls
			replace;
			getnames=yes;
			datarow=2;

Proc Import datafile='/folders/myfolders/masterCaseStudy1/Olympics_DIGI.xls'
			out=mcs1.olympics_DIGI
			dbms=xls
			replace;
			getnames=yes;
			datarow=2;

run;

Proc Report Data=mcs1.olympics nowd;
where Probability____ > 0;
columns Probability____ Probability____ = Nbr_of_Optys Total_Media_value TotalForecast;
define Probability____ / Group descending 'Probability';
define Nbr_of_Optys / analysis n 'Nbr_of_Optys';
define Total_Media_Value / analysis sum 'Tot_Budget' Format=dollar15.;
define TotalForecast / analysis computed 'Total_Forecast' Format=dollar15.;
rbreak after / dol Summarize;
Compute TotalForecast;
		if Probability____ > 10 then do;
			TotalForecast = Total_media_Value.sum * Probability____/100;
			TotalForecast_Temp = sum(totalforecast,totalforecast_temp);
		end;
		else do;
			if (Probability____=10) then TotalForecast=0;
			else TotalForecast=TotalForecast_Temp;
		end;
endcomp;
run;
