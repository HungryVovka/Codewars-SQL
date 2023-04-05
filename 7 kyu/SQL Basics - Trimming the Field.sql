-- -----------------------------------------------------------
-- You have access to a table of monsters as follows:
-- 
-- monsters schema
-- 
-- id
-- name
-- legs
-- arms
-- characteristics
-- 
-- The monsters in the provided table have too many characteristics, they really only need one each. Your job is to trim the characteristics down so that 
-- each monster only has one. If there is only one already, provide that. If there are multiple, provide only the first one (don't leave any commas in 
-- there).
-- 
-- You must return a table with the format as follows:
-- 
-- output schema
-- 
-- id
-- name
-- characteristic
-- 
-- Order by id
-- -----------------------------------------------------------

SELECT id, name, SPLIT_PART(characteristics, ',', 1) AS characteristic
FROM monsters ORDER BY id;

-- or

SELECT id, name, SUBSTRING(characteristics, '^[a-z]+') AS characteristic
FROM monsters ORDER BY id;

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