-- -----------------------------------------------------------
-- You are a data analyst at a subscription-based e-learning platform. 
-- It allows users to book courses in advance, and the platform keeps 
-- track of both the booking date and the course start date. 
-- Management has tasked you with analyzing how many "active bookings" 
-- exist on each booking_date.
-- 
-- Write an SQL query to calculate the number of active bookings 
-- for each booking_date in the system. The results should include 
-- all booking_date values from the course_bookings table, and the 
-- count of active bookings for each.
-- 
-- course_bookings table:
-- 
-- id (int, primary key): Unique identifier for the booking.
-- course_id (int, foreign key) Identifier for the course.
-- user_id (int): Identifier for the user who booked the course.
-- course_start_date (date): The date when the course is scheduled to start.
-- booking_date (date): The date when the user booked the course.
-- 
-- An "active booking" is defined as a course booking that:
-- 
-- Was booked on or before a given booking_date.
-- Has a course_start_date that is on or after the booking_date, 
-- meaning it has not yet started.
-- 
-- Resultant columns:
-- 
-- booking_date: the date on which bookings were made
-- active_bookings: the count of all active bookings
-- 
-- The result is ordered by booking_date in ascending order.
-- 
-- For this sample data:
-- 
-- | id | course_id | user_id | course_start_date | booking_date |
-- +----+-----------+---------+-------------------+--------------+
-- | 1  | 101       | 1       | 2025-01-01        | 2025-01-01   |
-- | 2  | 102       | 2       | 2025-01-06        | 2025-01-01   |
-- | 3  | 102       | 3       | 2025-01-06        | 2025-01-01   |
-- | 4  | 103       | 4       | 2025-01-07        | 2025-01-02   |
-- | 5  | 104       | 5       | 2025-01-08        | 2025-01-03   |
-- | 6  | 105       | 6       | 2025-01-09        | 2025-01-04   |
-- | 7  | 106       | 7       | 2025-01-10        | 2025-01-05   |
-- | 8  | 106       | 8       | 2025-01-10        | 2025-01-05   |
-- | 9  | 106       | 9       | 2025-01-10        | 2025-01-05   |
-- | 10 | 106       | 10      | 2025-01-10        | 2025-01-05   |
-- | 11 | 106       | 11      | 2025-01-10        | 2025-01-05   |
-- | 12 | 107       | 12      | 2025-01-11        | 2025-01-05   |
-- 
-- expected output is the following:
-- 
-- | booking_date | active_bookings |
-- +--------------+-----------------+
-- | 2025-01-01   | 3               |
-- | 2025-01-02   | 3               |
-- | 2025-01-03   | 4               |
-- | 2025-01-04   | 5               |
-- | 2025-01-05   | 11              |
-- 
-- 2025-01-01: 3 bookings are active (IDs: 1, 2, 3).
-- 2025-01-02: 3 bookings are active (IDs: 2, 3, 4) because ID 1 is 
-- no longer active (it started on 2025-01-01).
-- 2025-01-03: 4 bookings are active (IDs: 2, 3, 4, 5).
-- 2025-01-04: 5 bookings are active (IDs: 2, 3, 4, 5, 6).
-- 2025-01-05: 11 bookings are active (IDs: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).
-- 
-- GLHF!
-- -----------------------------------------------------------

SELECT 
    bd.booking_date,
    (
        SELECT COUNT(*)
        FROM course_bookings AS cb
        WHERE cb.booking_date <= bd.booking_date
        AND cb.course_start_date >= bd.booking_date
    ) AS active_bookings
FROM (
    SELECT DISTINCT booking_date
    FROM course_bookings
) AS bd
ORDER BY bd.booking_date ASC;

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