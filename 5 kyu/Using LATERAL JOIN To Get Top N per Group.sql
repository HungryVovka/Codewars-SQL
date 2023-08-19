-- -----------------------------------------------------------
-- Description
-- Given the schema presented below write a query, which uses a LATERAL join, that returns two most viewed posts for every category.
-- 
-- Order the result set by:
-- 
-- category name alphabetically
-- number of post views largest to lowest
-- post id lowest to largest
-- 
-- Note:
-- Some categories may have less than two or no posts at all.
-- Two or more posts within the category can be tied by (have the same) the number of views. Use post id as a tie breaker - a post with a lower id 
-- gets a higher rank.
-- 
-- Schema
-- categories
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- id          | integer                     | not null
-- category    | character varying(255)      | not null
-- 
-- posts
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- id          | integer                     | not null
-- category_id | integer                     | not null
-- title       | character varying(255)      | not null
-- views       | integer                     | not null
-- 
-- Desired Output
-- The desired output should look like this:
-- 
-- category_id | category | title                             | views | post_id
-- ------------+----------+-----------------------------------+-------+--------
-- 5           | art      | Most viewed post about Art        | 9234  | 234
-- 5           | art      | Second most viewed post about Art | 9234  | 712
-- 2           | business | NULL                              | NULL  | NULL
-- 7           | sport    | Most viewed post about Sport      | 10    | 126
-- ...
-- 
-- category_id - category id
-- category - category name
-- title - post title
-- views - the number of post views
-- post_id - post id
-- -----------------------------------------------------------

SELECT categories.id AS category_id,
categories.category,
posts_lateral.title,
posts_lateral.views,
posts_lateral.id AS post_id
FROM categories
LEFT JOIN LATERAL (
    SELECT id, category_id, title, views
    FROM posts
    WHERE category_id = categories.id
    ORDER BY views DESC, 
    id
    LIMIT 2
) AS posts_lateral ON TRUE
ORDER BY categories.category, 
posts_lateral.views DESC NULLS LAST, 
posts_lateral.id;

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