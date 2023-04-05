-- -----------------------------------------------------------
-- I love Fibonacci numbers in general, but I must admit I love some more than others.
-- 
-- I would like for you to write me a function that when given a number (n) returns the n-th number in the Fibonacci Sequence.
-- 
-- For example:
-- 
-- nthFibo(4) == 2
-- 
-- Because 2 is the 4th number in the Fibonacci Sequence.
-- 
-- For reference, the first two numbers in the Fibonacci sequence are 0 and 1, and each subsequent number is the sum of the previous two.
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'fibo' with column 'n'.
-- return a table with:
--   this column and your result in a column named 'res'
--   ordered ascending by 'n'
--   distinct results (remove duplicates)

SELECT DISTINCT n, 
CAST(
	FLOOR(0.5 + (POWER(0.5 * (1 + SQRT(5)), n - 1)) / SQRT(5)) 
AS BIGINT) 
AS res FROM fibo ORDER BY n ASC;

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