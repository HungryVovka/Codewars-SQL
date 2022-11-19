-- -----------------------------------------------------------
-- Write a function that checks if a given string (case insensitive) is a palindrome.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'ispalindrome' 
-- with column 'str', return a table with column 'str' and your result 
-- in a column named 'res'.

SELECT str, LOWER(str) = REVERSE(LOWER(str)) AS res FROM ispalindrome;