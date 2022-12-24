-- -----------------------------------------------------------
-- Centered pentagonal number
-- Complete the function that takes an integer and calculates how many dots exist in a pentagonal shape around the center dot on the Nth iteration.
-- 
-- In the image below you can see the first iteration is only a single dot. On the second, there are 6 dots. On the third, there are 16 dots, and on the 
-- fourth there are 31 dots. The sequence is: 1, 6, 16, 31...
-- 
-- If the input is equal to or less than 0, return -1
-- 
-- Examples
-- 1  -->    1
-- 2  -->    6
-- 8  -->  141
-- 0  -->   -1
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'pentagonal' with column 'n' 
-- (the bounds in SQL translation: -1000 <= n <= 10^5)
-- return a table with all this column and your 
-- result in a column named 'res'.

SELECT n,
CASE
    WHEN n < 1 THEN - 1
    ELSE CAST(1 + ((n - 1) * 5 * n) / 2 AS BIGINT)
END
AS res FROM pentagonal;