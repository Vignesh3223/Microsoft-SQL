create database Transact

use Transact

--student table creation

create table student(
regno int primary key,
sname varchar(20) unique
)

--auto-commit values

insert into student values(1,'Akshay'),(2,'Arthi')

--select

select * from student

--when any constraint is violated it will automatically rollback (does not accept any values)

insert into student values(2,'Arun')
	--here the primary key is violated so it will automatically rollback

--inserting values

insert into student values (3,'Bala'),(4,'Cathy'),(5,'Danya')

--select

select * from student

--Implicit transcation

set implicit_transactions on
update student set sname='Bala' where regno = 3
update student set sname='Barani' where regno = 4
select iif(@@options & 2 = 2,
'Implicit transaction mode ON',
'Implicit transaction mode OFF') as 'Transaction Mode'
select
    @@trancount as OpenTransactions 
commit tran
select
    @@trancount as OpenTransactions

set implicit_transactions off

--Explicit transactions

--Only Commit - insert statement

begin tran
insert into student values (6,'Eli')
select
    @@trancount as OpenTransactions 
commit tran
select
    @@trancount as OpenTransactions

--Only Rollback - update statement

begin tran
update student set sname='Esther' where regno=6
select * from student
rollback tran
select * from student where regno=6

-- Savepoint - commit update and insert statements, rollback delete statement

begin tran
insert into student values(10,'Karthika')
save tran insertstatement
delete from student where regno = 2
select * from student
rollback tran insertstatement
select * from student
update student set sname = 'Divya' where regno = 5
commit tran
select * from student

