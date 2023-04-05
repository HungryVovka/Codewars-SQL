-- -----------------------------------------------------------
-- Write a function that accepts an integer n and a string s as parameters, and returns a string of s repeated exactly n times.
-- 
-- Examples (input -> output)
-- 6, "I"     -> "IIIIII"
-- 5, "Hello" -> "HelloHelloHelloHelloHello"
-- -----------------------------------------------------------

--# write your SQL statement here: you are given a table 'repeatstr' 
-- with columns 'n' and 's', return a table with all columns 
-- and your result in a column named 'res'.

SELECT s, n, REPEAT(s, n) AS res FROM repeatstr;

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