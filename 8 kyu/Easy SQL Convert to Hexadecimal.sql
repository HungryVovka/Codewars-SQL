-- -----------------------------------------------------------
-- to hexYou have access to a table of monsters as follows:
-- 
-- monsters table schema
-- id
-- name
-- legs
-- arms
-- characteristics
-- 
-- Your task is to turn the numeric columns (arms, legs) into equivalent hexadecimal values.
-- 
-- output table schema
-- legs
-- arms
-- -----------------------------------------------------------

SELECT
    TO_HEX(legs) AS legs,
    TO_HEX(arms) AS arms
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