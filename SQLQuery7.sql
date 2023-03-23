--datebase usage
use DB1

--Student table creation
create table Students
(
stu_id int identity(1,1),
stu_name varchar(25),
department varchar(20),
score numeric(4,2)
constraint pk_id primary key(stu_id),
constraint uk_id Unique(stu_name)
)

--inserting values
insert into Students(stu_name, department, score) values
('Ajay','BCA',87.45),
('Haarika','B.COM PA',85.6),
('Madhu','B.SC CS',87.45),
('Iniyan','BCA',75.0),
('Zoya','B.SC CS',95.25),
('Dhee','BCA',94.5),
('Naren','BCA',94.5),
('Shreya','B.COM PA',92.0),
('Elango','B.SC CS',85.25),
('Karthika','B.SC IT',97.5),
('Francis','B.COM IT',92.5),
('Umran','B.SC CS',77.85),
('Calvin','B.COM PA',90.63),
('Gayathri','B.SC CS',80.0),
('Xavier','B.SC IT',78.5),
('Jagan','B.COM IT',81.94),
('Bharti','B.SC IT',83.5),
('Logesh','B.COM PA',85.25),
('Vichu','BCA',78.5),
('Pragya','B.SC CS',75.0),
('Walter','B.COM IT',86.45),
('Ravin','BCA',80.0),
('Tanya','B.COM IT',95.5),
('Sam','B.SC IT',90.5),
('Yazmin','BCA',84.75)

--select
select * from Students

--creation of non-clustered index for department column
create index DEPT on Students(department asc)

--creation of filtered index for BCA department
create nonclustered index BCA on Students(department) where department = 'BCA'

--viewing of created indexes in database
exec sp_helpindex 'Students'

--view creation for BCA department
create view BCA_studs as select * from Students where department = 'BCA'

--select
select * from BCA_studs

--applying rank for students based on score
select stu_id,stu_name,department,score,rank() over (order by score desc) as Rank_Order from Students

select stu_id,stu_name,department,score,row_number() over (order by score desc) as Rank_Order from Students

--applying dense_rank for students in each department based on score
select stu_id,stu_name,department,score,dense_rank() over (partition by department order by score desc) as Rank_Order
from Students

--manager table creation
create table Manager
(
man_id int primary key,
man_name varchar(25) not null
)

--inserting values
insert into Manager values(1,'Rakesh'),(2,'Victor'),(3,'Keerthi')

--select
select * from Manager


--employee table creation
create table Employee
(
eid int primary key,
ename varchar(25) not null,
man_id int references Manager(man_id),
department varchar(25)
);

--inserting values
insert into Employee values 
(1,'Sneha',2,'Developer'),
(2,'Athira',3,'Tester'),
(3,'Navin',1,'Designer'),
(4,'Bala',2,'Developer'),
(5,'Lisa',1,'Designer'),
(6,'Charan',3,'Tester')


--select
select * from Employee

--complex view creation
create view empdata as 
select M.man_id, M.man_name, E.eid, E.ename, E.department from Employee as E full join Manager as M
on M.man_id = E.man_id

--select
select * from empdata

--on delete cascade on update set default
alter table Employee drop constraint [FK__Employee__man_id__1EA48E88]

alter table Employee drop column man_id

alter table Employee add man_id int default 2 constraint FK_Employee_man_id foreign key(man_id) references Manager(man_id)
on delete cascade on update set default

--select
select * from Employee

--updating values
update Employee set man_id = 1 where eid = 3 or eid = 5
update Employee set man_id = 2 where eid = 1 or eid = 4
update Employee set man_id = 3 where eid = 2 or eid = 6

--cascade update
update Manager set man_id = 5 where man_id = 1