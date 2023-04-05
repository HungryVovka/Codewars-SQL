-- -----------------------------------------------------------
-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the toys table so 
-- that you can return the COUNT of the toys
-- 
-- people table schema
-- id
-- name
-- 
-- toys table schema
-- id
-- name
-- people_id
-- 
-- You should return all people fields as well as the toy count as "toy_count".
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

SELECT people.*, COUNT(toys.id) AS toy_count
FROM people, toys WHERE people.id = toys.people_id
GROUP BY people.id;

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