--Using Database
use Test

--Trainees table creation
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)

--inserting values
INSERT INTO Trainees VALUES
(001, 'Arjun', 'Reddy', 75000, '2023-03-20', 'Accounts'),
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20','Accounts'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Accounts'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin')

--select
select * from Trainees

--printing number of employees (count) in each department
select count(First_Name) as 'No of employees' , DEPARTMENT from Trainees group by DEPARTMENT

--printing Induction day from Date of joining
select (TRAINEE_ID),(FIRST_NAME),DATEADD(DD, 5, JOINING_DATE) as 'Induction Day' from Trainees 

--printing the joining month in characters
select TRAINEE_ID,JOINING_DATE,
CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
'July','August','September','October','November','December') as Joining_month from Trainees

--printing the total and subtotal salary of each department
select COALESCE(DEPARTMENT, 'All Departments Total') as DEPARTMENT, SUM(SALARY) as TotalSalary  
from Trainees group by rollup (DEPARTMENT)

--printing the top 3 records in random order
select top 3 * from Trainees order by NEWID()

--case
select TRAINEE_ID,FIRST_NAME,SALARY,
case DEPARTMENT
when 'Accounts' then 'CG-VAK Accounts Department'
when 'Admin' then 'CG-VAK Admin Department'
else 'CG-VAK HR Department'
end as DEPARTMENT
from Trainees

--searched case
select TRAINEE_ID,FIRST_NAME,SALARY,
case
when SALARY > 100000 then 'Senior Employee'
when SALARY > 75000 then 'Junior Employee'
else 'Trainee'
end as Employee_status from Trainees

--IIF
select TRAINEE_ID,FIRST_NAME,DEPARTMENT,iif(SALARY > 100000 , 'Senior Employee', 'Junior Employee') as Employee_level
from Trainees

--composite key and identity insert
create table Students
(
rno int identity(1,1),
sname varchar(25),
department varchar(25),
constraint pk_id Primary Key(rno),
constraint uk_id_name Unique (sname)
)

--inserting values
insert into Students(sname,department) values ('Billa' ,'BCA'), ('Calvin' ,'BCA'),('David' ,'BCA'),('James' ,'BCA')

--select
select * from Students

--indentity insert on
set identity_insert Students on

--inserting values
insert into Students(rno,sname,department) values(5,'Kiwi','BCA'),(6,'Lorenzo','BCA')

--select
select * from Students

--indentity insert off
set identity_insert Students off

--inserting values
insert into Students(sname,department) values ('Martin','BCA'),('Naren','BCA')

--select
select * from Students

--Sequence creation
create sequence [dbo].[SeqObj]
as int
start with 1 
increment by 1 

--current sequence
select * from sys.sequences where name = 'SeqObj'

--setting value for sequence
select next value for [dbo].[SeqObj]

--Faculty table creation
create table Faculty
(
ID int primary key,
FacName varchar(25),
Gender varchar(25)
)

--inserting values using sequence
insert into Faculty values(next value for [dbo].[SeqObj],'Raju','Male')
insert into Faculty values(next value for [dbo].[SeqObj],'Stella','Female')

--select
select * from Faculty

--altering sequence
alter sequence [SeqObj] restart with 1

--inserting values using sequence
insert into Faculty values(next value for [dbo].[SeqObj],'Wasim','Male')
insert into Faculty values(next value for [dbo].[SeqObj],'Julie','Female')

--dropping sequence and table
drop sequence SeqObj
drop table Faculty

--datebase DB1 creation
create database DB1

use DB1

--schema creation
create schema Trainees

--table creation
create table Trainees.Batch35
(
Trainee_ID int primary key,
TName varchar(25),
Designation varchar(25)
)

--inserting values
insert into Trainees.Batch35 values (011,'Antony','Developer'),(012,'Billa','Designer'),(013,'Christopher','Tester')

--select
select * from Trainees.Batch35

--datebase DB2 creation
create database DB2

use DB2

--synonym creation for table in DB1
create synonym b35 for DB1.Trainees.Batch35

--inserting values 
insert into b35 values (014,'Danny','Developer'),(015,'Elisa','Tester')

--select
select * from b35