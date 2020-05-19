
--Create Database R5APGMS
--	on
--	--Primary file group that will Create The data base in a folder Called Michiel van der merwe Asmt_1 on the network drive--
--	Primary(
--		Name = 'R5APGMSfirst',
--		Filename='D:\prgdatabase\R5APGMSfirst.mdf',
--		Size = 5MB,
--		Maxsize = 2GB,
--		Filegrowth =  1% 
--		),
--	--The secondary File group--
--	Filegroup 
--	Secondary (
--		Name = 'R5APGMSsecond',
--		Filename = 'D:\prgdatabase\R5APGMSsecond.ndf',
--		Size = 5MB,
--		Maxsize = 2GB,
--		Filegrowth =  1% 
--	)
--	--the activity will be loged on the same location as the primary data file--
--	Log on(
--		Name = 'R5APGMSlog',
--		Filename = 'D:\prgdatabase\R5APGMSsecond.ldf',
--		Size = 5MB,
--		Maxsize = 2GB,
--		Filegrowth =  1% 
--);
use R5APGMS;
go
	Create Table Userlogin(
	LoginInuserid int Identity(1,1) Primary key,
	USername VARCHAR(40) Not Null,
	Passwordtologin VARCHAR(40) Not Null,
	Secirtyquestion VARCHAR(100) Not Null,
	Secirtyanswer VARCHAR(100) Not Null , 
	Dateofaccountcreation DateTime default(Getdate()) Not Null ,
);
go 
 	Create Table botmotoring(
	BotId int Identity(1,1) Primary key,
	BOTAKA VARCHAR(40) Not Null,
	Adimhowhaspoweroverbot int,
	Foreign key (Adimhowhaspoweroverbot) References Userlogin(LoginInuserid),   
	BotResponsablefor VARCHAR(40) Not Null,
);
go 
 	Create Table Regoins(
	RegoinID int Identity(1,1) Primary key,
	Regoin int Not Null,
	Respopnsablebot int,
	Foreign key (Respopnsablebot) References botmotoring(BotId),  
	RegoinpowerRequerments VARCHAR(40) Not Null,
	RegoinAvgPowerconsampustion VARCHAR(40) Not Null,
	Regoinproritylevel VARCHAR(40), 
	RegoinThreashholdconsumtion  VARCHAR(40), 
	);
go
 	Create Table Reactordisrubtions(
	ReacatorcoreID int Identity(1,1) Primary key,
	ReacatorName VARCHAR(40) Not Null,
	RegoinResponsablefor int,
	Foreign key (RegoinResponsablefor) References Regoins(RegoinID),  
	Reacatorpowercabblities int,
	ReactorThreasholdTempture int,
	Reactorinservesinyears int, 
	Reactoroverclockingcabilitiesinpesent int ,
	reactordangerleve int, 
	);
	go
	 	Create Table Technistion(
	TechnistionID int Identity(1,1) Primary key,
	Techinstionname VARCHAR(40) Not Null,
	TechnistionSurname VARCHAR(40) Not Null,
	Reactorrespnosible int
	Foreign key (Reactorrespnosible) References Reactordisrubtions(ReacatorcoreID),  
	Technistiontraninglevel int,
	TechnistionRegion int,
	Foreign key (TechnistionRegion) References Regoins(RegoinID),  
	
	);
	go
		 	Create Table Admins(
	AdminID int Identity(1,1) Primary key,
	AdminName VARCHAR(40) Not Null,
	AdminSurname VARCHAR(40) Not Null,
	Userloginid int
	Foreign key (Userloginid) References Userlogin(LoginInuserid),
	);

