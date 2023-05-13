-- -----------------------------------------------------------
-- Yes it's Fibonacci yet again ! But this time it's SQL.
-- 
-- You need to create a select statement which will produce first 90 Fibonnacci numbers. The column name is - number
-- 
-- Fibbonaccii sequence is:
-- 
--  0, 1, 1, 2, 3, 5, 8, 13, ..., 89, 144, 233, 377, ...
-- 
-- where
-- 
-- f(0) = 0
-- f(1) = 1
-- ...
-- f(n) = f(n-1) + f(n-2)
-- 
-- Have fun!
-- -----------------------------------------------------------

WITH RECURSIVE f(number, n) AS(
    SELECT 0::BIGINT, 1::BIGINT
    UNION ALL
    SELECT n::BIGINT, (number + n::BIGINT)
    FROM f
)
SELECT number FROM f
LIMIT 90;

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