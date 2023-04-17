-- -----------------------------------------------------------
-- For this challenge you need to create a RECURSIVE Hierarchical query. You have a table employees of employees, you must order each employee by 
-- level. You must use a WITH statement and name it employee_levels after that has been defined you must select from it.
-- 
-- A Level is in correlation what manager managers the employee. e.g. an employee with a manager_id of NULL is at level 1 and then direct employees 
-- with the employee at level 1 will be level 2.
-- 
-- employees table schema
-- id
-- first_name
-- last_name
-- manager_id (can be NULL)
-- 
-- resultant schema
-- level
-- id
-- first_name
-- last_name
-- manager_id (can be NULL)
-- 
-- NOTE: refer to the Results: expected table if you're stuck with how it should be displayed.
-- -----------------------------------------------------------

WITH RECURSIVE employee_levels AS (
    SELECT 1 AS level,
    employees.id,
    employees.first_name,
    employees.last_name,
    employees.manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT
    (1 + employee_levels.level) AS level,
    employees.id,
    employees.first_name,
    employees.last_name,
    employees.manager_id
    FROM employees
    INNER JOIN employee_levels 
    ON employees.manager_id = employee_levels.id)
SELECT level, id, first_name, last_name, manager_id FROM employee_levels;

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