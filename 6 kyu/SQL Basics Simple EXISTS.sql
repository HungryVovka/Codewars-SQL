-- -----------------------------------------------------------
-- For this challenge you need to create a SELECT statement that will contain data about departments that had a sale with a price over 98.00 dollars. 
-- This SELECT statement will have to use an EXISTS to achieve the task.
-- 
-- departments table schema
-- id
-- name
-- 
-- sales table schema
-- id
-- department_id (department foreign key)
-- name
-- price
-- card_name
-- card_number
-- transaction_date
-- 
-- resultant table schema
-- id
-- name
-- -----------------------------------------------------------

-- Create your SELECT statement here

SELECT id, name FROM departments
WHERE EXISTS(SELECT * FROM sales
             WHERE sales.department_id = departments.id AND
                   sales.price > '98.00')

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