-- -----------------------------------------------------------
-- We have employees table with the the following columns:
-- 
-- employee_id: A unique integer identifier for each employee.
-- full_name: A string representing the employee's full name.
-- team: A string that specifies which team the employee is part of. The team can be one of the following four: "backend", "frontend", "devops", or 
-- "design".
-- birth_date: A date that represents the employee's birthdate.
-- 
-- Your task is to write an SQL query that retrieves the complete record for 3-rd oldest developer in the backend team. Let's assume for this task that 
-- there are no employees who share the same birthdate - tests are written to ensure that.
-- 
-- LIMIT/FETCH as well as usage of window functions is forbidden. Can you come up with something more witty?
-- 
-- GLHF!
-- 
-- Desired Output
-- The desired output should look like this:
-- 
-- employee_id			full_name			team			birth_date
-- 11					Madlyn Lowe			backend			1969-08-15
-- -----------------------------------------------------------

WITH witty AS (
    SELECT employee_id, full_name, team, birth_date
    FROM employees
    WHERE team = 'backend'
    ORDER BY birth_date
    OFFSET 2
)
SELECT employee_id, full_name, team, birth_date
FROM witty
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM witty
    OFFSET 1
);

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