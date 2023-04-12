-- -----------------------------------------------------------
-- For this challenge you need to PIVOT data. You have two tables, products and details. Your task is to pivot the rows in products to produce a table of 
-- products which have rows of their detail. Group and Order by the name of the Product.
-- 
-- Tables and relationship below:
-- ┌──────────┐     ┌────────────┐
-- │ products │     │  details   │
-- └──────────┘     └────────────┘
-- │ id       │──┐  │ id         │
-- │ name     │  └─►│ product_id │
-- └──────────┘     │ detail     │
--                  └────────────┘
--  
-- products table schema
-- - id   - integer
-- - name - text
-- 
-- details table schema
-- - id          - integer
-- - product_id  - integer
-- - detail      - text
-- 
-- You must use the CROSSTAB statement to create a table that has the schema as below:
-- 
-- CROSSTAB table schema
-- - name  - text
-- - bad   - bigint
-- - good  - bigint
-- - ok    - bigint
-- 
-- If the values aren't assigned to the last three columns within the query directly, it's assumed they will be presented in the lexicographical order (i.e. if 
-- we have three values, a, b and c, then bad, good and ok will have these values respectively).
-- 
-- Compare your table to the expected table to view the expected results.
-- 
-- more info can be found here (https://www.postgresql.org/docs/9.2/static/tablefunc.html)
-- -----------------------------------------------------------

CREATE EXTENSION tablefunc;

SELECT crosstab.name,
crosstab.good,
crosstab.ok,
crosstab.bad FROM crosstab(
    $$
    SELECT products.name,
    details.detail,
    COUNT(details.detail)
    FROM products JOIN details ON details.product_id = products.id
    GROUP BY products.name, details.detail
    ORDER BY products.name
    $$,
    $$
    SELECT details.detail FROM details 
    GROUP BY details.detail
    $$)
AS crosstab (name TEXT, ok INTEGER, good INTEGER, bad INTEGER)
ORDER BY name;

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