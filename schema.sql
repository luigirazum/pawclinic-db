/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

/* Start query-update-animals milestone */
/* --------------------------------------- */
/* Add a column `species` of type `string` to your `animals` table */
ALTER TABLE animals ADD species VARCHAR(50);

/* Start queries-with-multiple-tables milestone */
/* --------------------------------------- */
/* Create a table named 'owners' with the following columns: */
/*  - id: integer (set it as autoincremented PRIMARY KEY), */
/*  - full_name: string, */
/*  - age: integer */
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

/* Create a table named 'species' with the following columns: */
/*  - id: integer (set it as autoincremented PRIMARY KEY), */
/*  - name: string */
CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

/* Modify 'animals' table: */
/*  - Make sure that id is set as autoincremented PRIMARY KEY */
ALTER TABLE animals
    DROP CONSTRAINT animals_pkey;

ALTER TABLE animals
    DROP COLUMN id;

ALTER TABLE animals
    ADD COLUMN id SERIAL PRIMARY KEY;

/*  - Remove column species */
ALTER TABLE animals
    DROP COLUMN species;

/*  - Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals
    ADD COLUMN species_id INT;

/* - Make species_id a foreign key that references id at species table */
ALTER TABLE animals
    ADD FOREIGN KEY(species_id) REFERENCES species(id);

/*  - Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals
    ADD COLUMN owner_id INT,
    ADD FOREIGN KEY(owner_id) REFERENCES owners(id);
