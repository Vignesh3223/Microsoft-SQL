use Transact

--employee table creation

create table employee
(
empid int primary key,
firstname varchar(25),
lastname varchar(25),
designation varchar(25)
)

--inserting values

insert into employee values
(101,'Siddarth','Malhotra','Designer'),
(102,'Vivek','Oberoi','Designer'),
(103,'Sunil','Shetty','Developer'),
(104,'Kiara','Advani','HR'),
(105,'Varun','Dhawan','Developer')

--select

select * from employee

--DML trigger to restrict DML oprations on saturday and sunday

create trigger DMLoperations on employee
for insert,update,delete as begin
if DATEPART(DW,GETDATE())= 1 or DATEPART(DW,GETDATE())= 7
begin
print 'DML operations are restricted on Saturday and Sunday'
rollback transaction
end
end

insert into employee values
(108,'Sanjay','Dutt','Developer')


-- DML trigger to restrict delete operation between 11:00AM to 15:00PM

create trigger DMLoperations2 on employee
for delete as begin 
if DATEPART(HH,GETDATE()) > 11 or DATEPART(HH,GETDATE()) < 15 
begin
print 'Cannot perform Delete operation in this time'
rollback transaction
end
end

delete from employee where empid = 105
delete from employee where empid = 107


-- DDL trigger to show notification whenever a create operation is performed.

create trigger DDLcreate on Database for create_table
as begin
print 'You created a table'
end

create table book
(
bookid int primary key,
bookname varchar(50),
author varchar(30),
price numeric(5,2)
)

-- DDL trigger to show notification whenever a alter operation is performed.

create trigger DDLalter on Database for alter_table
as begin
print 'You altered a table'
end

alter table book drop column price

-- DDL trigger to show notification whenever a rename operation is performed.

create trigger DDLrename on Database for rename
as begin
print 'You renamed a table'
end

sp_rename 'Book' ,'Book_details' 

-- DDL trigger to show notification whenever a drop operation is performed.

create trigger DDLdrop on Database for drop_table
as begin
print 'You dropped a table'
end

drop table Book_details

--another method

create trigger DDLoperations on Database for create_table , alter_table , rename , drop_table
as begin
print 'You performed a DDL operation on this database'
end

create table studs
(
rno int primary key,
sname varchar(20),
dept varchar(10)
)

alter table studs add phone bigint

drop table studs
