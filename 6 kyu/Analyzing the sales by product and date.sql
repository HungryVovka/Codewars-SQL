-- -----------------------------------------------------------
-- Task
-- Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.
-- 
-- Notes
-- The sales table stores only the dates for which any data has been recorded - the information about individual sales (what was sold, and when) 
-- is stored in the sales_details table instead
-- The sales_details table stores totals per product per date
-- Order the result by the product_name, year, month, day columns
-- We're interested only in the product-specific data, so you shouldn't return the total revenue from all sales
-- 
-- Input tables
-- ----------------------------------------
-- |    Table      |   Column   |  Type   |
-- |---------------+------------+---------|
-- | products      | id         | int     |
-- |               | name       | text    |
-- |               | price      | numeric |
-- |---------------+------------+---------|
-- | sales         | id         | int     |
-- |               | date       | date    |
-- |---------------+------------+---------|
-- | sales_details | id         | int     |
-- |               | sale_id    | int     |
-- |               | product_id | int     |
-- |               | count      | int     |
-- -----------------------------------------
-- 
-- Output table
-- --------------------------
-- |    Column    |  Type   |
-- |--------------+---------|
-- | product_name | text    |
-- | year         | int     |
-- | month        | int     |
-- | day          | int     |
-- | total        | numeric |
-- --------------------------
-- 
-- Example output
-- product_name | year | month | day | total
-- -------------+------+-------+-----+------
--  milk        | 2019 | 01    | 01  | 200
--  milk        | 2019 | 01    | 02  | 190
--  milk        | 2019 | 01    |     | 390
--  milk        | 2019 | 02    | 01  | 240
--  milk        | 2019 | 02    |     | 240
--  milk        | 2019 |       |     | 630
--  milk        |      |       |     | 630
-- -----------------------------------------------------------

SELECT p.name AS product_name,
    DATE_PART('year', DATE) AS year,
    DATE_PART('month', DATE) AS month,
    DATE_PART('day', DATE) AS day,
    SUM(price * count) AS total
FROM sales_details sd
    INNER JOIN sales s ON s.id = sd.sale_id
    INNER JOIN products p ON p.id = sd.product_id
GROUP BY GROUPING SETS((1), (1, 2), (1, 2, 3), (1, 2, 3, 4))
ORDER BY 1, 2, 3, 4;

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