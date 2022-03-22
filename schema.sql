/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id int PRIMARY KEY NOT NULL,              
name text,
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal,
species text
);

CREATE TABLE owners(
    id serial PRIMARY KEY,
    full_name text,
    age int
);

CREATE TABLE species(
    id serial PRIMARY KEY,
    name text
);