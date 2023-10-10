-- -----------------------------------------------------------
-- For this challenge you need to create a VIEW. This VIEW is used by a sales store to give out vouches to members who have spent over $1000 in 
-- departments that have brought in more than $10000 total ordered by the members id. The VIEW must be called members_approved_for_voucher 
-- then you must create a SELECT query using the view.
-- 
-- Tables and relationship below:
-- ┌────────────────┐     
-- │ departments    │     
-- └────────────────┘     
-- │ id             │──┐  
-- │ name           │  │  ┌─────────────────────┐
-- └────────────────┘  │  │  sales              │
-- ┌────────────────┐  │  └─────────────────────┘
-- │ products       │  │  │ id                  │
-- └────────────────┘  └─►│ department_id       │
-- │ id             │────►│ product_id          │
-- │ name           │  ┌─►│ member_id           │
-- │ price          │  │  │ transaction_date_id │
-- └────────────────┘  │  └─────────────────────┘
-- ┌────────────────┐  │  
-- │ members        │  │
-- └────────────────┘  │
-- │ id             │──┘
-- │ name           │
-- │ number         │
-- │ email          │
-- │ city           │
-- │ street_name    │
-- │ id             │
-- │ name           │
-- │ street_address │
-- └────────────────┘
--
-- resultant table schema
-- id
-- name
-- email
-- total_spending
-- -----------------------------------------------------------

CREATE VIEW members_approved_for_voucher AS
SELECT members.id, members.name, members.email,
SUM(products.price) AS total_spending
FROM members
JOIN sales ON members.id = sales.member_id
JOIN products ON products.id = sales.product_id
WHERE sales.department_id IN (
    SELECT department_id
    FROM sales
    JOIN products ON products.id = sales.product_id
    GROUP BY department_id
    HAVING SUM(products.price) >= 10000.00
)
GROUP BY members.id, members.name, members.email
HAVING SUM(products.price) >= 1000.00;

SELECT id, name, email, total_spending
FROM members_approved_for_voucher
ORDER BY id;

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