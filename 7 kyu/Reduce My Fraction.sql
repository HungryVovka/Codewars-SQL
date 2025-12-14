-- -----------------------------------------------------------
-- Write a function which reduces fractions to their simplest form! Fractions will 
-- be presented as an array/tuple (depending on the language) of strictly positive 
-- integers, and the reduced fraction must be returned as an array/tuple:
-- 
-- input:   [numerator, denominator]
-- output:  [reduced numerator, reduced denominator]
-- example: [45, 120] --> [3, 8]
-- 
-- All numerators and denominators will be positive integers.
-- 
-- Note: This is an introductory Kata for a series... coming soon!
-- -----------------------------------------------------------

-- # write your SQL statement here: 
-- you are given a table 'fraction' with columns 'numerator' (int) and 'denominator' (int)
-- return a query with columns 'numerator', 'denominator', 'reduced_numerator' (int) and 'reduced_denominator' (int)
-- sort results by column 'numerator' ascending, then by 'denominator' ascending
SELECT
    numerator,
    denominator,
    numerator / gcd(numerator, denominator) AS reduced_numerator,
    denominator / gcd(numerator, denominator) AS reduced_denominator
FROM fraction
ORDER BY
    numerator ASC,
    denominator ASC;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
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