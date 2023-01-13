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
    WHEN (k + 1) * k >= n THEN (k - 1) * k
    ELSE (k + 1) * k
END
AS res FROM (SELECT n, 
             SQRT(N)::BIGINT AS k FROM pronic) TMP;