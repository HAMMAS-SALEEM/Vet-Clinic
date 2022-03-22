/* Database schema to keep the structure of entire database. */

-- First Project

CREATE TABLE animals(
id int PRIMARY KEY NOT NULL,              
name text,
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal,
);

-- Second Project

ALTER TABLE animals ADD species varchar(255);

-- Third Project

CREATE TABLE owners(
    id serial PRIMARY KEY,
    full_name text,
    age int
);

CREATE TABLE species(
    id serial PRIMARY KEY,
    name text
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owners(id);

-- Fourth Project

CREATE TABLE vets(
    id serial PRIMARY KEY,
    name text,
    age int,
    date_of_graduation date
);

CREATE TABLE specializations(
    species_id int REFERENCES species(id),
    vets_id int REFERENCES vets(id),
    PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
    animals_id int REFERENCES animals(id),
    vets_id int REFERENCES vets(id),
    date_of_visit date
);