-- -----------------------------------------------------------
-- Your manager has given you a task to create a report to measure the impact of the next company-wide salary increase. The rules for the salary 
-- increase are encapsulated in the function pctIncrease, which takes a department_id as a parameter and returns the percent increase as a value 
-- between 0 and 1.
-- 
-- You've managed to create a query that would produce the desired results, but it is currently very slow and doesn't finish in the required time 
-- window.
-- 
-- Your objective in this kata is to optimize this query. The success criteria is to manage to run the query within the allowed kata solution time window 
-- (12 seconds for SQL katas).
-- 
-- The provided initial solution produces the correct result, but it does not run within the allowed time window.
-- 
-- Data model
-- Table: Employees
-- ----------------
-- employee_id   INT / PK
-- first_name    TEXT
-- last_name     TEXT
-- salary        DECIMAL
-- department_id INT / FK
-- 
-- Table: Departments
-- ------------------
-- department_id   INT / PK
-- department_name TEXT
-- 
-- pctIncrease function signature:
-- pctIncrease(dept_id INT) RETURNS decimal
-- -----------------------------------------------------------

CREATE INDEX emplouees_dept_id_index
ON employees(department_id);
CREATE INDEX departments_dept_id_index
ON departments(department_id);

CREATE TEMPORARY TABLE temp_departments
AS(
    SELECT department_id,
    department_name,
    1 + pctIncrease(department_id) AS increase
    FROM departments
);

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
e.salary AS old_salary,
e.salary * d.increase AS new_salary
FROM employees e
INNER JOIN temp_departments d
ON d.department_id = e.department_id
ORDER BY e.employee_id;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2022 Vladimir Rukavishnikov
-- 
-- This file is part of the HungryVovka/Codewars-SQL
-- (https://github.com/HungryVovka/Codewars-SQL)
-- 
-- License is GNU General Public License v3.0
-- (https://github.com/HungryVovka/Codewars-SQL/blob/main/LICENSE)
-- 
-- You should have received a copy of the GNU General Public License v3.0
-- along with this code. If not, see http://www.gnu.org/licenses/
-- -----------------------------------------------------------