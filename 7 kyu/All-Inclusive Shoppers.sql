-- -----------------------------------------------------------
-- Let's consider a situation where we have three tables:
-- 
-- users table:
-- 
-- Columns: id, name
-- Primary key: id
-- 
-- products table:
-- 
-- Columns: id, product_name
-- Primary key: id
-- 
-- orders table:
-- 
-- Columns: id, user_id, product_id
-- Primary key: id
-- Foreign keys: user_id references users(id), product_id references products(id)
-- 
-- In this kata, we need to find out the names and IDs of all users who ordered every available product at least once. The result should be ordered by 
-- user_id in descending order.
-- 
-- GLHF!
-- 
-- Desired Output
-- The desired output should look like this:
-- 
-- user_id			name
-- 20			Lelia Bergstrom Sr.
-- 15			Johnathon Hoppe
-- 1			Sen. Ashley Brakus
-- -----------------------------------------------------------

SELECT users.id AS user_id, name
FROM users
JOIN orders ON user_id = users.id
GROUP BY users.id
HAVING (SELECT COUNT(*) FROM products) = COUNT(DISTINCT orders.id)
ORDER BY user_id DESC;

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