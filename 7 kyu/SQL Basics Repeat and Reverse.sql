-- -----------------------------------------------------------
-- Using our monsters table with the following schema:
-- 
-- monsters table schema
-- 
-- id
-- name
-- legs
-- arms
-- characteristics
-- 
-- return the following table:
-- 
-- ** output schema**
-- 
-- name
-- characteristics
-- 
-- Where the name is the original string repeated three times (do not add any spaces), and the characteristics are the original strings in reverse (e.g. 
-- 'abc, def, ghi' becomes 'ihg ,fed ,cba').
-- -----------------------------------------------------------

SELECT REPEAT(name, 3) AS name,
REVERSE(characteristics) AS characteristics
FROM monsters;

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