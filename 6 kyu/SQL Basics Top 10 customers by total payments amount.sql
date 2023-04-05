-- -----------------------------------------------------------
-- Overview
-- For this kata we will be using the DVD Rental database.
-- 
-- You are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that 
-- returns the top 10 customers by total amount spent ordered from highest to lowest. Total number of payments has also been requested.
-- 
-- The query should output the following columns:
-- 
-- customer_id [int4]
-- email [varchar]
-- payments_count [int]
-- total_amount [float]
-- 
-- and has the following requirements:
-- 
-- only returns the 10 top customers, ordered by total amount spent from highest to lowest
-- -----------------------------------------------------------

-- Replace with your query (in pure SQL)

SELECT customer.customer_id,
customer.email,
COUNT(payment_id) AS payments_count,
SUM(amount)::FLOAT AS total_amount
FROM customer JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY total_amount DESC LIMIT 10;

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