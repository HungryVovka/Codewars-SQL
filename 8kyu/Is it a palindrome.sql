-- -----------------------------------------------------------
-- Write a function that checks if a given string (case insensitive) is a palindrome.
-- -----------------------------------------------------------

SELECT str, LOWER(str) = REVERSE(LOWER(str)) AS res FROM ispalindrome;