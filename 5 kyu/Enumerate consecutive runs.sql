-- -----------------------------------------------------------
-- Task
-- Given a table with some arbitrary entries having id and value columns, enumerate the runs of rows which have consecutive id's and the same 
-- value. The runs' indices should be stored in the run_id column of the output table; the indices themselves should be consecutive and start from 
-- 1.
-- 
-- Notes
-- id and value columns in the output are the same as in the input table
-- Order the result by the id column
-- 
-- Input table
-- ---------------------------
-- |  Table  | Column | Type |
-- |---------+--------+------|
-- | entries | id     | int  |
-- |         | value  | int  |
-- ---------------------------
-- 
-- Output table
-- -----------------
-- | Column | Type |
-- |--------+------|
-- | id     | int  |
-- | value  | int  |
-- | run_id | int  |
-- -----------------
-- 
-- Enumeration example
--  id | value    run_id
-- ====+=================
--   1 |   7         1
--   2 |   7         1
-- ----+-----------------
--   3 |   0         2
-- ----+-----------------
--   5 |   0         3
-- ----+-----------------
--   6 |  -5         4
-- ----+-----------------
--   7 |   7         5
--   8 |   7         5
--   9 |   7         5
-- -----------------------------------------------------------

WITH enumerate_table AS(
    SELECT id,
    value,
    CASE
        WHEN id = 1 OR
            id - LAG(id) OVER(ORDER BY id) <> 1 OR
            value <> LAG(value) OVER(ORDER BY id)
        THEN 1
        ELSE 0
    END
    AS run_id FROM entries
)
SELECT id,
value,
SUM(run_id) OVER(ORDER BY id) AS run_id
FROM enumerate_table;

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