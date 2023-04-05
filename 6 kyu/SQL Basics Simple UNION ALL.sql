-- -----------------------------------------------------------
-- For this challenge you need to create a UNION statement, there are two tables ussales and eusales the parent company tracks each sale at its 
-- respective location in each table, you must all filter the sale price so it only returns rows with a sale greater than 50.00. You have been tasked with 
-- combining that data for future analysis. Order by location (US before EU), then by id.
-- 
-- (us/eu)sales table schema
-- id
-- name
-- price
-- card_name
-- card_number
-- transaction_date
-- 
-- resultant table schema
-- location (EU for eusales and US for ussales)
-- id
-- name
-- price (greater than 50.00)
-- card_name
-- card_number
-- transaction_date
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

SELECT 'US' AS location, * FROM ussales WHERE price > '50.00'
UNION ALL
SELECT 'EU' AS location, * FROM eusales WHERE price > '50.00';

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