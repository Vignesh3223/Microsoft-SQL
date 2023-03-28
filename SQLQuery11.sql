use Task

--student table creation

create table Students
(
sid int primary key,
sname varchar(25),
department varchar(15),
yearofcompletion int
)

--inserting values

insert into Students values 
(1,'Vignesh','BCA',2023),
(2,'Sharan','BCOM',2023),
(3,'Sharon','BSC',2023),
(4,'Manoj','BSC',2022),
(5,'Sri Ram','BCOM',2022),
(6,'Arun','BBA',2024),
(7,'Sabari','BCA',2025),
(8,'Vishnu','BSC',2023),
(9,'Shyam','BCA',2025),
(10,'Krithik','BCOM',2025),
(11,'Hari','BCOM',2022),
(12,'Chander','BCOM',2023),
(13,'Vardhan','BBA',2024),
(14,'Aakash','BSC',2024),
(15,'Srini','BCA',2023),
(16,'Deepak','BSC',2022),
(17,'Abishek','BBA',2024),
(18,'Nishanth','BCOM',2024),
(19,'Arjun','BCOM',2022),
(20,'Sri Hari','BCA',2023)

--select

select * from Students


--pivot based on department

select yearofcompletion, BCA,BSC,BCOM,BBA from (select sid,department,yearofcompletion from Students) as Table1
pivot (count(sid) for department in (BCA,BSC,BCOM,BBA)) as Table2 order by yearofcompletion


--pivot based on year

select department , [2022],[2023],[2024],[2025] from (select sid,department,yearofcompletion from Students) as Table1
pivot (count(sid) for [yearofcompletion] in ([2022],[2023],[2024],[2025])) as Table2


--unpivot based on department

select department, yearofcompletion, stu_count from (select yearofcompletion, BCA,BSC,BCOM,BBA from 
(select sid,department,yearofcompletion from Students) as Table1
pivot (count(sid) for department in (BCA,BSC,BCOM,BBA)) as PivotTable1)P1
unpivot
(
stu_count for department in (BCA,BSC,BCOM,BBA)) as UnpivotTable1


--unpivot based on year

select department, yearofcompletion, stu_count from (select department , [2022],[2023],[2024],[2025] from 
(select sid,department,yearofcompletion from Students) as Table2
pivot (count(sid) for [yearofcompletion] in ([2022],[2023],[2024],[2025])) as PivotTable2)P2
unpivot
(
stu_count for [yearofcompletion] in ([2022],[2023],[2024],[2025])) as UnpivotTable2


--department table creation

create table Department
(
ID int primary key,
Dname varchar(35)
)

--inserting values

insert into Department values
(100 , 'Computer Science'),
(101 , 'Computer Applications'),
(102 , 'Commerce'),
(103 , 'Arts')


--select

select * from Department


--books table creation

create table Books
(
bk_id int primary key,
category varchar(25)
)

--inserting values

insert into Books values
(1001 , 'Science Fiction'),
(1002 , 'Accountancy'),
(1003 , 'Latest Technologies'),
(1004 , 'World Economy'),
(1005 , 'Research Analysis'),
(1006, ' Literature & Epics')

--select

select * from Books

--library table creation

create table Library
(
st_id int primary key,
st_name varchar(25),
st_deptid int references Department(ID),
book_id int references Books(bk_id)
)


--inserting values

insert into Library values
(11,'Rajesh',101,1003),
(12,'Kavya',103,1006),
(13,'Saarah',100,1001),
(14,'Aadhi',102,1004),
(15,'Krishna',100,1005)

--select

select * from Library

--on update set default

alter table Library drop constraint [FK__Library__book_id__797309D9]

alter table Library drop column book_id

alter table Library add book_id int default 1001 constraint FK_Library_book_id foreign key(book_id) references
Books(bk_id) on delete cascade on update set default


--select

select * from Department
select * from Books
select * from Library


--updating values

update Library set book_id = 1003 where st_id = 11 
update Library set book_id = 1006 where st_id = 12
update Library set book_id = 1001 where st_id = 13
update Library set book_id = 1002 where st_id = 14
update Library set book_id = 1005 where st_id = 15

--update set default

update Books set bk_id = 1007 where bk_id = 1003

insert into Library values (16,'Yasmin',101,1005)

update Books set bk_id = 1008 where bk_id = 1005