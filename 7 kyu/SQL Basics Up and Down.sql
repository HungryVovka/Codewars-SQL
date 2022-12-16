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