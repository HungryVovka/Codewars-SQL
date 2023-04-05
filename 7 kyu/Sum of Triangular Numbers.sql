-- -----------------------------------------------------------
-- Your task is to return the sum of Triangular Numbers up-to-and-including the nth Triangular Number.
-- 
-- Triangular Number: "any of the series of numbers (1, 3, 6, 10, 15, etc.) obtained by continued summation of the natural numbers 1, 2, 3, 4, 5, etc."
-- 
-- [01]
-- 02 [03]
-- 04 05 [06]
-- 07 08 09 [10]
-- 11 12 13 14 [15]
-- 16 17 18 19 20 [21]
-- 
-- e.g. If 4 is given: 1 + 3 + 6 + 10 = 20.
-- 
-- Triangular Numbers cannot be negative so return 0 if a negative number is given.
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'sumtriangular' with column 'n'
-- return a table with this column and your result in a column named 'res'.

SELECT n,
CASE
    WHEN n < 1 THEN 0
    ELSE n * (n + 1) * (n + 2) / 6
END
AS res FROM sumtriangular;

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