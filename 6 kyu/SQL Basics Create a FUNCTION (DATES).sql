-- -----------------------------------------------------------
-- For this challenge you need to create a basic Age Calculator function which calculates the age in years on the age field of the peoples table.
-- 
-- The function should be called agecalculator, it needs to take 1 date and calculate the age in years according to the date NOW and must return an 
-- integer.
-- 
-- You may query the people table while testing but the query must only contain the function on your final submit.
-- 
-- people table schema
-- id
-- name
-- age
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

CREATE FUNCTION agecalculator(a DATE) RETURNS INTEGER AS $$
BEGIN
    RETURN DATE_PART('year', AGE(a));
END
$$ LANGUAGE PLPGSQL;

-- or

CREATE FUNCTION agecalculator(a DATE) RETURNS INTEGER AS $$
BEGIN
    RETURN EXTRACT('year' FROM AGE(a));
END
$$ LANGUAGE PLPGSQL;

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