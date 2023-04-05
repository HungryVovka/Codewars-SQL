-- -----------------------------------------------------------
-- Input
-- You'll have a table like the following:
-- 
-- name				greeting
-- Austin Gaylord		Hola que tal #4702665
-- Kacie Zulauf		Bienvenido 45454545 tal #470815 BD. WA470815
-- 
-- Output
-- In this practice you'll need to extract from the greeting column the number preceeded by the # symbol and place it in a new column named 
-- user_id.
-- 
-- name					greeting											user_id
-- Austin Gaylord			Hola que tal #4702665								4702665
-- Kacie Zulauf			Bienvenido 45454545 tal #470815 BD. WA470815		470815
-- 
-- NOTE: To keep it simple assume that the iser_id will be having varchar type
-- -----------------------------------------------------------

SELECT name, greeting,
SUBSTRING(greeting FROM '#([0-9]+)')
AS user_id FROM greetings;

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