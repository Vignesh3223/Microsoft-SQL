use Trainees

--table creation
create table Trainees
(
Trainee_ID int primary key,
First_Name varchar(25),
Last_Name varchar(25),
Salary int,
Joining_Date datetime,
Department varchar(25)
)

--inserting values
insert into  Trainees values(1,'Divya','Prakash',25000,'2023-01-22 10:30:00 AM','Developer')
insert into  Trainees values(2,'Vignesh','Ramasamy',25000,'2023-02-05 10:45:00 AM','Developer')
insert into  Trainees values(3,'Arjun','Venkitraman',65000,'2017-01-27 11:00:00 AM','Manager')
insert into  Trainees values(4,'Arun','Joseph',60000,'2020-01-27 11:00:00 AM','HR')
insert into  Trainees values(5,'Dhana','Prakash',35000,'2020-01-25 10:30:00 AM','Team Lead')
insert into  Trainees values(6,'Selva','Ganapathy',28000,'2023-02-01 10:00:00 AM','Designer')
insert into  Trainees values(7,'Priya','Darshan',28000,'2023-02-01 10:30:00 AM','Designer')
insert into  Trainees values(8,'Sri','Kanth',24000,'2023-01-29 12:30:00 PM','Tester')
insert into  Trainees values(9,'Karthi','Keyan',65000,'2019-02-25 12:00:00 PM','HR')
insert into  Trainees values(10,'Siva','Bharath',28000,'2021-04-30 01:30:00 PM','Tester')
insert into  Trainees values(11,'Sharon','David',60000,'2016-04-17 10:00:00 AM','Manager')
insert into  Trainees values(12,'Hari','Karthik',30000,'2023-01-31 10:30:00 AM','Designer')
insert into  Trainees values(13,'Vasanth','Kumar',25000,'2022-01-24 10:30:00 AM','Tester')
insert into  Trainees values(14,'Vikram','Kumar',30000,'2023-01-24 11:30:00 AM','Designer')
insert into  Trainees values(15,'Harshan','A',30000,'2023-01-28 02:30:00 PM','Designer')
insert into  Trainees values(16,'Hemanth','Kumar',25000,'2023-02-02 10:00:00 AM','Developer')
insert into  Trainees values(17,'Yamini','Priya',55000,'2019-07-24 10:30:00 AM','Manager')
insert into  Trainees values(18,'Harishmitha','K',35000,'2020-07-20 10:30:00 AM','Team Lead')
insert into  Trainees values(19,'Ranita','N',50000,'2017-05-14 10:30:00 AM','HR')
insert into  Trainees values(20,'Harita','N',35000,'2020-03-07 10:30:00 AM','Team Lead')

--select query
select * from Trainees

update Trainees set First_Name = 'SIVA',Last_Name = 'bharath' where Trainee_ID=10
update Trainees set First_Name = 'RANITA',Last_Name = 'n' where Trainee_ID=19
update Trainees set First_Name = 'KARTHI',Last_Name = 'keyan' where Trainee_ID=9
update Trainees set First_Name = 'PRIYA',Last_Name = 'darshan' where Trainee_ID=7

--like
select * from Trainees where First_Name like '[J-T]%' collate SQL_Latin1_General_CP1_CS_AS


--and
select * from Trainees where Salary >=  20000 and Salary <= 50000 

--between
select * from Trainees where Salary between 20000 and 50000

--like
select * from Trainees where First_Name like '%i'

--distinct
select distinct Salary from Trainees

--where
select * from Trainees where Department = 'Developer'

--select
select * from Trainees

--where
select * from Trainees where Department='Developer' or Department='Designer'

select * from Trainees where Trainee_ID < 5

--order by
select * from Trainees order by Trainee_ID offset 5 rows fetch next 10 rows only

select top 5 with ties Trainee_ID,First_Name,Department,Salary,Joining_Date from Trainees order by Salary desc

select * from Trainees order by Department desc
