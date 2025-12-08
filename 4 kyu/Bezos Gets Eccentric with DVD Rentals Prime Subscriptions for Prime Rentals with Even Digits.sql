-- -----------------------------------------------------------
-- Introduction
-- After conquering the world of online shopping, Jeff Bezos, the billionaire founder 
-- of Amazon, decided to expand his empire into the world of DVD rentals. He signed a 
-- contract with a local DVD rental shop to provide the latest movies to Amazon customers 
-- through a new DVD rental service.
-- 
-- As a way to thank the customers who signed up for the new service, Bezos announced 
-- that he would be giving a free Amazon Prime subscription to all customers whose 
-- total quantity of rentals added up to a prime number. The catch? Only a select 
-- few customers actually qualified for the free subscription, because their total 
-- rentals had to be a prime number!
-- 
-- But Jeff didn't stop there. He wanted to make sure that only the most unique and 
-- interesting customers received the free subscription. To qualify, not only did 
-- the total rentals have to add up to a prime number, but the sum of the digits in 
-- their customer ID numbers had to be even.
-- 
-- Task
-- Your task is to write a query that retrieves customer information for a DVD rental 
-- service, including their customer ID, full name (concatenated first name and last 
-- name), the total number of unique rentals they have made, and the total amount of 
-- money they have paid for those rentals.
-- 
-- However, there are two additional conditions that must be met for a customer to 
-- be included in the query results:
-- 
-- The total number of rentals made by the customer must be a prime number.
-- The sum of the digits in the customer's ID number must be an even number.
-- 
-- The results should be sorted first by total payments (in descending order), then 
-- by total rentals (in descending order), and finally by last name (in ascending 
-- order). The query should display the following columns:
-- 
-- customer_id: ID of customer that meets above mentioned condition
-- customer_name: concatenated first name and last name.
-- all_rentals: the total number of rentals they have made and this amount meets 
-- above mentioned condition
-- total_payments: total amount of money customer have paid for those rentals. 
-- This param should be rounded to 2 decimal places.
-- 
-- Notes:
-- for the sample tests, static dump of DVD Rental Sample Database is used, for the 
-- final solution - random tests.
-- please use numeric type to display total_amount
-- There are rentals without payments in the test data. The tests expect rentals 
-- without any payments to not be counted among the total rentals for a customer.
-- 
-- Schema:
-- (data that is needed for the task)
-- 
-- customer table:
--    Column    |  Type   | Modifiers
-- -------------+---------+-----------
--  customer_id | integer | not null
--  first_name  | text    | not null
--  last_name   | text    | not null
-- 
-- rental table:
--    Column   |  Type   | Modifiers
-- ------------+---------+-----------
--  rental_id  | integer | not null
--  customer_id| integer | not null
-- 
-- payment table:
--    Column     |  Type    | Modifiers
-- --------------+----------+-----------
--  payment_id   | integer  | not null
--  rental_id    | integer  | not null
--  amount       | numeric  | not null
-- 
-- Desired Output
-- The desired output should look like this:
-- 
-- customer_id | customer_name | all_rentals | total_payments |
-- ------------+---------------+-------------+----------------|
--    33       | Emily Diaz    | 31          | 0.15271e3      |
--    15       | Jackie Lynch  | 29          | 0.14969e3      |
-- ...
-- -----------------------------------------------------------

WITH customer_rentals AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(DISTINCT r.rental_id) AS all_rentals,
        ROUND(SUM(p.amount), 2) AS total_payments
    FROM customer AS c
    JOIN rental AS r ON r.customer_id = c.customer_id
    JOIN payment AS p ON p.rental_id = r.rental_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
),
with_digit_sum AS (
    SELECT
        cr.*,
        (
            SELECT SUM(d::INTEGER)
            FROM regexp_split_to_table(cr.customer_id::TEXT, '') AS d
        ) AS digit_sum
    FROM customer_rentals AS cr
),
with_prime AS (
    SELECT
        *,
        CASE
            WHEN all_rentals >= 2
            AND NOT EXISTS (
                SELECT 1
                FROM generate_series(
                    2,
                    (SQRT(all_rentals::DOUBLE PRECISION))::INTEGER
                ) AS g(div)
                WHERE all_rentals % g.div = 0
            )
            THEN TRUE
            ELSE FALSE
        END AS is_prime_rentals
    FROM with_digit_sum
)
SELECT
    customer_id,
    (first_name || ' ' || last_name) AS customer_name,
    all_rentals,
    total_payments::NUMERIC AS total_payments
FROM with_prime
WHERE
    is_prime_rentals
    AND digit_sum % 2 = 0
ORDER BY
    total_payments DESC,
    all_rentals DESC,
    last_name ASC;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
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