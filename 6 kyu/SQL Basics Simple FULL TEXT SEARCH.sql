-- -----------------------------------------------------------
-- For this challenge you need to create a simple SELECT statement. Your task is to create a query and do a FULL TEXT SEARCH. You must search the 
-- product table on the field name for the word Awesome and return each row with the given word. Your query MUST contain to_tsvector and 
-- to_tsquery PostgreSQL functions.
-- 
-- Tables and relationship below:
--   ┌────────────┐        ┌──────────────────┐     ┌────────────┐
--   │ department │        │       sale       │     │  product   │
--   └────────────┘        └──────────────────┘     └────────────┘
-- ┌─│ id         │──┐     │ id               │  ┌──│ id         │
-- │ │ name       │  └─────│ department_id    │  │  │ name       │
-- │ └────────────┘        │ product_id       │──┘  │ price      │
-- │                       │ employee_id      │──┐  └────────────┘
-- │                       │ transaction_date │  │
-- │                       └──────────────────┘  │
-- │                                             │
-- │ ┌───────────────┐     ┌──────────────────┐  │   
-- │ │   timesheet   │     │     employee     │  │
-- │ └───────────────┘     └──────────────────┘  │ 
-- │ │ id            │  ┌──│ id               │──┘ 
-- │ │ employee_id   │──┘  │ name             │
-- └─│ department_id │     │ number           │
--   │ login         │     │ email            │
--   │ logout        │     │ city             │
--   └───────────────┘     │ street_name      │
--                         │ street_address   │
--                         └──────────────────┘
-- -----------------------------------------------------------

SELECT id, name, price
FROM product AS full_text_search
WHERE TO_TSVECTOR(name) @@ TO_TSQUERY('Awesome')
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