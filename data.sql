/* Populate database with sample data. */

-- First Project

INSERT INTO animals VALUES (1,'Agumon', '2020-FEB-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2,'Gabumon', '2018-NOV-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3,'Pikachu', '2021-JAN-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4,'Devimon', '2017-MAY-12', 5, TRUE, 11);

-- Second Project

INSERT INTO animals VALUES (1,'Charmander', '2020-Feb-08', 0, false, -11);
INSERT INTO animals VALUES (2,'Plantmon', '2021-Nov-15', 2, true, -5.7);
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

-- Updations

-- OWNER'S UPDATIONS

UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon';

-- SPECIES UPDATIONS

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

-- Fourth Project

INSERT INTO vets(name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-Apr-23'),
('Maisy Smith', 26, '2019-Jan-17'),
('Stephanie Mendez', 64, '1981-May-04'),
('Jack Harkness', 38, '2008-Jun-08');

INSERT INTO specializations VALUES 
(2, 1),
(1, 3),
(2, 3),
(1, 4);

INSERT INTO visits VALUES
(7,1, '2020-May-24'),
(7,3, '2020-Jul-22'),
(8,4, '2021-Feb-02'),
(9,2, '2020-Jan-05'),
(9,2, '2020-Mar-08'),
(9,2, '2020-May-14'),
(10,3, '2021-May-04'),
(1,4, '2021-Feb-24'),
(2,2, '2019-Dec-21'),
(2,1, '2020-Aug-10'),
(2,2, '2021-Apr-07'),
(3,3, '2019-Sep-29'),
(4,4, '2020-Oct-03'),
(4,4, '2020-Nov-04'),
(5,2, '2019-Jan-24'),
(5,2, '2019-May-15'),
(5,2, '2020-Feb-27'),
(5,2, '2020-Aug-03'),
(6,3, '2020-May-24'),
(6,1, '2021-Jan-11');

-- Project 05

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';