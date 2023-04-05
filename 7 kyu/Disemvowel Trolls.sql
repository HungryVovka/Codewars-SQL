-- -----------------------------------------------------------
-- Trolls are attacking your comment section!
-- 
-- A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.
-- 
-- Your task is to write a function that takes a string and return a new string with all vowels removed.
-- 
-- For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".
-- 
-- Note: for this kata y isn't considered a vowel.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'disemvowel' 
-- with column 'str', return a table with column 'str' and your 
-- result in a column named 'res'.

SELECT str, REGEXP_REPLACE(str, '[aeiou]', '', 'gi') AS res FROM disemvowel;

-- or

SELECT str, TRANSLATE(str, 'aAeEiIoOuU', '') AS res FROM disemvowel;

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