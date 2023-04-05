-- -----------------------------------------------------------
-- Oh no! Timmys been moved into the database divison of his software company but as we know Timmy loves making mistakes. Help Timmy keep his 
-- job by fixing his query...
-- 
-- Timmy works for a statistical analysis company and has been given a task of calculating the highest average salary for a given job, the sample is 
-- compiled of 100 applicants each with a job and a salary. Timmy must display each unique job, the total average salary, the total people and the total 
-- salary and order by highest average salary. Timmy has some bugs in his query, help Timmy fix his query so he can keep his job!
-- 
-- people table schema
-- id
-- name
-- 
-- job table schema
-- id
-- people_id
-- job_title
-- salary
-- 
-- resultant table schema
-- job_title (unique)
-- average_salary (float, 2 dp)
-- total_people (int)
-- total_salary (float, 2 dp)
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

SELECT j.job_title,
ROUND(AVG(j.salary), 2)::FLOAT AS average_salary,
COUNT(p.id) as total_people,
ROUND(SUM(j.salary), 2)::FLOAT AS total_salary
FROM people AS p JOIN job AS j ON j.people_id = p.id
GROUP BY j.job_title ORDER BY average_salary DESC;

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