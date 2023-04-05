-- -----------------------------------------------------------
-- You are the owner of the Grocery Store. All your products are in the database, that you have created after CodeWars SQL excercises!:)
-- 
-- You have reached a conclusion that you waste to much time because you have to many different warehouse to visit each week.
-- 
-- You have to find out how many different type of products you buy from each producer. If you take only few items from some of them you will stop 
-- going there to save the gasoline:)
-- 
-- In the results show producer and count_products_types which you buy from him.
-- 
-- Order the result by count_products_types (DESC) then by producer (ASC) in case there are duplicate amounts,
-- 
-- products table schema
-- id
-- name
-- price
-- stock
-- producer
-- 
-- results table schema
-- count_products_types
-- producer
-- 
-- Note: there has been a critical change in the description and the column names long after the approval/publication of the kata so don't be surprised 
-- if you see solutions with different column names once you solved the kata (solutions weren't revalidated after the change because their was already 
-- too much of them).
-- -----------------------------------------------------------

-- Replace with your SQL Query

SELECT COUNT(producer) AS count_products_types, producer
FROM products GROUP BY producer
ORDER BY count_products_types DESC, producer;

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