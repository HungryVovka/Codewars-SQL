-- -----------------------------------------------------------
-- Write function RemoveExclamationMarks which removes all exclamation marks from a given string.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 
-- 'removeexclamationmarks' with column 's', 
-- return a table with column 's' and your result in a column named 'res'.

SELECT s, REPLACE(s, '!', '') AS res FROM removeexclamationmarks;