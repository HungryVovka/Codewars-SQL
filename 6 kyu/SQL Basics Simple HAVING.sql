-- -----------------------------------------------------------
-- For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups 
-- with 10 or more people who have that age.
-- 
-- people table schema
-- id
-- name
-- age
-- 
-- return table schema
-- age
-- total_people
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

SELECT age, COUNT(id) AS total_people FROM people 
GROUP BY age HAVING COUNT(id) >= 10;

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