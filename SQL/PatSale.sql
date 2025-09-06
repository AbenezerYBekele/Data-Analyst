-- Use the desired database
USE petstore;

-- =================================================================
-- SCRIPT SETUP: Ensure a clean, predictable starting point.
-- This is the most critical step to making a script reliable.
-- =================================================================
DROP TABLE IF EXISTS PETSALE;
DROP TABLE IF EXISTS PET;

-- =================================================================
-- STAGE 1: INITIAL TABLE CREATION AND POPULATION
-- =================================================================

-- Create PETSALE table with corrected syntax and better data types.
-- FIX: Changed 'DATEaddress' to 'DATE'. Using VARCHAR is more flexible than CHAR.
CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET VARCHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
);

-- Create PET table for current inventory.
CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
);

-- Insert data, explicitly naming columns for clarity and safety.
INSERT INTO PETSALE (ID, PET, SALEPRICE, PROFIT, SALEDATE) VALUES
    (1, 'Cat', 450.09, 100.47, '2018-05-29'),
    (2, 'Dog', 666.66, 150.76, '2018-06-01'),
    (3, 'Parrot', 50.00, 8.90, '2018-06-04'),
    (4, 'Hamster', 60.60, 12.00, '2018-06-11'),
    (5, 'Goldfish', 48.48, 3.50, '2018-06-14');

INSERT INTO PET (ID, ANIMAL, QUANTITY) VALUES
    (1, 'Cat', 3),
    (2, 'Dog', 4),
    (3, 'Hamster', 2);

-- =================================================================
-- STAGE 2: TABLE MODIFICATION (DDL - Data Definition Language)
-- =================================================================

-- Add a new column named QUANTITY to PETSALE.
ALTER TABLE PETSALE ADD COLUMN QUANTITY INTEGER;
SELECT 'PETSALE after adding QUANTITY column:' AS status_update;
SELECT * FROM PETSALE;

-- This is a practical next step: update the new column with data from the PET table.
UPDATE PETSALE ps JOIN PET p ON ps.PET = p.ANIMAL SET ps.QUANTITY = 1; -- Assuming 1 pet per sale
SELECT 'PETSALE after updating QUANTITY to 1 for each sale:' AS status_update;
SELECT * FROM PETSALE;


-- Delete the PROFIT column from the PETSALE table.
ALTER TABLE PETSALE DROP COLUMN PROFIT;
SELECT 'PETSALE after dropping PROFIT column:' AS status_update;
SELECT * FROM PETSALE;

-- Rename the 'PET' column to 'ANIMAL' to match the other table.
ALTER TABLE PETSALE CHANGE COLUMN PET ANIMAL VARCHAR(20);
SELECT 'PETSALE after renaming PET to ANIMAL:' AS status_update;
SELECT * FROM PETSALE;

-- =================================================================
-- STAGE 3: DATA AND STRUCTURE DELETION
-- =================================================================

-- TRUNCATE statement removes all rows efficiently but keeps the table structure.
TRUNCATE TABLE PET;
SELECT 'PET table after TRUNCATE (structure remains, data is gone):' AS status_update;
SELECT * FROM PET;

-- DROP statement completely removes the table and its structure.
DROP TABLE PET;
-- The final SELECT will now correctly produce the expected error: "Table 'petstore.pet' doesn't exist"