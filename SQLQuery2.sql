--database creation
create database Batch1

use Batch1

--renaming database
 alter database [Batch1] modify name = [Employee]

--schema creation
create schema EmpDetails

--table creation with constraints
 create table EmpDetails.employee1
 (
 empid int primary key,
 empname varchar(25) not null,
 empage int check(empage > 18),
 designation varchar(25) default 'Trainee',
 address varchar(25) not null unique
 )

--inserting values
 insert into EmpDetails.employee1 values(11,'Arjun',20,'Designer','Coimbatore')

--select
 select * from EmpDetails.employee1

--constraint violations
  insert into EmpDetails.employee1 values(11,'Arya',20,'Designer','Coimbatore')
  insert into EmpDetails.employee1 values(12,'Bala',16,'Designer','Coimbatore')
  insert into EmpDetails.employee1 values(12,'Bala',16,'Designer','Chennai')
  insert into EmpDetails.employee1(empid,empname,empage,address) values (12,'Bala',22,'Chennai')

--renaming table
 exec sp_rename 'EmpDetails.employee1' , 'employees'

 select * from EmpDetails.employees

--renaming schema
 create schema Employee1

 alter schema Employee1 transfer EmpDetails.employees

 select * from Employee1.employees

--dropping schema
drop schema EmpDetails

--dropping table
drop table Employee1.employees

drop schema Employee1

--table creation
create table employees
(
EmpId int identity(1,1),
Empname varchar(25),
Salary int,
Increment int
)

--inserting values
insert into employees values('Karan',25000,4000)
insert into employees values('Mona',27000,4500)
insert into employees values('Rajiv',17000,3000)
insert into employees values('Rajay',18000,3000)

--select
select * from employees

--computed column
alter table employees add Revised_Salary as (Salary + Increment)

select Revised_Salary from employees

--select
select * from employees

--inserting more values
insert into employees values('Karishma',15000,2500)
insert into employees values('Prabhu',20000,3500)
insert into employees values('Deva',16000,2000)

--inserting records to another table
create table employeedata
(
EmpId int identity(1,1),
Empname varchar(25),
Salary int,
Increment int
)
select * from employeedata

insert into employeedata(EmpId,Empname,Salary,Increment)
select EmpId,Empname,Salary,Increment from employees
where Salary > 20000

set identity_insert employeedata on

--select
select * from employeedata

--schema creation
create schema Emp1

create table Emp1.employees
 (
 empid int primary key,
 empname varchar(25) not null,
 empage int check(empage > 18),
 designation varchar(25) default 'Trainee',
 address varchar(25) not null unique
 )

 --insert
 insert into Emp1.employees values (11, 'Navin',22,'Designer','Coimbatore')
 insert into Emp1.employees values (23, 'Xavier',22,'Developer','Madurai')

 --select
 select * from Emp1.employees