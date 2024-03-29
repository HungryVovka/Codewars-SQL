-- -----------------------------------------------------------
-- This kata is inspired by SQL Basics: Simple PIVOTING data by matt c.
-- 
-- You need to build a pivot table WITHOUT using CROSSTAB function. Having two tables products and details you need to select a pivot table of 
-- products with counts of details occurrences (possible details values are ['good', 'ok', 'bad'].
-- 
-- Results should be ordered by product's name.
-- 
-- Model schema for the kata is:
-- ┌──────────┐     ┌────────────┐
-- │ products │     │  details   │
-- └──────────┘     └────────────┘
-- │ id       │──┐  │ id         │
-- │ name     │  └─►│ product_id │
-- └──────────┘     │ detail     │
--                  └────────────┘
-- 
-- your query should return table with next columns
-- 
-- name
-- good
-- ok
-- bad
-- 
-- Compare your table to the expected table to view the expected results.
-- -----------------------------------------------------------

SELECT products.name,
COUNT(details.id) FILTER (WHERE details.detail = 'good') AS good,
COUNT(details.id) FILTER (WHERE details.detail = 'ok') AS ok,
COUNT(details.id) FILTER (WHERE details.detail = 'bad') AS bad
FROM products JOIN details ON details.product_id = products.id
GROUP BY products.name ORDER BY products.name;

-- or

SELECT products.name,
SUM((details.detail = 'good')::INTEGER) AS good,
SUM((details.detail = 'ok')::INTEGER) AS ok,
SUM((details.detail = 'bad')::INTEGER) AS bad
FROM products JOIN details ON details.product_id = products.id
GROUP BY products.name ORDER BY products.name;

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