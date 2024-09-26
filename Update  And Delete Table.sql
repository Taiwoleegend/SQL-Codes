select *
from [SQL tutorial].dbo.EmployeeDemographics

update [SQL tutorial].dbo.EmployeeDemographics
set gender = 'female'
where firstname = 'ifeoluwa' and lastname = 'ajilore'


delete from [SQL tutorial].dbo.EmployeeDemographics
where EmployeeID = 1099