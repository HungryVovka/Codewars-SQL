-- -----------------------------------------------------------
-- Given a table of random numbers as follows:
-- 
-- ** numbers table schema **
-- 
-- id
-- number1
-- number2
-- number3
-- number4
-- number5
-- 
-- Your job is to return a table in the following format, where each value is the number of bytes in the string representation of the number.
-- 
-- ** output table schema **
-- 
-- octnum1
-- octnum2
-- octnum3
-- octnum4
-- octnum5
-- 
-- See expected results for more clarity if required.
-- -----------------------------------------------------------

SELECT LENGTH(CAST(number1 AS VARCHAR)) AS octnum1,
LENGTH(CAST(number2 AS VARCHAR)) AS octnum2,
LENGTH(CAST(number3 AS VARCHAR)) AS octnum3,
LENGTH(CAST(number4 AS VARCHAR)) AS octnum4,
LENGTH(CAST(number5 AS VARCHAR)) AS octnum5 FROM numbers;

-- or

SELECT LENGTH(number1 :: VARCHAR) AS octnum1,
LENGTH(number2 :: VARCHAR) AS octnum2,
LENGTH(number3 :: VARCHAR) AS octnum3,
LENGTH(number4 :: VARCHAR) AS octnum4,
LENGTH(number5 :: VARCHAR) AS octnum5 FROM numbers;