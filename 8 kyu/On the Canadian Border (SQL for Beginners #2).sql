-- -----------------------------------------------------------
-- You are a border guard sitting on the Canadian border. You were given a list of travelers who have arrived at your gate today. You know that 
-- American, Mexican, and Canadian citizens don't need visas, so they can just continue their trips. You don't need to check their passports for visas! 
-- You only need to check the passports of citizens of all other countries!
-- 
-- Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US.
-- 
-- travelers table schema
-- 
-- name
-- country
-- 
-- NOTE: The United States is written as 'USA' in the table.
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
-- -----------------------------------------------------------

SELECT * FROM travelers WHERE country NOT IN ('Canada', 'USA', 'Mexico');

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