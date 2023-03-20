use Trainees

--Worker table creation
CREATE TABLE Worker 
(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)

--inserting values
INSERT INTO Worker VALUES
(001, 'Arjun', 'Reddy', 65000, '2000-06-22', 'Accounts'),
(002, 'Niharika', 'Verma', 80000, '2000-02-02', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2000-02-02', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2000-02-02', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2000-02-02', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin');

--select
select * from Worker 

--Bonus table creation
CREATE TABLE Bonus 
(
WORKER_REF_ID INT, 
BONUS_AMOUNT INT, BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)ON DELETE CASCADE
)

--inserting values
INSERT INTO Bonus VALUES
(001,	5000,	'2016-02-02'),
(002,	3000,	'2016-06-01'),
(003,	4000,	'2016-02-02'),
(001,	4500,	'2016-02-02'),
(002,	3500,	'2016-06-01');

--select
select * from Bonus

--Title table creation
CREATE TABLE Title
(
WORKER_REF_ID INT, 
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME, 
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
)

--inserting values
INSERT INTO Title VALUES
(001, 'Manager', '2016-02-20'),
(002, 'Executive', '2016-06-11'),
(008, 'Executive', '2016-06-11'),
(005, 'Manager', '2016-06-11'),
(004, 'Asst. Manager', '2016-06-11'),
(007, 'Executive', '2016-06-11'),
(006, 'Lead', '2016-06-11'),
(003, 'Lead', '2016-06-11');

--select
select * from Title

--displaying First_name alias Worker_Name

select FIRST_NAME as Worker_Name from Worker

--displaying First_name in Uppercase

select UPPER(FIRST_NAME) from Worker

--displaying unique values of department

select distinct(DEPARTMENT) from Worker

--printing first three letters of First_name

select SUBSTRING(FIRST_NAME,1,3) from Worker

--printing unique values of department and its length

select distinct(DEPARTMENT),len(DEPARTMENT) as Length from Worker 

--printing First_Name and Last_Name as Complete_Name with space

select FIRST_NAME + SPACE(1) + LAST_NAME as Complete_Name from Worker

--printing the details of worker whoses First_Name is Vipul and Satish

select * from Worker where FIRST_NAME like 'Vipul' or  FIRST_NAME like 'Satish'

--printing the details of workers of ADMIN Department

select * from Worker where DEPARTMENT = 'Admin'

--printing the details of worker whoses First_Name ends with 'a'

select * from Worker where FIRST_NAME like '%a'

--printing the details of worker whoses First_Name contains 'a'

select * from Worker where FIRST_NAME like '%a%'
