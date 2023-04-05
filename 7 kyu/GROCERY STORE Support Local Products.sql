-- -----------------------------------------------------------
-- You are the owner of the Grocery Store. All your products are in the database, that you have created after CodeWars SQL excercises!:)
-- 
-- You care about local market, and want to check how many products come from United States of America or Canada.
-- 
-- Please use SELECT statement and IN to filter out other origins.
-- 
-- In the results show how many products are from United States of America and Canada respectively.
-- 
-- Order by number of products, descending.
-- 
-- products table schema
-- id
-- name
-- price
-- stock
-- producer
-- country
-- 
-- results table schema
-- products
-- country
-- -----------------------------------------------------------

-- Replace with your SQL Query

SELECT COUNT(name) AS products, country
FROM products
WHERE country IN ('Canada', 'United States of America')
GROUP BY country ORDER BY products DESC;

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