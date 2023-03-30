use DB1

--hobbies table creation

create table hobbies
(
hobbyId int primary key,
hobbyname varchar(20) unique
)

--inserting values using procedure

create procedure sp_insert 
(@hobbyId int,@hobbyname varchar(20))
as begin
insert into hobbies(hobbyId,hobbyname) values(@hobbyId ,@hobbyname)
end

exec sp_insert 1,'Reading'
exec sp_insert 2,'Writing'
exec sp_insert 3,'Cycling'

select * from hobbies 


--inserting duplicate records and checking the working of try/catch blocks

begin try
exec sp_insert 4,'Carrom'
 end try
   begin catch
    print ERROR_NUMBER()
    print ERROR_MESSAGE()
    print ERROR_SEVERITY()
    print ERROR_STATE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
  end catch

begin try
exec sp_insert 5,'Writing'
 end try
   begin catch
    print ERROR_NUMBER()
    print ERROR_MESSAGE()
    print ERROR_SEVERITY()
    print ERROR_STATE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
  end catch

select * from hobbies

--storing errordetails in an errorbackup table

create table errors1
(
errorid int identity(1,1),
errornumber int,
errorstate int,
errorseverity int,
errorline int,
errormessage varchar(max),
errorprocedure varchar(max)
)

begin try
exec sp_insert 5,'Cycling'
 end try
   begin catch
    print ERROR_NUMBER()
    print ERROR_MESSAGE()
    print ERROR_SEVERITY()
    print ERROR_STATE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
insert into errors1(errornumber,errormessage,errorseverity,errorstate,errorline,errorprocedure) values
(ERROR_NUMBER(),ERROR_MESSAGE(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_LINE(),ERROR_PROCEDURE())
end catch

select * from errors1

--procedure to get two numbers and display the product and working of RAISERROR

create procedure sp_product (@num1 int, @num2 int)
as begin
declare @result int
set @result = 0
begin try
if @num1 <> @num2
raiserror ('Different numbers cannot be multiplied',16,1) with log
set @result = @num1 * @num2
print 'The Result is: '+ cast(@result as varchar)
end try
begin catch
    print ERROR_NUMBER()
    print ERROR_MESSAGE()
    print ERROR_SEVERITY()
    print ERROR_STATE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
end catch
end

exec sp_product 5,5

exec sp_product 12,14

--friends table creation

create table friends
(
id int identity(1,1),
name varchar(25) unique
)

--procedure to enter records and the working of throw

alter procedure sp_names
(@name varchar(25) )
as begin
if(@name like '[ADHKPRSTVY]%')
begin
insert into friends values(@name)
end
else begin
throw 50001,'Error! Invalid NAME',1
end
end

exec sp_names 'Barath'

exec sp_names 'Rahul'
exec sp_names 'Deena'

exec sp_names 'Nelson'

select * from friends