-- -----------------------------------------------------------
-- Hello SQL!
-- 
-- Return a table with a single column named Greeting with the phrase 'hello world!'
-- 
-- Please use Data Manipulation Language and not Data Definition Language to solve this Kata
-- -----------------------------------------------------------

-- write your select statement to return hello world

CREATE FUNCTION HELLOWORLD() RETURNS TEXT AS $$
BEGIN
    RETURN 'hello world!';
END
$$
LANGUAGE PLPGSQL;
SELECT HELLOWORLD() AS "Greeting";

-- or

CREATE TABLE HelloWorld ("Greeting" VARCHAR(50));
INSERT INTO HelloWorld ("Greeting") VALUES ('hello world!');
SELECT * FROM HelloWorld;

-- or

SELECT 'hello world!' AS "Greeting";