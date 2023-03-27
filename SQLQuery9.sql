use DB2

--conditional operator in stored procedure to serach for a record
create procedure sname_finder (@studentname varchar(25))
as begin
if ((select studentname from Marks where studentname = @studentname)=@studentname)
begin
print 'The student ' + @studentname + ' is present in the table'
end
else
begin
print 'The student ' + @studentname + ' is not present in the table'
end
end

exec sname_finder 'Arjun'

exec sname_finder 'Roopa'

--giving remarks using case statement

create procedure remarks with encryption as
begin
select studentid,studentname,semester,securedmarks,
case 
when securedmarks > 470 then 'Good ! keep it up'
when securedmarks > 420 then 'Good ! try to improve'
when securedmarks > 350 then 'Need to improve'
end as 'Remarks' from Marks
end

exec remarks

--table variable local

declare @x int
set @x = 5
print 'the value of x : ' + convert(varchar,@x)

--table variable global

declare @@y int
set @@y = 100
print 'the value of y : ' + convert(varchar(3),@@y)

--local table

create table #details
(
 userid int,
 name varchar(20), 
 dept varchar(20)
)

insert into #details values(101,'Daya','BCA'),(102,'Jeeva','BCA')

select * from #details

--global table

create table ##details1
(
 userid int,
 name varchar(20), 
 dept varchar(20)
)

insert into ##details1 values(101,'Arun','BCA'),(102,'Victor','BCA')

select * from ##details1

--local procedure

create procedure #local
as begin
print 'I am a Local procedure'
end

exec #local
 
--global procedure

create procedure ##global
as begin
print 'I am a global procedure'
end

exec ##global
 