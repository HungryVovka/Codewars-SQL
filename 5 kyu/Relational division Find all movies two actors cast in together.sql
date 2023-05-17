-- -----------------------------------------------------------
-- Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) and Salma Nolte 
-- (actor_id = 122) cast in together and order the result set alphabetically.
-- 
-- film schema
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- title       | character varying(255)      | not null
-- film_id     | smallint                    | not null
-- 
-- film_actor schema
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- actor_id    | smallint                    | not null
-- film_id     | smallint                    | not null
-- last_update | timestamp without time zone | not null 
-- 
-- actor schema
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- actor_id    | integer                     | not null 
-- first_name  | character varying(45)       | not null
-- last_name   | character varying(45)       | not null
-- last_update | timestamp without time zone | not null 
-- 
-- The desired output:
-- 
-- title
-- -------------
-- Film Title 1
-- Film Title 2
-- ...
-- 
-- title - Film title
-- -----------------------------------------------------------

SELECT title FROM film
JOIN film_actor Sidney_Crowe ON Sidney_Crowe.film_id = film.film_id
AND Sidney_Crowe.actor_id = 105
JOIN film_actor Salma_Nolte ON Salma_Nolte.film_id = film.film_id
AND Salma_Nolte.actor_id = 122
ORDER BY title;

-- or

SELECT title FROM film WHERE film_id
IN(
    SELECT film_id FROM film_actor WHERE actor_id = 105
    INTERSECT
    SELECT film_id FROM film_actor WHERE actor_id = 122
)
ORDER BY title;

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