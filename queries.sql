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

SELECT COUNT(NAME) total_animals FROM animals;
SELECT COUNT(NAME) total_animals FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) avg_weight FROM animals;
SELECT MAX(escape_attempts) escape_attempts, neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg) max_weight, MIN(weight_kg) min_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts) avg_escape_attempts, species
FROM animals
WHERE TO_CHAR(date_of_birth, 'YYYY') BETWEEN '1990' AND '2000'
GROUP BY species;

-- Third Project

SELECT a.name animal, o.full_name owner  
FROM animals a, owners o 
WHERE a.owner_id = o.id
AND o.full_name = 'Melody Pond';

SELECT a.name animal, s.name specie 
FROM animals a, species s
WHERE a.species_id = s.id
AND s.name = 'Pokemon';

SELECT a.name animal, o.full_name owner  
FROM animals a
FULL OUTER JOIN owners o 
ON a.owner_id = o.id

SELECT COUNT(a.id), s.name
FROM animals a, species s
WHERE a.species_id = s.id
GROUP BY s.name;

SELECT a.name animal, o.full_name owner, s.name
FROM animals a, owners o, species s 
WHERE a.owner_id = o.id
AND a.species_id = s.id
AND o.full_name = 'Jennifer Orwell'
AND s.name = 'Digimon';

SELECT a.name animal, o.full_name owner  
FROM animals a, owners o 
WHERE a.owner_id = o.id
AND o.full_name = 'Dean Winchester'
AND a.escape_attempts = 0;

WITH new AS (SELECT COUNT(a.id) total_animals, o.full_name owner
FROM animals a, owners o
WHERE a.owner_id = o.id
GROUP BY o.id)
SELECT owner, total_animals
FROM new
WHERE total_animals = (SELECT MAX(total_animals) FROM new);