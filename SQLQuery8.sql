use DB2

--marks table creation
create table Marks
(
studentid int,
studentname varchar(25),
semester varchar(25),
securedmarks int,
totalmarks int
)

--inserting values
insert into Marks values (1,'Arya','sem 1',450,500),
(2,'Bhagat','sem 2',470,500),
(3,'Divya','sem 3',445,500),
(4,'Esther','sem 4',420,500),
(5,'Guru','sem 2',390,500),
(6,'Inbha','sem 3',400,500),
(7,'John','sem 1',465,500),
(8,'Logan','sem 2',412,500),
(9,'Mani','sem 3',478,500),
(10,'Navya','sem 4',396,500)

--select
select * from Marks

--scalar function to find percentage
ALTER function calcpercent
(
@securedmarks int, @totalmarks int)
returns decimal (5,2)
as
begin
declare @percentage decimal (5,2)
set @percentage = CONVERT (decimal (5,2),@securedmarks) * 100 / @totalmarks
return @percentage
end

select dbo.calcpercent (374,500) as Percentage

--select for marks table
select studentid,studentname,semester,securedmarks,totalmarks,dbo.calcpercent(securedmarks,totalmarks) as Percentage 
from Marks

-- user-defined function to generate a table that contains result of Sem 3 students.
create function sem3(@semester varchar(25))
returns table 
as
return (select * from Marks where semester = @semester)

select * from sem3('sem 3')

--stored procedure to retrieve all student details with no parameter
create procedure marks1
as 
begin
select * from Marks 
order by securedmarks desc
end

exec marks1

--stored procedure to retrieve sem1 student details with one parameter
create procedure sem1 (@semester varchar(25))
as
begin
select * from Marks
where semester = @semester
end

exec sem1 @semester = 'sem 1' --or
exec sem1 'sem 1'

--stored procedure to retrieve total no of students details with output parameter
alter procedure students1 (@total int output)
as
begin
select @total = count(studentid) from Marks
end
declare @count int
exec students1 @count output
print 'The Total number of students is ' + convert(varchar(10), @count)

--backup table creation for sem1 students

select * into markbackup from Marks where semester = 'sem 1'

select * from markbackup

select * from Marks

--update statement

update Marks set studentname = 'Arjun' where studentid = 1

update Marks set studentname = 'Elango' where studentid = 4

--merge statement

merge markbackup a using Marks m
on (m.studentid = a.studentid)
when matched then update  set
a.studentname = m.studentname,
a.securedmarks = m.securedmarks,
a.totalmarks = m.totalmarks
when not matched by target then insert (studentid,studentname,securedmarks,totalmarks) values
(m.studentid,m.studentname,m.securedmarks,m.totalmarks)
when not matched by source then delete;
