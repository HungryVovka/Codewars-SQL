-- -----------------------------------------------------------
-- Your friend has been out shopping for puppies (what a time to be alive!)... He arrives back with multiple dogs, and you simply do not know how to 
-- respond!
-- 
-- By repairing the function provided, you will find out exactly how you should respond, depending on the number of dogs he has.
-- 
-- The number of dogs will always be a number and there will always be at least 1 dog.
-- 
-- Good luck!
-- -----------------------------------------------------------

-- # write your SQL statement here: 
-- you are given a table 'dalmatians' with column 'n' (int)
-- return a query with column 'n' and your result in a column named 'res' (text)
-- sort results by column 'n' ascending

SELECT n, CASE
    WHEN n <= 10 THEN 'Hardly any'
    WHEN n <= 50 THEN 'More than a handful!'
    WHEN n <= 100 THEN 'Woah that''s a lot of dogs!'
    WHEN n <= 101 THEN '101 DALMATIANS!!!'
    END AS res
FROM dalmatians
ORDER BY n ASC;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
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