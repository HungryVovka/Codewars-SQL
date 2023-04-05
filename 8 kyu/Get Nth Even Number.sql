-- -----------------------------------------------------------
-- Return the Nth Even Number
-- 
-- Example(Input --> Output)
-- 
-- 1 --> 0 (the first even number is 0)
-- 3 --> 4 (the 3rd even number is 4 (0, 2, 4))
-- 100 --> 198
-- 1298734 --> 2597466
-- 
-- The input will not be 0.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'ntheven' 
-- with column 'n', return a table with column 'n' and your 
-- result in a column named 'res'.

SELECT n, n * 2 - 2 AS res FROM ntheven;

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