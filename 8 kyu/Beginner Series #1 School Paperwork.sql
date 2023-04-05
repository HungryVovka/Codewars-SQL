-- -----------------------------------------------------------
-- Your classmates asked you to copy some paperwork for them. You know that there are 'n' classmates and the paperwork has 'm' pages.
-- 
-- Your task is to calculate how many blank pages do you need. If n < 0 or m < 0 return 0.
-- 
-- Example:
-- n= 5, m=5: 25
-- n=-5, m=5:  0
-- 
-- Waiting for translations and Feedback! Thanks!
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'paperwork' 
-- with columns 'id', n' and 'm', return a table 
-- with columns 'n', 'm' and your 
-- result in a column named 'res'.

SELECT n, m,
CASE
    WHEN n < 0 OR m < 0 THEN 0
    ELSE n * m
END
AS res FROM paperwork;

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