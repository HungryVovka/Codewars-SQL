-- -----------------------------------------------------------
-- In your application, there is a section for adults only. You need to get a list of names and ages of users from the users table, who are 18 years old or 
-- older.
-- 
-- users table schema
-- 
-- name
-- age
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
-- -----------------------------------------------------------

SELECT * FROM users WHERE age >= 18;

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