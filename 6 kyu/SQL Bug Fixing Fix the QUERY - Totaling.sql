-- -----------------------------------------------------------
-- DESCRIPTION:
-- Oh no! Timmys been moved into the database divison of his software company but as we know Timmy loves making mistakes. Help Timmy keep his 
-- job by fixing his query...
-- 
-- Timmy works for a statistical analysis company and has been given a task of totaling the number of sales on a given day grouped by each department 
-- name and then each day.
-- 
-- Resultant table:
-- day (type: date) {group by} [order by asc]
-- department (type: text) {group by} [In a real world situation it is bad practice to name a column after a table]
-- sale_count (type: int)
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

SELECT sale.transaction_date::DATE AS day,
resultant.name::TEXT AS department,
COUNT(sale.id)::INTEGER AS sale_count
FROM department AS resultant
INNER JOIN sale on sale.department_id = resultant.id
GROUP BY day, department
ORDER BY day, department;

-- or

SELECT sale.transaction_date::DATE AS day,
department.name::TEXT AS department,
COUNT(sale.id)::INTEGER AS sale_count
FROM department
INNER JOIN sale on sale.department_id = department.id
GROUP BY day, department
ORDER BY day, department;

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