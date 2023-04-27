-- -----------------------------------------------------------
-- Given a payment table, which is a part of DVD Rental Sample Database, with the following schema
-- 
-- Column       | Type                        | Modifiers
-- -------------+-----------------------------+----------
-- payment_id   | integer                     | not null 
-- customer_id  | smallint                    | not null
-- staff_id     | smallint                    | not null
-- rental_id    | integer                     | not null
-- amount       | numeric(5,2)                | not null
-- payment_date | timestamp without time zone | not null
-- 
-- produce a result set for the report that shows a side-by-side comparison of the number and total amounts of payments made in Mike's and Jon's 
-- stores broken down by months.
-- 
-- The resulting data set should be ordered by month using natural order (Jan, Feb, Mar, etc.).
-- 
-- Note: You don't need to worry about the year component. Months are never repeated because the sample data set contains payment information 
-- only for one year.
-- 
-- The desired output for the report
-- 
-- month | total_count | total_amount | mike_count | mike_amount | jon_count | jon_amount
-- ------+-------------+--------------+------------+-------------+-----------+-----------
-- 2     |             |              |            |             |           |           
-- 5     |             |              |            |             |           |           
-- ...
-- 
-- month - number of the month (1 - January, 2 - February, etc.)
-- total_count - total number of payments
-- total_amount - total payment amount
-- mike_count - total number of payments accepted by Mike (staff_id = 1)
-- mike_amount - total amount of payments accepted by Mike (staff_id = 1)
-- jon_count - total number of payments accepted by Jon (staff_id = 2)
-- jon_amount - total amount of payments accepted by Jon (staff_id = 2)
-- -----------------------------------------------------------

SELECT DATE_PART('month', payment_date) AS month,
COUNT(payment_id) AS total_count,
SUM(amount) AS total_amount,
COUNT(staff_id) FILTER(WHERE staff_id = 1) AS mike_count,
SUM(amount) FILTER(WHERE staff_id = 1) AS mike_amount,
COUNT(staff_id) FILTER(WHERE staff_id = 2) AS jon_count,
SUM(amount) FILTER(WHERE staff_id = 2) AS jon_amount
FROM payment AS report
GROUP BY DATE_PART('month', payment_date)
ORDER BY DATE_PART('month', payment_date);

-- or

SELECT EXTRACT(MONTH FROM payment_date) AS month,
COUNT(payment_id) AS total_count,
SUM(amount) AS total_amount,
COUNT(staff_id) FILTER(WHERE staff_id = 1) AS mike_count,
SUM(amount) FILTER(WHERE staff_id = 1) AS mike_amount,
COUNT(staff_id) FILTER(WHERE staff_id = 2) AS jon_count,
SUM(amount) FILTER(WHERE staff_id = 2) AS jon_amount
FROM payment AS report
GROUP BY EXTRACT(MONTH FROM payment_date)
ORDER BY EXTRACT(MONTH FROM payment_date);

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