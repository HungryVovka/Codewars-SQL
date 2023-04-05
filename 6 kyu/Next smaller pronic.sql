-- -----------------------------------------------------------
-- The challenge is to efficiently find the largest pronic number less than the method's input.
-- 
-- The initial solution passes the sample tests, but fails for larger numbers used in the acceptance tests.
-- 
-- Your algorithm should be fast as the acceptance tests will run 100,000 randomly selected numbers.
-- 
-- Are you up to the challenge?
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'pronic' with column 'n'.
-- return a table with this column and your 
-- result in a column named 'res'.
-- 2000 random tests for SQL

SELECT n,
CASE
    WHEN (sq_n + 1) * sq_n >= n THEN (sq_n - 1) * sq_n
    ELSE (sq_n + 1) * sq_n
END
AS res FROM (SELECT n, 
             SQRT(N)::BIGINT AS sq_n FROM pronic) T1;

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