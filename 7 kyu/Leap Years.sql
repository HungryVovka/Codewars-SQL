-- -----------------------------------------------------------
-- In this kata you should simply determine, whether a given year is a leap year 
-- or not. In case you don't know the rules, here they are:
-- 
-- Years divisible by 4 are leap years,
-- but years divisible by 100 are not leap years,
-- but years divisible by 400 are leap years.
-- 
-- Tested years are in range 1600 ≤ year ≤ 4000.
-- 
-- Notes
-- Table years has two columns: id, and year.
-- Your query has to return rows with two columns: year, and is_leap.
-- Returned rows have to be sorted ascending by the year.
-- -----------------------------------------------------------

-- result has to be sorted by year, ascending
SELECT
    year,
    CASE
        WHEN year % 400 = 0 THEN TRUE
        WHEN year % 100 = 0 THEN FALSE
        WHEN year % 4 = 0 THEN TRUE
        ELSE FALSE
    END AS is_leap
FROM years
ORDER BY year ASC;

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