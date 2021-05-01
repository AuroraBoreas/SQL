SELECT COUNT(*)
FROM employee;

SELECT MIN(empId) as miniId,
       MAX(empId) as maxId,
       AVG(empId) as avgId
FROM   employee
WHERE  empName LIKE '%ha%';