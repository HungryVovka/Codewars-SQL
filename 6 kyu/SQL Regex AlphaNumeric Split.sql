-- -----------------------------------------------------------
-- You are given a table named repositories, format as below:
-- 
-- ** repositories table schema **
-- 
-- project
-- commits
-- contributors
-- address
-- 
-- The table shows project names of major cryptocurrencies, their numbers of commits and contributors and also a random donation address ( not 
-- linked in any way :) ).
-- 
-- Your job is to split out the letters and numbers from the address provided, and return a table in the following format:
-- 
-- ** output table schema **
-- 
-- project
-- letters
-- numbers
-- 
-- Case should be maintained.
-- -----------------------------------------------------------

SELECT project,
REGEXP_REPLACE(address, '[[:digit:]]', '', 'g') AS letters, -- numbers to ''
REGEXP_REPLACE(address, '[[:alpha:]]', '', 'g') AS numbers  -- letters to ''
FROM repositories;

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