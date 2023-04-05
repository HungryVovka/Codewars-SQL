-- -----------------------------------------------------------
-- Given the following table 'decimals':
-- 
-- decimals table schema
-- id
-- number1
-- number2
-- 
-- Return a table with a single column towardzero where the values are the result of number1 + number2 truncated towards zero.
-- -----------------------------------------------------------

SELECT
CASE
    WHEN number1 + number2 > 0 THEN FLOOR(number1 + number2)
    ELSE CEILING(number1 + number2)
END
AS towardzero FROM decimals;

-- or

SELECT TRUNC(number1 + number2) AS towardzero FROM decimals;

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