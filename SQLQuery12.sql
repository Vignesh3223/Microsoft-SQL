use Task12

--employee table creation

create table employee
(
empid int primary key,
first_name varchar(255),
last_name varchar(255)
)

--inserting values

insert into employee values(101,'Redin','Kingsly'),(102,'Stephen','Raj'),(103,'Anil','Chaudhary')

--select

select * from employee

--call outcome table creation

create table callout
(
callid int primary key,
outcome_text char(128)
)

--inserting values

insert into callout values (1,'Completed callout'),(2,'Ongoing Process')

--select

select * from callout

--country table creation

create table country
(
couid int primary key,
country_name char(128),
country_name_eng char(128),
country_code char(8)
)

--inserting values

insert into country values (1,'Amrica','America','US'),(2,'Britain','England','UK')

--select

select * from country

--city table creation

create table city
(
cityid int primary key,
cityname char(128),
lat decimal(9,6),
long decimal(9,6),
country_id int references country(couid)
)

--inserting values

insert into city values 
(1,'New York',40.7128,74.0060,1),
(2,'London',51.5072,0.1276,2),
(3,'California',36.7783,119.4179,1),
(4,'Liverpool',53.4084,2.9916,2)

--select

select * from city

--customer table creation

create table customer
(
custid int primary key,
cust_name varchar(255),
city_id int references city(cityid),
customer_address varchar(255),
next_calldate date,
ts_inserted datetime
)

--inserting values

insert into customer values
(11,'Albert',2,'134,church Rd','2023-04-02','2023-03-10 12:00:30 PM'),
(12,'Martina',3,'112,welsey Rd','2023-04-04','2023-03-12 01:30:00 PM')
insert into customer(custid,cust_name,city_id,customer_address,ts_inserted)values
(13,'Andrews',1,'112,Princeton Rd','2023-03-15 10:00:00 AM'),
(14,'Albert',4,'64,valor Rd','2023-03-22 05:00:00 PM')

--select

select * from customer

--call table creation

create table call
(
call_id int primary key,
employee_id int references employee(empid),
customer_id int references customer(custid),
start_time datetime,
end_time datetime,
callout_id int references callout(callid)
)

--inserting values

insert into call values
(1,102,13,'2023-03-13 02:00:00 PM','2023-03-15 05:00:00 AM',1),
(2,101,11,'2023-03-28 12:30:00 PM','2023-04-03 05:00:00 PM',2),
(3,103,14,'2023-03-13 02:00:00 PM','2023-03-15 05:00:00 AM',1),
(4,102,13,'2023-03-27 03:30:00 AM','2023-04-05 09:30:00 AM',2)

--select

select * from call
