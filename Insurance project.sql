
--First, we have to create the database "insurance" :
 CREATE DATABASE Insurance;

--After creating the database, then we have to use that database.:
USE Insurance;

--Creating table Address_Details
CREATE TABLE Address_Details
    (
        Address_Id int primary key,
        H_No varchar(6),
        city varchar(50),
        AddressLine1 varchar(50),
        State varchar(50),
        Pin varchar(50)
     );

--Creating table User_Details
CREATE TABLE User_Details
    (    
        User_Id int primary key,
        FirstName varchar(50),
        LastName varchar(50),
        Email varchar(50),
        MobileNo varchar(50),
        Address_Id int references Address_Details(Address_Id),
        DOB date
     );

--Creating table Ref_Policy_Types
CREATE TABLE Ref_Policy_Types
    (
        Policy_Type_Code varchar(10) primary key,
        Policy_Type_name varchar(50)
    );

--Creating table policy_sub_types
CREATE TABLE Policy_Sub_Types
    (
        Policy_Type_Id varchar(10) primary key,
        Policy_Type_Code varchar(10) references         
        Ref_policy_Types(Policy_Type_Code),
        Description varchar(50),
        YearsofPayements int,
        amount numeric,
        MaturityPeriod int,
        MaturityAmount numeric,
        Validity int
     );

--Creating table User_Policies
CREATE TABLE User_Policies
    (
        Policy_No varchar(20) primary key,
        User_Id int references User_Details(User_Id),
        Date_Registered date,
        Policy_Type_Id varchar(10) references 
        Policy_Sub_Types(policy_Type_Id)         
    );

--Creating table Policy_Payments
CREATE TABLE Policy_Payments
    (
        ReceipNo int primary key,
        User_Id int references User_Details(User_Id),
        Policy_No varchar(20) references User_Policies(Policy_No),
        DateofPayment date,
        amount Numeric,
        fine numeric
    );

--Insert records into the Address_Details table:
INSERT INTO Address_Details values
(1, '6-21', 'Hyderabad', 'Salim ki gali', 'Andhra Pradesh',500003),
(2, '7-81', 'Chennai', 'Serusari', 'Tamilnadu', 600001),
(3, '3-71', 'Lucknow', 'Wajid bhai Road', 'Uttarpradesh', 226001),
(4, '4-81', 'NaviMumbai', 'Airoli', 'Maharashtra', 400708),
(5, '5-81', 'Bangalore', 'MG Road', 'Karnataka', 530068),
(6, '6-81', 'Ahamadabad', 'Street2', 'Gujarat', 320008),
(7, '9-21', 'Nashik', 'Trimurti Chowk', 'Maharashtra',422009);

--Insert records into the User_Details  table:
INSERT INTO User_Details values
(1111,'Raju','Reddy','raju@gmail.com','9854261456',5,'1986-04-11'),
(2222,'Javed','Khan','javedk@gmail.com','9854261463',1,'1990-04-11'),
(3333,'Naveen','Reddy','naveen@gmail.com','9854261496',2,'1985-03-14'),
(4444,'Raghav','Patil','raghavp@gmail.com','9854261412',4,'1985-09-21'),
(5555,'Harsha','Pandey','harsha@gmail.com','9854261445',3,'1992-10-11'),
(6666,'Amit','Shah','amits@ymail.com','9896954523',6,'1994-12-04');

--Insert records into the Ref_Policy_Types  table:
INSERT INTO Ref_Policy_Types values
('58934', 'Car'),
('58936', 'Bike'),
('58539', 'Home'),
('58969', 'Term'),
('58979', 'Health'),
('58683', 'Life');

--Insert records into the Policy_Sub_Types table:
INSERT INTO Policy_Sub_Types values
('6893','58934','Theft',1,10000,null,200000,1),
('6894','58934','Accident',1,50000,null,500000,3),
('6895','58539','Fire',1,50000,null,500000,3),
('6896','58683','Anand Life',7,50000,15,1500000,null),
('6897','58683','Sukh Life',10,5000,13,300000,null),
('6899','58936','Theft',1,5000,null,50000,1),
('6898','58936','Accident',1,2000,null,30000,3),
('6891','58979','Group Health',1,50000,null,2000000,1),
('6889','58979','Single Health',1,11000,null,500000,1);

delete from Policy_Sub_Types where Policy_Type_Id='6889'

insert into Policy_Sub_Types values('6889','58979','Single Health',1,11000,null,500000,1);

--Insert Records into the User_Policies table:
INSERT INTO User_Policies values
('689314',1111,'1994-04-18','6896'),
('689316',1111,'2012-05-18','6895'),
('689317',1111,'2012-06-20','6894'),
('689318',2222,'2012-06-21','6894'),
('689320',3333,'2012-06-18','6894'),
('689420',4444,'2012-04-09','6896'),
('689970',5555,'2018-12-19','6891'),
('689610',5555,'2022-09-27','6898'),
('689240',6666,'2020-04-09','6897'),
('689524',6666,'2021-07-15','6898'),
('689758',6666,'2021-07-09','6896'),
('689759',1111,'2021-09-09','6889'),
('689777',2222,'2022-01-09','6889');


--Insert records into the policy_payments table:

