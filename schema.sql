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

/* Start add-join-tables milestone */
/* --------------------------------------- */
/* Create a table named 'vets' with the following columns: */
/*  - id: integer (set it as autoincremented PRIMARY KEY) */
/*  - name: string */
/*  - age: integer */
/*  - date_of_graduation: date. */
CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    age INT,
    date_of_graduation DATE
);

/* There is a many-to-many relationship between the tables 'species' and 'vets': */
/*  - A vet can specialize in multiple species, and */
/*  - A species can have multiple vets specialized in it. */
/*  - Create a "join table" called 'specializations' to handle this relationship. */
CREATE TABLE specializations(
    vet_id INT NOT NULL,
    species_id INT NOT NULL,
    PRIMARY KEY(vet_id, species_id),
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(species_id) REFERENCES species(id)
);

/* There is a many-to-many relationship between the tables 'animals' and 'vets':
/*  - An animal can visit multiple vets, and */
/*  - One vet can be visited by multiple animals. */
/*  - Create a "join table" called 'visits' to handle this relationship: */
/*    * It should also keep track of the date of the visit. */
CREATE TABLE visits(
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    visit_date DATE,
    PRIMARY KEY(animal_id, vet_id, visit_date),
    FOREIGN KEY(animal_id) REFERENCES animals(id),
    FOREIGN KEY(vet_id) REFERENCES vets(id)
);
