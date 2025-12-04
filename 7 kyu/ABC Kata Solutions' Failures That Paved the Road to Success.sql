-- -----------------------------------------------------------
-- In the bustling halls of ABC Kata Solutions' headquarters, a sense of pride and 
-- accomplishment fills the air as the company commemorates its remarkable 
-- 10-year journey of transforming the tech industry. From its humble beginnings as a 
-- startup a decade ago, ABC Kata Solutions'has evolved into a global powerhouse, 
-- empowering developers worldwide and spearheading innovation at every turn. 
-- Along the way, ABC Kata Solutions encountered its fair share of challenges and 
-- setbacks. However, rather than being deterred by these obstacles, the company 
-- embraced them as invaluable learning opportunities. Each failure became a 
-- stepping stone, guiding ABC Kata Solutions towards greater resilience and 
-- success. It was through these trials and tribulations that ABC Kata Solutions 
-- honed its strategies, refined its approaches, and ultimately emerged stronger 
-- than ever before. Today, as ABC Kata Solutions reflects on its journey, it does so 
-- with gratitude for the lessons learned and optimism for the bright future ahead.
-- 
-- Specifications:
-- Write an SQL query to identify all ABC Kata Solutions projects that had a budget 
-- greater than the average project budget but were never marked as completed.
-- 
-- We have projects table:
-- 
-- project_id (int, primary key): A unique identifier for each project.
-- project_name (varchar, unique): The name of the project.
-- completion_status (varchar): Indicates the completion status of the 
-- project (e.g., "Completed", "Incomplete", "Cancelled").
-- 
-- and budget_components table:
-- 
-- id (int, primery key): A unique identifier for each record in the table
-- project_id (int): A foreign key referencing the project to which the budget 
-- component belongs.
-- component_value (numeric): The monetary value of the budget component.
-- 
-- You need to:
-- 
-- Calculate the total budget for each project by summing up the individual 
-- component values from the budget_components table.
-- Calculate the average total budget across all projects.
-- Retrieve all projects with a total budget greater than the calculated 
-- average.
-- Include only projects that have not been completed: Projects with a status 
-- indicating they are not yet complete (i.e., any status other than 
-- "Completed") should be included in the results.
-- Order the results by project name in ascending order.
-- 
-- In the result set you need to return the following columns:
-- 
-- project_id (int)
-- project_name (varchar)
-- completion_status (varchar)
-- total_budget (money): The total budget spent on the project, calculated 
-- by summing up the individual component values from the 
-- budget_components table. The formatting and rounding is handled by 
-- PostgreSQL's money datatype
-- 
-- For this sample data:
-- 
-- projects: 
-- 
-- | project_id | project_name      | completion_status|
-- +------------+-------------------+------------------+
-- | 1          | Quantum Leap      | Completed        |
-- | 2          | Zero Bugs Bazaar  | Incomplete       |
-- | 3          | Loop De Loop      | Incomplete       |
-- | 4          | Cache Money       | Cancelled        |
-- | 5          | Byte Me           | Incomplete       |
-- 
-- budget_components: 
-- 
-- | id | project_id | component_value|
-- +----+------------+----------------+
-- | 1  | 1          | 10000          |
-- | 2  | 1          | 20000          |
-- | 3  | 2          | 5000           |
-- | 4  | 2          | 3000           |
-- | 5  | 3          | 12000          |
-- | 6  | 3          | 8000           |
-- | 7  | 4          | 7000           |
-- | 8  | 5          | 15000          |
-- | 9  | 5          | 5000           |
-- 
-- the desired output is the following:
-- 
-- | project_id | project_name      | completion_status| total_budget |
-- +------------+-------------------+------------------+--------------+
-- | 5          | Byte Me           | Incomplete       | $20,000      |
-- | 3          | Loop De Loop      | Incomplete       | $20,000      |
-- 
-- GLHF!
-- -----------------------------------------------------------

WITH project_totals AS (
    SELECT
        p.project_id,
        p.project_name,
        p.completion_status,
        SUM(b.component_value)::MONEY AS total_budget
    FROM projects AS p
    JOIN budget_components AS b
        ON b.project_id = p.project_id
    GROUP BY
        p.project_id,
        p.project_name,
        p.completion_status
)
SELECT
    project_id,
    project_name,
    completion_status,
    total_budget::MONEY AS total_budget
FROM (
    SELECT
        pt.*,
        SUM(total_budget) OVER () / COUNT(*) OVER ()
        AS avg_total_budget
    FROM project_totals AS pt
) AS x
WHERE
    total_budget > avg_total_budget
    AND completion_status <> 'Completed'
ORDER BY
    project_name ASC;

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