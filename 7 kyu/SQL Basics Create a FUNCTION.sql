-- -----------------------------------------------------------
-- For this challenge you need to create a basic Increment function which Increments on the age field of the peoples table.
-- 
-- The function should be called increment, it needs to take 1 integer and increment that number by 1.
-- 
-- You may query the people table while testing but the query must only contain the function on your final submit.
-- 
-- important: you must remove all comments when submitting the kata.
-- 
-- people table schema
-- id
-- name
-- age
-- 
-- NOTE: Your solution should use PL/SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

CREATE FUNCTION INCREMENT(num INTEGER)
RETURNS INTEGER AS $$ SELECT num + 1;
$$ LANGUAGE SQL;

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