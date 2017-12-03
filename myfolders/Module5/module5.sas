libname module5 '/folders/myfolders/module5';
run;

Data Text_Scan;
length name $25. phone $10.;
Input name phone;
Datalines;
Harmandeep_Singh_Dua 9711969681
Baljinder_Singh_Randhawa 8076787702
Sumeet_Singh_Bra 9213992944
;
run;

Data Text_Scan(Drop=name);
set text_scan;
Lastname = scan(name,-1,'_');
Firstname = scan(name,1,'_');
run;

Data Text_substr(Drop=ExchangeID);
set text_scan;
	ExchangeID = substr(phone,1,3);
	if ExchangeID = '921' then substr(phone,1,3) = '987';
run;