INSERT INTO Policy_Payments values
(121,4444,'689420','2012-04-09',50000,null),
(345,4444,'689420','2013-04-09',50000,null),
(300,1111,'689317','2012-06-20',20000,null),
(225,1111,'689316','2012-05-18',20000,null),
(227,1111,'689314','1994-04-18',50000,null),
(100,1111,'689314','1995-04-10',50000,null),
(128,1111,'689314','1996-04-11',50000,null),
(096,1111,'689314','1997-04-18',50000,200),
(101,1111,'689314','1998-04-09',50000,null),
(105,1111,'689314','1999-04-08',50000,null),
(120,1111,'689314','2000-04-05',50000,null),
(367,2222,'689318','2012-06-21',20000,null),
(298,3333,'689320','2012-06-18',20000,null),
(420,5555,'689970','2018-12-19',50000,500),
(451,5555,'689610','2022-09-27',2000,null),
(479,6666,'689240','2020-04-09',5000,null),
(099,6666,'689524','2021-07-15',2000,100),
(501,6666,'689758','2021-07-09',50000,null),
(125,1111,'689759','2021-09-09',11000,null),
(721,2222,'689318','2022-01-09',11000,null)


/*Problem 1:
Write a query to display the PolicyTypeId,PolicyTypeName,
description of all the car’s policy details.*/

--Solution:
SELECT P.Policy_Type_Id, R.Policy_Type_name, P.Description FROM Policy_Sub_Types P
JOIN Ref_Policy_Types R  
ON P.Policy_Type_Code = R.Policy_Type_Code 
WHERE R.Policy_Type_name ='car'; 


/* Problem 2:
Write a query to display the policytypecode,no of policies in 
each code with alias name NO_OF_POLICIES.*/

--Solution:
SELECT Policy_Type_Code, COUNT(Policy_Type_Code) As No_Of_Policies
FROM Policy_Sub_Types
GROUP BY Policy_Type_Code;

/*Problem 3:
Write a query to display the userid,firstname,lastname, email,mobileno, house no,
state who are residing in NaviMumbai.*/

--Solution:
SELECT UD.User_Id, UD.FirstName, UD.LastName, UD.Email, UD.MobileNo,AD.H_No,AD.State
FROM User_Details UD                                                  
JOIN Address_Details AD                                                 
ON UD.Address_Id=AD.Address_Id
WHERE AD.city='NaviMumbai'

/*Problem 4:
Write a query to display the userid, firstname lastname,
email,mobileno who has taken the health policies*/

--Solution:
SELECT UD.User_Id, UD.FirstName, UD.LastName, UD.Email, UD.MobileNo
FROM User_Details UD JOIN User_Policies UP on UD.User_Id = UP.User_Id                                        
JOIN Policy_Sub_Types PS on UP.Policy_Type_Id=PS.Policy_Type_Id                                              
JOIN Ref_Policy_Types RF on PS.Policy_Type_Code=RF.Policy_Type_Code                                              
WHERE RF.Policy_Type_name='Health';

--Problem 5:
/*Write a query to display the userid, firstname,last name who has taken the car 
policies but not home policies.*/
--Solution:
SELECT User_Id, FirstName, LastName	 
FROM User_Details
WHERE User_Id in
(SELECT User_Id FROM User_Policies where
Policy_Type_Id in
(SELECT Policy_Type_Id FROM Policy_Sub_Types
WHERE Policy_Type_Code=
(SELECT Policy_Type_Code FROM Ref_Policy_Types
WHERE Policy_Type_name='CAR')) AND
User_Id NOT in
(SELECT User_Id FROM User_Policies where
Policy_Type_Id in
(SELECT Policy_Type_Id FROM Policy_Sub_Types
WHERE Policy_Type_Code=
(SELECT Policy_Type_Code FROM Ref_Policy_Types
WHERE Policy_Type_name='HOME')))) ;


/*Problem 6:
Write a query to display the userid, firtsname, lastname,
city state whose city is ending with ‘bad’.*/

--Solution:
select ud.user_id,firstname,lastname,ad.city,ad.state from
user_details ud join address_details ad on
ud.address_id=ad.address_id
where ad.city like '%bad';


/*Problem 7:
Write a query to display the userid, firstname, lastname ,policyno, 
date of registered who has registered before 2020.*/
--Solution:
select up.user_id,firstname,lastname,policy_no, date_registered
from user_policies up join
user_details ud on
up.user_id=ud.user_id
where up.date_registered < '2020';

/*Problem 8:
Write a query to display the userid, firstname, lastname who has taken more
than one policies.*/

--Solution:
select ud.user_id,ud.firstname,ud.lastname from
user_details ud join
user_policies up on
ud.user_id=up.user_id
group by ud.user_id,ud.firstname,ud.lastname
having count(up.policy_type_id)>1;

/*problem 9: write query to diplay first name,lastname who has not taken policy
after 2015*/
select up.user_id,firstname,lastname,date_registered 
from user_policies up join
user_details ud on
up.user_id=ud.user_id
where up.date_registered in(select distinct Date_Registered from User_Policies
where Date_Registered >'2015')



Exec sp_help[Policy_Payments];

select * from Address_Details
select * from User_Policies
SELECT * FROM Ref_Policy_Types;

SELECT * FROM Policy_Sub_Types;

SELECT * FROM User_Policies;

SELECT * FROM User_Details;

SELECT USER_ID , CONCAT(FirstName,LastName) AS Full_Name , MobileNo
FROM User_Details
WHERE User_Id between 1111 AND 4444;

SELECT FirstName,LastName,DOB
FROM User_Details
WHERE LastName LIKE 'R%'

/* CREATE VIEW ON USER DETAILS , ADDRESS DETAILS*/
CREATE VIEW  USER_ADDRESS_DETAILS
AS
SELECT User_Id, FirstName, LastName,city,State,Pin
FROM User_Details UD JOIN Address_Details AD
ON UD.Address_Id=AD.Address_Id

SELECT * FROM USER_ADDRESS_DETAILS