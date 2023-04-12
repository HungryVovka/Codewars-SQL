-- -----------------------------------------------------------
-- For this challenge you need to create a simple SELECT statement. Your task is to calculate the MIN, MEDIAN and MAX scores of the students from 
-- the results table.
-- 
-- Tables and relationship below:
-- ┌─────────┐     ┌────────────┐
-- │ student │     │  student   │
-- └─────────┘     └────────────┘
-- │ id      │──┐  │ id         │
-- │ name    │  └─►│ student_id │
-- └─────────┘     │ score      │
--                 └────────────┘
-- 
-- Resultant table:
-- min
-- median
-- max
-- -----------------------------------------------------------

SELECT MIN(score) AS min,
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY score) AS median,
MAX(score) AS max
FROM result AS Resultant;

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