-- -----------------------------------------------------------
-- You are the owner of the Grocery Store. All your products are in the database, that you have created after CodeWars SQL exercises! :)
-- 
-- Customer often need to now how much really they pay for the products. Manufacturers make different sizes of same product so it is hard to 
-- compare prices, sometimes they make packages look big, but the weight of the product is small.
-- 
-- Make a SELECT query which will tell the price per kg of the product.
-- 
-- Weight is in grams! Round the price_per_kg to 2 decimal places.
-- 
-- Order results by price_per_kg ascending, then by name ascending.
-- 
-- Products table schema:
-- id (int)
-- name (string)
-- price (float)
-- stock (int)
-- weight (float)
-- producer (string)
-- country (string)
-- 
-- Results table schema:
-- name (string)
-- weight (float)
-- price (float)
-- price_per_kg (float)
-- -----------------------------------------------------------

SELECT name, weight, price, CAST(
    ROUND(CAST(price / (weight / 1000) AS NUMERIC), 2) AS FLOAT)
    AS price_per_kg
FROM products
ORDER BY price_per_kg, name ASC;

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