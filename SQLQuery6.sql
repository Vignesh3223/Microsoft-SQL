--database usage

use DB2

--Salesman table creation
create table Salesman
(
salesman_id int primary key,
name varchar(25) not null,
city varchar(25) not null,
commission decimal (4,2)
)

--inserting values
insert into Salesman values 
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12)

--select
select * from Salesman

--Customer table creation
create table Customer
(
customer_id int primary key,
cust_name varchar(25) not null,
city varchar(25) not null,
grade int,
salesman_id int 
)

--inserting values
insert into Customer values 
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007)

insert into Customer(customer_id,cust_name,city,salesman_id)values(3001,'Brad Guzan','London',5005)

--select
select * from Customer

--orders table creation
create table Orders
(
ord_no int primary key,
purch_amt decimal (4,2),
ord_date date,
customer_id int,
salesman_id int
)
--alter table 
alter table Orders alter column purch_amt numeric (8,2)

insert into Orders values 
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70013,75.29,'2012-08-17',3003,5007),
(70011,3045.6,'2012-04-25',3002,5001)

--select
select * from Orders

--retrieving records of salesperson and customer residing in the same city
select C.customer_id , C.cust_name, S.salesman_id, S.name, C.city from
Customer as C inner join Salesman as S on S.city = C.city

--retrieving records of salesperson who receive commission more than 12%
select C.customer_id , C.cust_name, S.salesman_id, S.name, C.city, S.commission from
Customer as C full join Salesman as S on S.salesman_id = C.salesman_id where S.commission > 0.12

select C.customer_id , C.cust_name, S.salesman_id, S.name, C.city, S.commission from
Customer as C cross join Salesman as S where S.commission > 0.12

select C.customer_id , C.cust_name, S.salesman_id, S.name, C.city, S.commission from
Customer as C left join Salesman as S on S.salesman_id = C.salesman_id where S.commission > 0.12

select C.customer_id , C.cust_name, S.salesman_id, S.name, C.city, S.commission from
Customer as C right join Salesman as S on S.salesman_id = C.salesman_id where S.commission > 0.12

--retrieving records of orders 
select C.cust_name, C.grade, O.ord_no, O.ord_date, O.purch_amt , S.salesman_id, S.commission from
Customer as C full join Orders as O on C.customer_id = O.customer_id full join Salesman as S on O.salesman_id = S.salesman_id

select C.cust_name, C.grade, O.ord_no, O.ord_date, O.purch_amt , S.salesman_id, S.commission from
Customer as C cross join Orders as O cross join Salesman as S where C.customer_id = O.customer_id and O.salesman_id = S.salesman_id

--retrieving records of orders where the order amt is between 500 and 2000
select C.cust_name,C.city, O.ord_no, O.purch_amt from Customer as C inner join Orders as O on C.customer_id = O.customer_id 
where O.purch_amt >= 500 and O.purch_amt <= 2000

select C.cust_name,C.city, O.ord_no, O.purch_amt from Customer as C full join Orders as O on C.customer_id = O.customer_id 
where O.purch_amt between 500 and 2000

select C.cust_name,C.city, O.ord_no, O.purch_amt from Customer as C cross join  Orders as O where O.purch_amt between 500 and 2000

--retrieving records of customer and salesman and displaying them based on Customer names in ascending order
select C.customer_id, C.cust_name, C.city, C.grade, S.salesman_id, S.name from Customer as C 
full join Salesman as S on S.salesman_id = C.salesman_id order by C.cust_name

select C.customer_id, C.cust_name, C.city, C.grade, S.salesman_id, S.name from Customer as C 
cross join Salesman as S where S.salesman_id = C.salesman_id order by C.cust_name
