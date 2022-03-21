/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id serial PRIMARY KEY NOT NULL,              
name text,
date_of_birth date,
neutered boolean,
weight_kg decimal
);
