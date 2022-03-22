/*Queries that provide answers to the questions from all projects.*/

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

-- QUERIES

SELECT COUNT(NAME) total_animals FROM animals;
SELECT COUNT(NAME) total_animals FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) avg_weight FROM animals;
SELECT MAX(escape_attempts) escape_attempts, neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg) max_weight, MIN(weight_kg) min_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts) avg_escape_attempts, species
FROM animals
WHERE TO_CHAR(date_of_birth, 'YYYY') BETWEEN '1990' AND '2000'
GROUP BY species;