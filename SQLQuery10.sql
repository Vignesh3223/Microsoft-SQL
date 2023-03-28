--database creation

create database Task

use Task

--employees table creation

create table Employees
(
emp_id int primary key,
first_name varchar(15) not null,
last_name varchar(15) not null,
email varchar(30) not null,
phone_number bigint,
hire_date date,
job_id int null references Employees (emp_id),
salary int
)

--inserting values

insert into Employees values
(1,'Yamini','Priya','yamini@cgvakindia.com',9654401214,'2019-01-21',null,35000),
(2,'Harshan','A','harshan@cgvakindia.com',9345579047,'2020-03-07',null,32000),
(3,'Venkit','Raman','venkit@cgvakindia.com',7871007431,'2020-03-07',null,30000),
(4,'Divya','Prakash','divyaprakash@cgvakindia.com',8248482364,'2021-07-19',2,22000),
(5,'Vignesh','R','vignesh@cgvakindia.com',9360565312,'2021-07-19',1,20000),
(6,'Arun','Joseph','arunjoseph@cgvakindia.com',8148010527,'2022-03-06',3,18000),
(7,'Dhana','Prakash','dhanaprakash@cgvakindia.com',9074858902,'2022-06-01',1,12000),
(8,'Selva','Ganapathy','selva@cgvakindia.com',9003833481,'2022-06-01',1,10000),
(9,'Priya','Darshan','darshan@cgvakindia.com',9791970051,'2022-04-10',2,15000),
(10,'Sri','Kanth','srikanth@cgvakindia.com',9791970053,'2022-04-10',3,10000),
(11,'Harita','N','harita@cgvakindia.com',8754226105,'2022-04-10',2,20000),
(12,'Ranita','N','ranita@cgvakindia.com',8973186849,'2022-04-10',1,25000),
(13,'Harishmitha','K','harishmitha@cgvakindia.com',9475055528,'2022-12-01',3,18000),
(14,'Karthi','K','karthi@cgvakindia.com',6369965431,'2022-11-24',3,10000),
(15,'Siva','Bharat','siva@cgvakindia.com',6369188207,'2022-11-24',2,20000),
(16,'Hari','Karthik','harikarthik@cgvakindia.com',8778395384,'2023-01-21',1,18000),
(17,'Vasanth','Kumar','vasanth@cgvakindia.com',9791277458,'2023-01-21',null,15000),
(18,'Vikram','Kumar','vikram@cgvakindia.com',7868991603,'2023-02-12',null,15000),
(19,'Hemanth','Kumar','hemanth@cgvakindia.com',9345686304,'2023-02-12',3,10000),
(20,'Sharon','David','sharondavid@cgvakindia.com',8281915775,'2023-02-25',1,12000)

--select

select * from Employees


--display employees who earn more than id 16

select first_name, last_name from Employees where salary > ( select salary from Employees where emp_id = 16)


--display employees whose hire date is same as of id 11

select first_name, last_name, job_id from Employees where hire_date = (select hire_date from Employees where emp_id = 11)


--display employees who earn more than average salary

select emp_id,first_name, last_name from
(select avg(salary) as averagesalary from Employees) as e1, Employees as E
where E.salary > e1.averagesalary


--display employees who report to manager whose first name is Yamini

select emp_id,first_name, last_name, salary from Employees where job_id = 
(select emp_id from Employees where first_name = 'Yamini')


--display employees who salary range is between 2500 and smallest salary

select emp_id,first_name, last_name, email, phone_number, hire_date, job_id, salary from
(select min(salary) as smallestsalary from Employees) as e1, Employees as E
where E.salary between 2500 and e1.smallestsalary
