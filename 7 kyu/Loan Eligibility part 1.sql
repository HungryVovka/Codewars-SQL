-- -----------------------------------------------------------
-- We have two tables: customers and loans.
-- 
-- customers table:
-- 
-- id (integer): The primary key for the table.
-- age (integer): The age of the customer.
-- 
-- loans table:
-- 
-- id (integer): The primary key for the table.
-- customer_id (integer): A foreign key referencing id in the customers table.
-- loan_status (string): The status of the loan, either 'paid' or 'unpaid'.
-- loan_amount (float): The amount of the loan.
-- 
-- Write a SQL query that returns a list of all customers who have IDs between 1 and 10. For each customer, the query should return their ID (as 
-- customer_id) and their loan eligibility based on the following criteria:
-- 
-- If the customer is 18 to 65 years old (inclusive) and all their loans are paid or they don't have any loans, they should be considered eligible for a 
-- loan, and the query should return 'loan can be given'.
-- 
-- Otherwise, the query should return 'loan cannot be given'.
-- 
-- The results should be sorted by customer_id in descending order.
-- 
-- GLHF!
-- 
-- Desired Output
-- The desired output should look like this:
-- 
-- customer_id		loan_eligibility
-- 10				loan can be given
-- 9				loan can be given
-- 8				loan cannot be given
-- ...
-- -----------------------------------------------------------

SELECT customers.id AS customer_id,
CASE
    WHEN customers.age BETWEEN 18 AND 65 
    AND (
        SELECT COUNT(*)
        FROM loans
        WHERE loans.customer_id = customers.id
        AND loans.loan_status = 'unpaid'
    ) = 0
    THEN 'loan can be given'
    ELSE 'loan cannot be given'
END AS loan_eligibility
FROM customers
WHERE customers.id BETWEEN 1 AND 10
ORDER BY customers.id DESC;

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