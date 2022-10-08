-- https://leetcode.com/problems/nth-highest-salary

/* Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.*/


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        -- we only want one value so taking a max here 
        select max(salary) as  getNthHighestSalary
        -- dense_rank gives the same rank for ties. 
        -- order by ... desc because we want the Nth HIGHEST 
        from (select dense_rank() over(order by salary desc) salary_num, salary from Employee) t
        -- find the Nth highest
        where salary_num = @N
    );
END


/* Success
Details 
Runtime: 677 ms, faster than 79.72% of MS SQL Server online submissions for Nth Highest Salary.
Memory Usage: 0B, less than 100.00% of MS SQL Server online submissions for Nth Highest Salary.*/

