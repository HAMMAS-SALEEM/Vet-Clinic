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

-- Fourth Project

SELECT animals.name animal, vets.name vet, visits.date_of_visit visit_date
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
AND vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT DISTINCT(animals.name) animal, vets.name vet, MAX(visits.date_of_visit)
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
AND vets.name = 'Stephanie Mendez'
GROUP BY animals.name, vets.name;

SELECT v.name vet, species.name
FROM specializations s
INNER JOIN species ON species.id = s.species_id
FULL OUTER JOIN vets v ON s.vets_id = v.id;

SELECT animals.name animal, vets.name vet, visits.date_of_visit visit_date
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
AND vets.name = 'Stephanie Mendez'
AND TO_CHAR(visits.date_of_visit, 'YYYY-MM-DD') BETWEEN '2020-04-01' AND '2020-08-30';

SELECT DISTINCT(animals.name) animal, COUNT(animals.name) total_visits
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
GROUP BY animals.name
ORDER BY total_visits DESC
LIMIT 1;

SELECT DISTINCT(animals.name) animal, visits.date_of_visit visit_date, vets.name vet
FROM vets, animals, visits
WHERE visits.animals_id = animals.id
AND visits.vets_id = vets.id
AND vets.name = 'Maisy Smith'
GROUP BY animals.name, visit_date, vet
ORDER BY visit_date
LIMIT 1;

SELECT DISTINCT(animals.name) animal, visits.date_of_visit visit_date, vets.name vet
FROM vets, animals, visits
WHERE visits.animals_id = animals.id
AND visits.vets_id = vets.id
GROUP BY animals.name, visit_date, vet
ORDER BY visit_date DESC
LIMIT 1;



WITH new AS(
    SELECT DISTINCT(animals.name) animal, COUNT(animals.name) total_visits, vets.name vet
FROM vets, animals, visits
WHERE visits.animals_id = animals.id
AND visits.vets_id = vets.id
AND vets.name = 'Maisy Smith'
GROUP BY animals.name, vet
)
SELECT * FROM new WHERE total_visits = (SELECT MAX(total_visits) FROM new);