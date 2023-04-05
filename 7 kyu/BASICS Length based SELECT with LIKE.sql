-- -----------------------------------------------------------
-- You will need to create SELECT statement in conjunction with LIKE.
-- 
-- Please list people which have first_name with at least 6 character long
-- 
-- names table schema
-- id
-- first_name
-- last_name
-- 
-- results table schema
-- first_name
-- last_name
-- -----------------------------------------------------------

SELECT first_name, last_name FROM names WHERE first_name LIKE '______%';

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