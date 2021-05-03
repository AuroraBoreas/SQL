SELECT * FROM employee;

SELECT empName FROM employee;

SELECT empId, empName FROM employee
WHERE empId = 1;

-- Logic operators/keywords: NOT AND OR
-- Relational operators/keywords: IN, ==, !=, <, <=, >, >=

SELECT empName
FROM employee as E, employeeSkill as S 
WHERE E.empId = S.empId
GROUP BY empName
HAVING UCASE(empName) > 5;

-- JOIN: inner join; outer join: left outer join, full outer join, right outer join
-- natural JOIN
-- Descartes product
-- union, intersetion, symmetric, asymmetric,
-- pai, ro,