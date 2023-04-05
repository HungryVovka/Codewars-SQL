-- -----------------------------------------------------------
-- Given the following table 'decimals':
-- 
-- ** decimals table schema **
-- 
-- id
-- number1
-- number2
-- 
-- Return a table with two columns (root, log) where the values in root are the square root of those provided in number1 and the values in log are 
-- changed to a base 10 logarithm from those in number2.
-- -----------------------------------------------------------

SELECT
    SQRT(number1) AS root,
    LOG(number2)
FROM decimals;

-- or

SELECT
    POWER(number1, 0.5) AS root,
    LOG(number2)
FROM decimals;

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