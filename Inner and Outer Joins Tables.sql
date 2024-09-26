SELECT *
FROM [SQL tutorial].DBO.EmployeeDemographics

SELECT *
FROM [SQL tutorial].DBO.EmployeeSalary

SELECT JobTitle,AVG(SALARY)
FROM [SQL tutorial].DBO.EmployeeDemographics
INNER JOIN [SQL tutorial].DBO.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
 WHERE JOBTITLE = 'SALESMAN'
 GROUP BY JOBTITLE 
