-- select firstname, lastname, age,
-- case
--  when age > 21 then 'young'
--  when age between 22 and 25 then 'old' 
--  else 'baby'
--end
-- from [SQL tutorial].dbo.EmployeeDemographics
-- where age is not null 
-- order by age 


select firstname, lastname, jobtitle, salary,
case
when JobTitle = 'data analyst' then salary + (salary * .10)
when JobTitle = 'accountant' then salary + ( salary * .05)
when JobTitle = 'hr' then salary + ( salary * .00001)
else salary + (salary * .03)
end as SalaryAfterRaise
from [SQL tutorial].dbo.EmployeeDemographics
join [SQL tutorial].dbo.EmployeeSalary
 on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


  select firstname lastname, age , salary
  from [SQL tutorial].dbo.EmployeeDemographics
  inner join [SQL tutorial].dbo.EmployeeSalary
  on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

