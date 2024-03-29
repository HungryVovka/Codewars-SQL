-- -----------------------------------------------------------
-- Create a function that checks if a number n is divisible by two numbers x AND y. All inputs are positive, non-zero numbers.
-- 
-- Examples:
-- 1) n =   3, x = 1, y = 3 =>  true because   3 is divisible by 1 and 3
-- 2) n =  12, x = 2, y = 6 =>  true because  12 is divisible by 2 and 6
-- 3) n = 100, x = 5, y = 3 => false because 100 is not divisible by 3
-- 4) n =  12, x = 7, y = 5 => false because  12 is neither divisible by 7 nor 5
-- -----------------------------------------------------------

-- you will be given a table 'kata' with 
-- columns 'n', 'x', and 'y'. Return the 'id' and your 
-- result in a column named 'res'.

SELECT ID, n % x = 0 AND n % y = 0 AS res FROM kata;

-- or

SELECT ID, MOD(n, x) = 0 AND MOD(n, y) = 0 AS res FROM kata;

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