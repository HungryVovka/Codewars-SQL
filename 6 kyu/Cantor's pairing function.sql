-- -----------------------------------------------------------
-- Georg Cantor's in one of his proofs used following sequence:
-- 
-- 1/1 1/2 1/3 1/4 1/5 ... 
-- 2/1 2/2 2/3 2/4 ...
-- 3/1 3/2 3/3 ... 
-- 4/1 4/2 ... 
-- 5/1 ... 
-- 
-- There are many ways to order those expressions. In this kata we'll use Cantor pairing function.
-- 
-- So sequence is:
-- 
-- 1/1, 1/2, 2/1, 3/1, 2/2, 1/3, 1/4 ...
-- Your task is to return nth element of this sequence.
-- 
-- Input: n - positive integer (max 268435455)
-- 
-- Output: string - nth expression of sequence - 'a/b' where a and b are integers.
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'cantor' with column 'n'
-- return a table with this column and your result in a column named 'res'.

WITH tab0 AS (SELECT n, 
              CEIL(0.5 * (SQRT(8 * n + 1) - 1))::INTEGER 
              AS a FROM cantor),
tab1 AS (SELECT n, a, a * (1 - a) / 2 + n 
         AS b FROM tab0)
SELECT n,
CASE
    WHEN (a + 1) % 2 = 1 THEN CONCAT(b, '/', a - b + 1)
    ELSE CONCAT(a - b + 1, '/', b)
END
AS res FROM tab1;