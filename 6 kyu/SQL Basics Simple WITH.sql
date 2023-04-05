-- -----------------------------------------------------------
-- For this challenge you need to create a SELECT statement, this SELECT statement will use an IN to check whether a department has had a sale with 
-- a price over 90.00 dollars BUT the sql MUST use the WITH statement which will be used to select all columns from sales where the price is greater 
-- than 90.00, you must call this sub-query special_sales.
-- 
-- departments table schema
-- id
-- name
-- 
-- sales table schema
-- id
-- department_id (department foreign key)
-- name
-- price
-- card_name
-- card_number
-- transaction_date
-- 
-- resultant table schema
-- id
-- name
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

WITH special_sales AS (
    SELECT id,
    department_id,
    name,
    price,
    card_name,
    card_number,
    transaction_date FROM sales WHERE price > '90.00')
SELECT id, name FROM departments
WHERE id IN (SELECT department_id FROM special_sales);

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