-- -----------------------------------------------------------
-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the sales table so 
-- that you can return the COUNT of all sales and RANK each person by their sale_count.
-- 
-- people table schema
-- id
-- name
-- 
-- sales table schema
-- id
-- people_id
-- sale
-- price
-- 
-- You should return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank".
-- -----------------------------------------------------------

-- Create your SELECT statement here

SELECT people.id, people.name, 
    RANK() OVER(ORDER BY COUNT(sales.*) DESC) AS sale_rank,
    COUNT(sales.*) AS sale_count
FROM people
JOIN sales
ON sales.people_id = people.id GROUP BY people.id;