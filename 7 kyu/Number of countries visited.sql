-- -----------------------------------------------------------
-- How many foreign countries has each person visited?
-- Description
-- In this kata, you are provided with a database that contains information about 
-- people and their visits to various countries.
-- 
-- Your task is to figure out how many countries each person has visited.
-- 
-- Database Schema
-- people table:
-- 
-- id (integer, primary key): Unique identifier for the person.
-- name (string): The person's name. You can assume that the names are 
-- unique.
-- 
-- countries table:
-- id (integer, primary key): Unique identifier for the country.
-- name (string, unique): The name of the country.
-- 
-- visits table:
-- id (integer, primary key): Unique identifier for the visit.
-- person_id (integer, foreign key): Refers to a person.
-- country_id (integer, foreign key): Refers to a country.
-- year (integer): The year of the visit.
-- 
-- Requirements
-- Return a list of people and the number of countries they have visited.
-- First, sort the list by the number of countries visited, from highest to lowest. 
-- Then, if any people have the same number of countries visited, sort them by 
-- the person's name ascending.
-- Include all people in the list, even if they haven't visited any foreign 
-- countries.
-- Make sure to count the number of different countries each person has 
-- visited, as opposed to their total number of visits.
-- 
-- Example
-- Given this sample data:
-- 
-- people:
-- 
-- | id | name  |
-- |----|-------|
-- | 1  | Tim   |
-- | 2  | Bob   |
-- | 3  | Sally |
-- | 4  | Alex  |
-- 
-- countries:
-- 
-- | id | name          |
-- |----|---------------|
-- | 1  | Great Britain |
-- | 2  | Spain         |
-- | 3  | Argentina     |
-- | 4  | Montenegro    |
-- | 5  | Japan         |
-- 
-- visits:
-- 
-- | id | person_id | country_id | year |
-- |----|-----------|------------|------|
-- | 1  | 1         | 1          | 2019 |
-- | 2  | 1         | 4          | 2024 |
-- | 3  | 2         | 1          | 2000 |
-- | 4  | 2         | 2          | 2010 |
-- | 5  | 2         | 4          | 2012 |
-- | 6  | 2         | 4          | 2022 |
-- | 7  | 2         | 5          | 2023 |
-- | 8  | 3         | 4          | 2021 |
-- 
-- You should return the following result:
-- 
-- | name  | countries_visited |
-- |-------|-------------------|
-- | Bob   | 4                 |
-- | Tim   | 2                 |
-- | Sally | 1                 |
-- | Alex  | 0                 |
-- -----------------------------------------------------------

-- select each person and the number of countries they have visited
CREATE INDEX idx_visits_person_country
    ON visits(person_id, country_id);
    
SELECT
    p.name AS name,
    COUNT(DISTINCT v.country_id) AS countries_visited
FROM people AS p
LEFT JOIN visits AS v
    ON v.person_id = p.id
GROUP BY
    p.id,
    p.name
ORDER BY
    countries_visited DESC,
    p.name ASC;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
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