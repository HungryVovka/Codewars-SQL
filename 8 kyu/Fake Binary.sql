-- -----------------------------------------------------------
-- Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string.
-- 
-- Note: input will never be an empty string
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'fakebin' 
-- with column 'x', return a table with column 'x' and your 
-- result in a column named 'res'.

SELECT x,
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(x, '0', '0')
    , '1', '0')
    , '2', '0')
    , '3', '0')
    , '4', '0')
    , '5', '1')
    , '6', '1')
    , '7', '1')
    , '8', '1')
    , '9', '1')
AS res FROM fakebin;

-- or

SELECT x, TRANSLATE(x, '0123456789', '0000011111') AS res FROM fakebin;

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