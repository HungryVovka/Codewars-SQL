-- -----------------------------------------------------------
-- You will be given a table numbers, with one column number.
-- 
-- Return a dataset with two columns: number and is_even, where number contains the original input value, and is_even containing "Even" or 
-- "Odd" depending on number column values.
-- 
-- Numbers table schema
-- * number INT
-- 
-- Output table schema
-- * number  INT
-- * is_even STRING
-- -----------------------------------------------------------

SELECT number,
CASE 
    WHEN number % 2 = 0 THEN 'Even' 
    ELSE 'Odd'
END 
AS is_even FROM numbers;

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