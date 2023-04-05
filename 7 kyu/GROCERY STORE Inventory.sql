-- -----------------------------------------------------------
-- You are the owner of the Grocery Store. All your products are in the database, that you have created after CodeWars SQL excercises!:)
-- 
-- Today you are going to CompanyA warehouse
-- 
-- You need to check what products are running out of stock, to know which you need buy in a CompanyA warehouse.
-- 
-- Use SELECT to show id, name, stock from products which are only 2 or less item in the stock and are from CompanyA.
-- 
-- Order the results by product id
-- 
-- products table schema
-- id
-- name
-- price
-- stock
-- producent
-- 
-- results table schema
-- id
-- name
-- stock
-- -----------------------------------------------------------

-- select all of the items

SELECT id, name, stock FROM products
WHERE stock < 3 AND producent = 'CompanyA'
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