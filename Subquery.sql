select *
from EmployeeSalary

--subquery in select

select EmployeeID, salary, (select avg(salary) from EmployeeSalary) as AllAvgSalary
from EmployeeSalary


-- how to do it partition by 

select EmployeeID, salary, avg(salary) over () as AllAvgSalary
from EmployeeSalary

--why group by does not work

select EmployeeID, salary, avg(salary) as AllAvgSalary
from EmployeeSalary
group by EmployeeID, Salary
order by 1,2


-- subquery in from

select a.employeeid, allavgsalary
from(select EmployeeID, salary, avg(salary) over () as AllAvgSalary
from EmployeeSalary) a


-- subquery in where

select EmployeeID, JobTitle, Salary
from EmployeeSalary
where EmployeeID in (
		select EmployeeID
		from EmployeeDemographics
		where age > 22)