-- -----------------------------------------------------------
-- It's pretty straightforward. Your goal is to create a function that removes the first and last characters of a string. You're given one parameter, the 
-- original string. You don't have to worry with strings with less than two characters.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given 
-- a table 'removechar' with column 's', 
-- return a table with column 's' and your 
-- result in a column named 'res'.

SELECT s, SUBSTRING(s, 2, LENGTH(s) - 2) AS res FROM removechar;

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