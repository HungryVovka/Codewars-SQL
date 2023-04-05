-- -----------------------------------------------------------
-- Your friends told you that if you keep coding on your computer, you are going to hurt your eyes. They suggested that you go with them to trivia night 
-- at the local club.
-- 
-- Once you arrive at the club, you realize the true motive behind your friends' invitation. They know that you are a computer nerd, and they want you 
-- to query the countries table and get the answers to the trivia questions.
-- 
-- Schema of the countries table:
-- 
-- country (String)
-- capital (String)
-- continent (String)
-- 
-- The first question: from the African countries that start with the character E, get the names of their capitals ordered alphabetically.
-- 
-- You should only give the names of the capitals. Any additional information is just noise
-- If you get more than 3, you will be kicked out, for being too smart
-- Also, this database is crowd-sourced, so sometimes Africa is written Africa and in other times Afrika.
-- 
-- Resources:
-- 
-- SQL LIKE Oerator (https://www.w3schools.com/SQL/sql_like.asp)
-- SQL IN Operator (https://www.w3schools.com/SQL/sql_in.asp)
-- SQL ORDER BY (https://www.w3schools.com/SQL/sql_orderby.asp)
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
-- -----------------------------------------------------------

SELECT capital FROM countries
WHERE
    country LIKE 'E%'
    AND continent LIKE 'Afri%'
ORDER BY capital ASC LIMIT 3;

-- or

SELECT capital FROM countries
WHERE
    country LIKE 'E%'
    AND continent LIKE 'Afri_a'
ORDER BY capital ASC LIMIT 3;

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