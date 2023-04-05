-- -----------------------------------------------------------
-- For this challenge you need to create a SELECT statement, this statement must have NULL handling, using COALESCE and NULLIF.
-- 
-- If name is an empty string, you must replace with '[product name not found]'.
-- 
-- If card_name is an empty string, you must replace with '[card name not found]'.
-- 
-- If no price is specified (i.e. price is NULL), or if the price is 50 or less, you must discard the row.
-- 
-- eusales table schema
-- id
-- name
-- price
-- card_name
-- card_number
-- transaction_date
-- 
-- resultant table schema
-- id
-- name
-- price (greater than 50.00)
-- card_name
-- card_number
-- transaction_date
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- -----------------------------------------------------------

SELECT id,
COALESCE(NULLIF(name, ''), '[product name not found]') AS name,
price,
COALESCE(NULLIF(card_name, ''), '[card name not found]') AS card_name,
card_number, transaction_date FROM eusales
WHERE price > '50.00';

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