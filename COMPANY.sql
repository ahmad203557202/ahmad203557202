create database company 
use company 
go 

/* Personal informatian of employee */ 
----------------1-------------------
create table [Person-Employee] (
     [Employee_ID]  int,
	 [FirstName] varchar(20) NOT NULL,
	 [LastName] varchar(20) NOT NULL ,
	 [Address 1 (Mail)]  varchar(50) NOT NULL,
	 [Address 2 (Home)]  varchar(50) NOT NULL,
	 [Martal Status]  varchar(10) Not Null,
	 [Gender]  varchar(10) Not Null,
	 [number of children up to age 18]  INT  NULL,
	 [Team_ID] INT NULL,
	 [Employee hour price] Decimal(3,2)NOT NULL, 
	 Primary key (Employee_ID));

	 alter table[Person-Employee] add  
	 FOREIGN KEY (Team_ID) REFERENCES [Team](Team_ID);

	 select * from [Person-Employee];

	 ---------------------2-------------------
	 create table children (
     Child_ID  int ,
	 [FirstName] varchar(20) NOT NULL,
	 Employee_ID  int  ,
	 [Date Of Birth] date NOT NULL ,
	 [Residential address] varchar(50) NOT NULL ,
	 age int Not Null,
	 Primary key (Child_ID), 
	 FOREIGN KEY (Employee_ID) REFERENCES [Person-Employee](Employee_ID) );
	 
	 select * from children;

	 ----------------------3----------------------
	 	 create table spouse (
     spouse_ID  int  ,
	 FirstName varchar(20) NOT NULL,
	 LastName varchar(20) NOT NULL ,
	 [Address] varchar(50) NOT NULL ,
	 Employee_ID  int NOT NULL ,

	 Primary key (spouse_ID),
	 FOREIGN KEY (Employee_ID) REFERENCES [Person-Employee](Employee_ID) );

	 select * from spouse;

	 -----------------------4---------------
	 	 	 create table [TAX credits points]  (
     Employee_ID  int   ,
	 [gender points]  Decimal (1,1) NOT NULL,
	 [child points] Decimal(2,1) Null ,
	 [total tax credits points] Decimal (2,2) NOT NULL ,
	
	 Primary key (Employee_ID), 
	 FOREIGN KEY (Employee_ID) REFERENCES [Person-Employee](Employee_ID) );

	 select * from [TAX credits points];
	 drop table [TAX credits points];
	 /**************Client****************/
	 ------------1--------------------
	 	 	 	 create table [Person-Client]  (
     Client_ID  int    ,
	 FirstName varchar(20) NOT NULL,
	 LastName varchar(20) NOT NULL,
	 [Company Address (Foreign or local)]varchar(10) NOT NULL,
	
	 Primary key (Client_ID) );

	 select * from [Person-Client];

	 --------------------2---------------------
	 	 	 	 	 create table [Project Center]  (
     Project_ID int NOT NULL ,
	 client_ID int NOT NULL ,
	 ProjectName varchar(20) NOT NULL,
	 [Date Of Birth] date NOT NULL,
	 [Type Of Cake] varchar(20) NOT NULL,
	 [Address] varchar(50) NOT NULL,
	 [Big Clint] /* ( yes/ no )( if its has more than one project ID )*/ varchar(50) NOT NULL,
	 [senior manager_ID] /* ( if it is big client)*/  INT NULL,

	 Primary key (Project_ID), 
	 FOREIGN KEY (client_ID) REFERENCES [Person-Client](client_ID),
	 FOREIGN KEY ([senior manager_ID]) REFERENCES [Person-Employee](Employee_ID) );
	

	 select * from [Project Center];

	 --------------------3------------------------
	 	 	 	 	 	 create table Team  (
     Team_ID  int   ,
	 Team_Name varchar(20) NOT NULL ,
	 TeamManager_ID  int  NOT NULL,
	 Client_ID int   NOT NULL,
	 
	 Primary key (Team_ID));

	 alter table Team  ADD  FOREIGN KEY (client_ID) REFERENCES [Person-Client](client_ID);
	ALTER TABLE Team ADD  FOREIGN KEY (TeamManager_ID) REFERENCES [Person-Employee](Employee_ID); 
	 select * from Team;

	 ------------------4--------------------------
	 	 	 create table [Employee Time Sheet]  (
	 [E-T-M]  int  NOT NULL,
     Employee_ID  int  NOT NULL  ,
	 client_ID int NOT NULL,
	 Project_ID int NOT NULL,
	 [Date] DATE NOT NULL,
	 [StartTime] Time(7) NOT NULL,
	 [EndTime] Time(7) NOT NULL,
	 WorkHours INT NoT NULL,
	 	 /* At Saturday(# of hours  *1.5 )  (  extra 50%) Decimal (2,2) null
	 At holidays (# of hours  *2.2 )  (  extra 120%) Decimal (2,2) null
	 Saturday at holidays ( # of hours * 2.5 ) (  extra 150%) Decimal (2,2) null
	 Normal days (# of hours ) Decimal (2,2) null
	 total hours  (SUM  of hours  by the date ) Decimal (3,2) null */
	 [Address of client office for meating]  varchar(50) NOT NULL,
	 [Address of consulting office Address ] varchar(50) NOT NULL,
	 [Distance in Km] int not null,
	 Primary key ([E-T-M],Employee_ID),
	 FOREIGN KEY (Employee_ID) REFERENCES [Person-Employee](Employee_ID),
	 FOREIGN KEY (client_ID) REFERENCES [Person-Client](client_ID),
	 FOREIGN KEY (Project_ID) REFERENCES [Project Center](Project_ID));

	 select * from [Employee Time Sheet];

	 ---------------5----------------
	 -------- to conform the employee insert data -----------
	 	 	 	 create table [Client Time Sheet]  (
	 [C-T-M]  int  NOT NULL,
	 client_ID int NOT NULL,
	 Project_ID int NOT NULL,
	 [Date Of Meating]  DATE NOT NULL,
	 [StartTime] Time(7) NOT NULL,
	 [EndTime] Time(7) NOT NULL,
	 [Hours Of Meating] INT NoT NULL,
	 [Address of client office for meating]  varchar(50) NOT NULL,
	 	 /* At Saturday(# of hours  *1.5 )  (  extra 50%) Decimal (2,2) null
	 At holidays (# of hours  *2.2 )  (  extra 120%) Decimal (2,2) null
	 Saturday at holidays ( # of hours * 2.5 ) (  extra 150%) Decimal (2,2) null
	 Normal days (# of hours ) Decimal (2,2) null
	 total hours  (SUM  of hours  by the date ) Decimal (3,2) null */
	 Primary key ([C-T-M]),
	 FOREIGN KEY (client_ID) REFERENCES [Person-Client](client_ID),
	 FOREIGN KEY (Project_ID) REFERENCES [Project Center](Project_ID));

	 select * from [Client Time Sheet];

