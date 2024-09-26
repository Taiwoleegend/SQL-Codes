select JobTitle, count(jobtitle)
from [SQL tutorial].dbo.EmployeeDemographics
join [SQL tutorial].dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having count(jobtitle) > 1