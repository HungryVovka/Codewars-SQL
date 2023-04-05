-- -----------------------------------------------------------
-- This kata is about multiplying a given number by eight if it is an even number and by nine otherwise.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'multiplication' 
-- with column 'number', return a table with column 'number' 
-- and your result in a column named 'res'.

SELECT number,
CASE
    WHEN number % 2 = 0 THEN number * 8
    ELSE number * 9
END
AS res FROM multiplication;

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