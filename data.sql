/* Populate database with sample data. */

-- First Project

INSERT INTO animals VALUES (1,'Agumon', '2020-FEB-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2,'Gabumon', '2018-NOV-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3,'Pikachu', '2021-JAN-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4,'Devimon', '2017-MAY-12', 5, TRUE, 11);

-- Second Project

INSERT INTO animals VALUES (1,'Charmender', '2020-Feb-08', 0, false, -11);
INSERT INTO animals VALUES (2,'Plantom', '2021-Nov-15', 2, true, -5.7);
INSERT INTO animals VALUES (3,'Squirtle', '1993-Apr-02', 3, false, -12.13);
INSERT INTO animals VALUES (4,'Angemon', '2005-Jun-12', 1, true, -45);
INSERT INTO animals VALUES (5,'Boarmon', '2005-Jun-07', 7, true, 20.4);
INSERT INTO animals VALUES (6,'Blossom', '1998-Oct-13', 3, true, 17);
INSERT INTO animals VALUES (7,'Ditto', '2022-May-14', 4, true, 22);

-- TRANSACTION 01

BEGIN;

UPDATE animals
SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

-- TRANSACTION 02

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

SELECT * FROM animals;

-- TRANSACTION 03

BEGIN;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

-- TRANSACTION 04

BEGIN;

DELETE FROM animals
WHERE TO_CHAR(date_of_birth,'YYYY-MON-DD') > '2022-JAN-01';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg*-1;

ROLLBACK TO SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg*-1
WHERE weight_kg < 0;

COMMIT;

-- Third Project

-- Owners Information

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Species Information

INSERT INTO species(name) VALUES ('Digimon');
INSERT INTO species(name) VALUES ('Pokemon');