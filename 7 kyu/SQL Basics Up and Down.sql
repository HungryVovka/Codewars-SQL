-- -----------------------------------------------------------
-- Given a table of random numbers as follows:
-- 
-- numbers table schema
-- id
-- number1
-- number2
-- 
-- Your job is to return table with similar structure and headings, where if the sum of a column is odd, the column shows the minimum value for that 
-- column, and when the sum is even, it shows the max value. You must use a case statement.
-- 
-- output table schema
-- number1
-- number2
-- -----------------------------------------------------------

SELECT
CASE
    WHEN MOD(SUM(number1), 2) = 1 THEN MIN(number1)
    ELSE MAX(number1)
END
AS number1,
CASE
    WHEN MOD(SUM(number2), 2) = 1 THEN MIN(number2)
    ELSE MAX(number2)
END
AS number2 FROM numbers;

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