---------------6-----------------
create table [cost of travel]  (
     Client_ID  int   ,
	 Project_ID int NOT NULL ,
	 [Distance in Km] int not null,
	 [Convert Distance to time ( Time of Travel )] Time(7) not null,
	
  PRIMARY KEY(Client_ID, Project_ID),
  FOREIGN KEY (client_ID) REFERENCES [Person-Client](client_ID) ON DELETE CASCADE,
  FOREIGN KEY (Project_ID) REFERENCES [Project Center](Project_ID) ON DELETE CASCADE);

	 select * from [cost of travel];

---------------7----------------------
create table [Total work hours calculates ]  (
     Employee_ID  int   ,
	 [E-T-M]  int  NOT NULL,
	 [Date] DATE NOT NULL,
	 [T.W.H] int not null,
  PRIMARY KEY(Employee_ID ),
   FOREIGN KEY (Employee_ID) REFERENCES [Person-Employee](Employee_ID) ON DELETE CASCADE );

   ----------8----------------
   CREATE table salary (
   Employee_ID  int  NOT NULL,
   [total hours per month] time(7) not null /*( sum all total hours where date like '__/mm/__')*/,
   [TeamManager extra] /*( if the Emp_ID = TeamManager_ID Then (total hours * 1.32)*/ Decimal(3,2) NULL,
    [total working hours per month]/* (official working hours per month = #) ( if #< total hours per month extra 30 % ales set the same )*/ Decimal(3,2) NULL,
	[Total working hours] Decimal (2,2) NOT NULL,
	[Discount Tax credits points]/* ( each point = 216 sh)*/Decimal (2,2) NOT NULL,
	[Total salary] /* [ ( Total working hours *  Employee hour price ) -  Discount Tax pints ] */float not null,
	PRIMARY KEY(Employee_ID ),
	   FOREIGN KEY (Employee_ID) REFERENCES [Person-Employee](Employee_ID) ON DELETE CASCADE );
	
--------------------9----------------
   CREATE table [Client Fees ] (
   Client_ID  int   NOT NULL,
    [total Meating hours per month] Decimal (2,2) not  NULL,
	[Convert Distance to time ( Time of Travel )] Decimal (2,2) NOT NULL,
	
	[Total fees] /* [ ( Total working hours *  Employee hour price )*/
	float not null,
	PRIMARY KEY(Client_ID ),
	FOREIGN KEY (client_ID) REFERENCES [Person-Client](client_ID) ON DELETE CASCADE
	);






















CREATE TABLE myTable ( col1 int, createdDate datetime DEFAULT(getdate()), updatedDate datetime DEFAULT(getdate()) )
createdDate datetime DEFAULT(getdate())
