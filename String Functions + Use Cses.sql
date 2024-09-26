CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

select employeeid, trim(employeeid) as idtrim
from EmployeeErrors

select employeeid,ltrim(employeeid) as idtrim
from EmployeeErrors

select employeeid,rtrim(employeeid) as idtrim
from EmployeeErrors




-- Using Replace
select lastname, replace(lastname, '-fired', '')as lastnamefixed
from EmployeeErrors




-- Using Substring

select err.firstname, dem.firstname
from EmployeeErrors err
join [SQL tutorial]..EmployeeDemographics dem
on err.FirstName = dem.firstname



Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
join employeedemographics
on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



-- Using UPPER and lower

select lastname, replace(lastname, '-fired', '')as lastnamefixed
from EmployeeErrors



Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName) 
from EmployeeErrors