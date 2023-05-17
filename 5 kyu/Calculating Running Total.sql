-- -----------------------------------------------------------
-- Description
-- Given a posts table that contains a created_at timestamp column write a query that returns date (without time component), a number of posts 
-- for a given date and a running (cumulative) total number of posts up until a given date. The resulting set should be ordered chronologically by date.
-- 
-- Desired Output
-- The resulting set should look similar to the following:
-- 
-- date       | count | total
-- -----------+-------+-------
-- 2017-01-26 |    20 |    20
-- 2017-01-27 |    17 |    37
-- 2017-01-28 |     7 |    44
-- 2017-01-29 |     8 |    52
-- ...
-- 
-- date - (DATE) date
-- count - (INT) number of posts for a date
-- total - (INT) a running (cumulative) number of posts up until a date
-- -----------------------------------------------------------

SELECT created_at::DATE as date,
COUNT(ID)::INTEGER AS count,
SUM(count(ID)) OVER(ORDER BY created_at::DATE)::INTEGER AS total
FROM posts
GROUP BY date
ORDER BY date;

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