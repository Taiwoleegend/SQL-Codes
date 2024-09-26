select *
from [SQL tutorial]..EmployeeDemographics

select *
from [SQL tutorial]..EmployeeSalary

select firstname, lastname, gender, salary,
count(gender) over (partition by gender) as TotalGender
from [SQL tutorial]..EmployeeDemographics demo
join [SQL tutorial]..EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID