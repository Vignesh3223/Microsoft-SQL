--database creation
create database Test

use Test

--schema creation
create schema Batch35

--table creation
create table Batch35.Trainees
(
TID int primary key,
TName char(25) not null unique,
Department varchar(25) default 'Trainee',
TAge int check(TAge > 18),
Salary int
)

--insert values
insert into Batch35.Trainees values(11,'Bala','Developer',20,6000)
insert into Batch35.Trainees values(12,'Dinesh','Designer',20,6000)
insert into Batch35.Trainees values(13,'Edwin','Tester',20,6000)
insert into Batch35.Trainees(TID,TName,TAge,Salary) values(15,'Gopi',20,6000)

--select
select * from  Batch35.Trainees

--synonym creation
create synonym B35_Train for Batch35.Trainees

--select
select * from  B35_Train

--Department table creation
create table Department
(
DeptID int primary key,
DeptName varchar(25)
)

--inserting values into Department
insert into Department values(100,'Development')
insert into Department values(101,'UI/UX')

--select 
select * from Department

--Address table creation
create table Address
(
AddressID int primary key,
City varchar(25),
State varchar(25),
Pincode int
)
--inserting values into Address
insert into Address values(1,'Mannford','Oklahoma(OK)',74044),(2,'Sidney','Ohio(OH)',45365)

--select 
select * from Address

--Employee table creation
create table Employee
(
EID int primary key,
EName varchar(25) not null unique,
Designation varchar(25) not null,
DeptID int references Department(DeptID),
Mobile1 bigint,
Mobile2 bigint,
Street_Address varchar(30),
AddressID int references Address(AddressID)
)

--inserting values
insert into Employee values(1,'John','Developer',100,9845501871,6369743102,'234 Hinton Rd',1)
insert into Employee(EID,EName,Designation,DeptID,Mobile1,Street_Address,AddressID) values(2,'Jamie','Designer',101,8752660414,'214 Doorley Rd',2)
insert into Employee values(3,'Jack','Developer',100,9897655034,7871007431,'236 Hinton Rd',1)
insert into Employee(EID,EName,Designation,DeptID,Mobile2,Street_Address,AddressID) values(4,'Mick','Developer',100,6369987541,'264 Doorley Rd',2)
insert into Employee values(5,'Ramon','Designer',101,9790536214,7593455271,'204 Doorley Rd',2)

--select
select * from Department
select * from Address
select * from Employee