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
