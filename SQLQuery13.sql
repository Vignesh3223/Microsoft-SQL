--databese creation

create database University

use University

--department table creation

create table department
(
dept_name varchar(25) primary key,
building varchar(20),
budget numeric(18,2)
)

--role table creation

create table _role
(
role_id int primary key,
role_name varchar(3),
role_full_name varchar(15)
)

--time-slot table creation

create table time_slot
(
time_slot_id int primary key,
days varchar(8),
start_time datetime,
end_time datetime,
)

--user table creation

create table _user
(
userid int primary key,
username varchar(16),
password varchar(40)
)

--finaid main table creation

create table finaid_main
(
aid_id int primary key,
name varchar(50),
category varchar(15)
)

--course table creation

create table course
(
class_id int primary key,
classname varchar(25),
dept_name varchar(25) references department(dept_name),
credits numeric(5,2),
description varchar(8000)
)


--section table creation

create table section
(
class_id int references course(class_id),
class_num int primary key,
semester varchar(7),
year int,
roomno varchar(6),
timeslot_id int references time_slot(time_slot_id),
capacity int
)

--requisite table creation

create table requisite
(
class_id int references course(class_id),
req_id int primary key,
type varchar(4)
)

--teaches table creation

create table teaches
(
user_id int references _user(userid),
class_id int references course(class_id),
class_num int references section(class_num),
semester varchar(7),
year int
)

--user salary table creation

create table user_salary
(
user_id int references _user(userid),
salary numeric(18,2)
)

--user balance table creation

create table user_balance
(
user_id int references _user(userid),
balance numeric(18,2)
)

--user role table creation

create table user_role
(
user_id int references _user(userid),
role_id int references _role(role_id)
)

--takes table creation

create table takes
(
user_id int references _user(userid),
class_id int references course(class_id),
class_num int references section(class_num),
semester varchar(7),
year int,
grade varchar(2)
)

--user number table creation

create table user_number
(
user_id int references _user(userid),
number numeric(15,0),
description varchar(15)
)

--user address table creation

create table user_address
(
user_id int references _user(userid),
address varchar(80),
apt_num varchar(15),
city varchar(25),
state varchar(2),
zip numeric(5,0),
description varchar(15)
)

--user finaid map table creation

create table user_finaid_map
(
user_id int references _user(userid),
aid_id int references finaid_main(aid_id),
semester varchar(7),
year int,
offered numeric(18,2),
accepted numeric(18,2)
)

--user email table creation

create table user_email
(
user_id int references _user(userid),
email varchar(50) primary key,
description varchar(15)
)

--hold main table creation

create table hold_main
(
user_id int references _user(userid),
hold_id int primary key,
name varchar(25),
description varchar(15)
)

--user hold map table creation

create table user_hold_map
(
user_id int references _user(userid),
hold_id int references hold_main(hold_id)
)