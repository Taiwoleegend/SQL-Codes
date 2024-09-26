with cte_employee as   
(select firstname, lastname, gender, salary
,count(gender) over ( partition by gender) as totalgender
,avg(salary) over (partition by gender) as avgsalary
from [SQL tutorial].dbo.EmployeeDemographics emp
join [SQL tutorial].dbo.EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID
where salary > '45000'
)

select *
from cte_employee