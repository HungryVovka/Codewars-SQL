-- -----------------------------------------------------------
-- Create a simple SELECT query to display student information of all ACTIVE students.
-- 
-- TABLE STRUCTURE:
-- 
-- students
-- Id	FirstName	LastName	IsActive
-- 
-- Note: IsActive (true or false)
-- -----------------------------------------------------------

SELECT * FROM students WHERE IsActive IS '1';

-- or

SELECT * FROM students WHERE IsActive IS 1;

-- or

SELECT * FROM students WHERE IsActive;