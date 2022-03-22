/*Queries that provide answers to the questions from all projects.*/

-- First Project

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE TO_CHAR(date_of_birth, 'yyyy' ) BETWEEN '2016' AND '2019';
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Second Project

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