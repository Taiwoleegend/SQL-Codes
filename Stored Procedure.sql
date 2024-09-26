create procedure TEST
AS
select *
from EmployeeDemographics

exec test

create procedure Temp_Employee
as
create table #Temp_Employee (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

insert into #Temp_Employee
select JobTitle, count(JobTitle), avg(age), avg(salary)
from [SQL tutorial]..EmployeeDemographics emp
join [SQL tutorial]..EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID
group by JobTitle

select *
from #Temp_Employee

exec Temp_Employee @jobtitle = 'salesman'
