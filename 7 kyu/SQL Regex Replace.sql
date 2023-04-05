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
-- Your job is to remove all numbers in the address column and replace with '!', then return a table in the following format:
-- 
-- ** output table schema **
-- 
-- project
-- commits
-- contributors
-- address
-- 
-- Case should be maintained.
-- -----------------------------------------------------------

SELECT project, commits, contributors, 
REGEXP_REPLACE(address, '\d', '!', 'g')
AS address FROM repositories;

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