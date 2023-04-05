-- -----------------------------------------------------------
-- Complete the method that takes a boolean value and return a "Yes" string for true, or a "No" string for false.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given 
-- a table 'booltoword' with column 'bool', 
-- return a table with column 'bool' and your 
-- result in a column named 'res'.

SELECT bool,
CASE
    WHEN bool = 'true' THEN 'Yes'
    ELSE 'No'
END
AS res FROM booltoword;

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