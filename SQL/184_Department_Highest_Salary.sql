
-- https://leetcode.com/problems/department-highest-salary/

  WITH max_salary( Department, departmentId, maxSalary)
  AS 
  -- Define the CTE query.
  (
        SELECT d.name Department, e.departmentId,  max(e.salary) maxSalary -- department max salary
        FROM Employee e 
        LEFT JOIN Department d on e.departmentId = d.id
        GROUP BY d.name, e.departmentId
  )
  -- Define the outer query referencing the CTE name. 
  SELECT m.Department, e.name Employee, e.salary Salary
  FROM max_salary m 
  LEFT JOIN Employee e 
  on m.departmentId = e.departmentId and m.maxSalary = e.salary
 
  
  
  
  /* 
Success
Details 
Runtime: 615 ms, faster than 97.76% of MS SQL Server online submissions for Department Highest Salary.
Memory Usage: 0B, less than 100.00% of MS SQL Server online submissions for Department Highest Salary. 
*/