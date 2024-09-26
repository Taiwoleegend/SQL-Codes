create table #temp_employee (
employeeid int,
jobtitle varchar(100),
salary int
)

select *
from #temp_employee

insert into #temp_employee values (
'1001', 'hr', '45000'
)


insert into #temp_employee
select *
from [SQL tutorial]..EmployeeSalary


drop table if exists #temp_employee2
create table #temp_employee2 (
jobtitle varchar(50),
employeesperjob int,
avgage int,
avgsalary int)


insert into #temp_employee2
select jobtitle,count(jobtitle), avg(age), avg(salary)
from [SQL tutorial]..EmployeeDemographics emp
join [SQL tutorial]..EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID
group by JobTitle


select *
from #temp_employee2