-- -----------------------------------------------------------
-- You have access to a table of monsters as follows:
-- 
-- ** monsters table schema **
-- 
-- id
-- name
-- legs
-- arms
-- characteristics
-- 
-- Your task is to make a new table where each column should contain the length of the string in the column to its right (last column should contain 
-- length of string in the first column). Remember some column values are not currently strings. Column order and titles should remain unchanged:
-- 
-- ** output table schema **
-- 
-- id
-- name
-- legs
-- arms
-- characteristics
-- -----------------------------------------------------------

SELECT LENGTH(name) AS id,
    LENGTH(CAST(legs AS VARCHAR(30))) AS name,
    LENGTH(CAST(arms AS VARCHAR(30))) AS legs,
    LENGTH(characteristics) AS arms,
    LENGTH(CAST(id AS VARCHAR(30))) AS characteristics
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