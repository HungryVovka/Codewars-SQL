-- -----------------------------------------------------------
-- Your company has an internal policy to determine your customers' credit limit, but this procedure has been questioned recently by the board as 
-- being too conservative.
-- 
-- Your CEO wants to increase the current customer base credit limits in order to upsell a new line of products. In order to do that, the company hired 
-- several external consultancies to produce new credit limit estimates.
-- 
-- The problem is that each agency has produced the report in its own format. Some use the format "First-name Last-name" to identify a person, 
-- others use the format "Last-name, First-name". There is also no consensus on how to capitalize each word, so some used all uppercase, others 
-- used all lowercase, and some used mixed-case.
-- 
-- Also, some names are titled, for example: "Dr. Hannibal Lecter", "Robert Downey Jr." etc, so you will need to pay attention to any such or 
-- similar cases.
-- 
-- Internally, the data is structured as follows:
-- 
-- Table: customers
-- ================
-- 
-- id: INT
-- first_name: TEXT
-- last_name: TEXT
-- credit_limit: FLOAT
-- 
-- The data you've received from all agencies was consolidated in the following table:
-- 
-- Table: prospects
-- ================
-- full_name: TEXT
-- credit_limit: FLOAT
-- 
-- Keep in mind that the agencies had access only to a partial customer base. There is also the possibility of more than one agency prospecting the 
-- same customer, so it's highly likely that there will be duplicates. Finally, they've prospected customers that were not in your customer base as well.
-- 
-- For this task you are interested in the prospected customers that are already in your customer base and the prospected credit limit is higher than 
-- your internal estimate. When more than one agency prospected the same customer, chose the highest estimate.
-- 
-- You have to produce a report with the following fields:
-- 
-- first_name
-- last_name
-- old_limit [the current credit_limit]
-- new_limit [the highest credit_limit found]
-- 
-- Good luck!
-- 
-- Notes:
-- 
-- only list the customers that a higher credit limit was found.
-- -----------------------------------------------------------

CREATE INDEX idx_customers_name ON customers (UPPER(first_name));
CREATE INDEX idx_customers_last_name ON customers (UPPER(last_name));
CREATE INDEX idx_prospects_name ON prospects (UPPER(full_name));
CREATE INDEX idx_prospects_credit_limit ON prospects (credit_limit);

SELECT customers.first_name,
customers.last_name,
customers.credit_limit AS old_limit,
MAX(prospects.credit_limit) AS new_limit
FROM customers
LEFT JOIN prospects
ON prospects.full_name ~* customers.first_name AND
prospects.full_name ~* customers.last_name
WHERE customers.credit_limit < prospects.credit_limit
GROUP BY customers.first_name, customers.last_name, customers.credit_limit
ORDER BY customers.first_name, customers.last_name;

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