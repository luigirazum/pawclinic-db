/*Queries that provide answers to the questions from all projects.*/

/* - Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon';

/* - List the name of all animals born between 2016 and 2019. */
SELECT name FROM animals WHERE date_of_birth BETWEEN '01/01/2016' AND '12/31/2019';

/* - List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;

/* - List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

/* - List name and escape attempts of animals that weigh more than 10.5kg. */
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/* - Find all animals that are neutered. */
SELECT * FROM animals WHERE neutered=true;

/* - Find all animals not named Gabumon. */
SELECT * FROM animals WHERE name NOT IN ('Gabumon');

/* - Find all animals with a weight between 10.4kg and 17.3kg */
/*   (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* Start query-update-animals milestone */
/* --------------------------------------- */
/* Inside a transaction: */
/*  - Update the `animals` table by setting the `species` column to `unspecified`. */
/*  - Verify that change was made. */
/*  - Then roll back the change and, */
/*  - Verify that the `species` columns went back to the state before the transaction. */
BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Inside a transaction: */
/*  - Update the `animals` table by */
/*      setting the `species` column to `digimon` for all animals that have a name ending in `mon`. */
/*  - Update the `animals` table by: */
/*      setting the `species` column to `pokemon` for all animals that don't have `species` already set. */
/*  - Verify that changes were made. */
/*  - Commit the transaction. */
/*  - Verify that changes persist after commit. */
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals SET species='pokemon' WHERE species ISNULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/* Inside a transaction: */
/*  - Delete all records in the `animals` table, */
/*  - then roll back the transaction. */
/*  - After the rollback verify if all records in the `animals` table still exists. */
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Inside a transaction: */
/*  - Delete all animals born after Jan 1st, 2022. */
/*  - Create a savepoint for the transaction. */
/*  - Update all animals' weight to be their weight multiplied by -1. */
/*  - Rollback to the savepoint */
/*  - Update all animals' weights that are negative to be their weight multiplied by -1. */
/*  - Commit transaction */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022/01/01';
SAVEPOINT deleted_born_after_jan012022;
UPDATE animals SET weight_kg=weight_kg * -1;
ROLLBACK TO deleted_born_after_jan012022;
UPDATE animals SET weight_kg=weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/* Queries with AGREGATES written to answer the following questions: */
/*  - Query for: How many animals are there? */
SELECT COUNT(*) FROM animals;

/*  - Query for: How many animals have never tried to escape?*/
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;

/*  - Query for: What is the average weight of animals? */
SELECT AVG(weight_kg) FROM animals;

/*  - Query for: Who escapes the most, neutered or not neutered animals? */
SELECT neutered, COUNT(neutered) FROM animals
  WHERE escape_attempts>0 GROUP BY neutered;

/*  - Query for: What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg), MAX(weight_kg)
  FROM animals GROUP BY species;
