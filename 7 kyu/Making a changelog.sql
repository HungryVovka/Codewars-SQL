-- -----------------------------------------------------------
-- Your job is working with documents: creating, modifying, and deleting them. It is a very important task, so you must also keep a changelog of 
-- performed operations. Updating it manually every time is very tedious, so you decided to automate the job.
-- 
-- You have to do something, so that all the changes done on the documents table are reflected in the documents_changelog table:
-- 
-- On insert copy the new data into the new_data column
-- On update copy the previous data into the old_data and the new data into the new_data columns
-- On delete copy the old data into the old_data column
-- If the operation has no new/old data to work with, the respective column should store NULL
-- 
-- Note: the id column of the documents table is autoincrementing, hence when new records will be inserted there by the test code, the id's will not 
-- be provided explicitly - some language features which could be used for solving this kata may not work because of this fact.
-- 
-- Tables
-- --------------------------------------------
-- |        Table        |   Column    | Type |
-- |---------------------+-------------+------|
-- | documents           | id          | int  |
-- |                     | data        | text |
-- |---------------------+-------------+------|
-- | documents_changelog | id          | int  |
-- |                     | document_id | int  |
-- |                     | old_data    | text |
-- |                     | new_data    | text |
-- --------------------------------------------
-- -----------------------------------------------------------

CREATE OR REPLACE FUNCTION MAKING_CHANGELOG()
RETURNS TRIGGER AS $MAKING_A_CHANGELOG$
BEGIN
    IF(TG_OP = 'INSERT') THEN
        INSERT INTO documents_changelog(
            document_id, old_data, new_data)
        VALUES(NEW.id, NULL, NEW.data);
    ELSEIF(TG_OP = 'UPDATE') THEN
        INSERT INTO documents_changelog(
            document_id, old_data, new_data)
        VALUES(OLD.id, OLD.data, NEW.data);
    ELSEIF(TG_OP = 'DELETE') THEN
        INSERT INTO documents_changelog(
            document_id, old_data, new_data)
        VALUES(OLD.id, OLD.data, NULL);
    END IF;
        RETURN NULL;
END;
$MAKING_A_CHANGELOG$
LANGUAGE PLPGSQL;

CREATE TRIGGER TRIGGER_MAKING_A_CHANGELOG
AFTER INSERT OR UPDATE OR DELETE ON documents
FOR EACH ROW
EXECUTE PROCEDURE MAKING_CHANGELOG();

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