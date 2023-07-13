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
SELECT neutered, AVG(escape_attempts) FROM animals
  GROUP BY neutered;

/*  - Query for: What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg), MAX(weight_kg)
  FROM animals GROUP BY species;

/*  - Query for: What is the average number of escape attempts */
/*               per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) FROM animals
  WHERE date_of_birth BETWEEN '01/01/1990' AND '12/31/2000'
  GROUP BY species;

/* Start queries-with-multiple-tables milestone */
/* --------------------------------------- */
/* Queries using 'JOIN' written to answer the following questions: */
/*  - What animals belong to Melody Pond? */
SELECT A.name, O.full_name AS owned_by
  FROM animals A
    JOIN owners O ON A.owner_id=O.id
  WHERE O.full_name='Melody Pond';

/*  - List of all animals that are pokemon (their type is Pokemon). */
SELECT A.name, S.name AS type
  FROM animals A
    JOIN species S ON A.species_id=S.id
  WHERE S.name='Pokemon';

/*  - List all owners and their animals, remember to include those that don't own any animal. */
SELECT O.id, O.full_name, A.name AS animal_name
  FROM owners O
    LEFT JOIN animals A ON O.id=A.owner_id
  GROUP BY O.id, A.name;

/*  - How many animals are there per species? */
SELECT S.name, COUNT(A.species_id) AS qty
  FROM animals A
    JOIN species S ON A.species_id=S.id
  GROUP BY S.name;

/*  - List all Digimon owned by Jennifer Orwell. */
SELECT A.name AS animal_name, S.name AS animal_type, O.full_name AS owned_by
  FROM animals A
    JOIN species S ON A.species_id=S.id
    JOIN owners O ON A.owner_id=O.id
  WHERE O.full_name='Jennifer Orwell' AND S.name='Digimon';

/*  - List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT A.name AS animal_name, A.escape_attempts, O.full_name AS owned_by
  FROM animals A
    JOIN owners O ON A.owner_id=O.id
  WHERE O.full_name='Dean Winchester' AND A.escape_attempts=0;

/*  - Who owns the most animals? */
SELECT O.full_name AS owner, COUNT(A.owner_id) AS animals_owned
  FROM animals A
    JOIN owners O ON A.owner_id=O.id
  GROUP BY O.full_name
  ORDER BY COUNT(A.owner_id) DESC
  LIMIT 1;

/* Start add-join-tables milestone */
/* --------------------------------------- */
/* Write queries to answer the following questions: */
/*  - Who was the last animal seen by William Tatcher? */
SELECT A.name AS animal_name, E.name AS seen_by, V.visit_date AS seen_on
  FROM visits V
    JOIN animals A ON A.id=V.animal_id
    JOIN vets E ON E.id=V.vet_id
  WHERE E.name='William Tatcher'
  ORDER BY V.visit_date DESC
  LIMIT 1;

/*  - How many different animals did Stephanie Mendez see? */
SELECT DISTINCT COUNT(V.animal_id)
  FROM visits V
    JOIN animals A ON V.animal_id=A.id
    JOIN vets E ON V.vet_id=E.id
  WHERE E.name='Stephanie Mendez';

/*  - List all vets and their specialties, including vets with no specialties. */
SELECT E.id, E.name AS vet_name, S.name AS specialized_on
  FROM vets E
    LEFT JOIN specializations SP ON E.id=SP.vet_id
    LEFT JOIN species S ON SP.species_id=S.id;

/*  - List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT A.name AS animal_name, V.visit_date
  FROM visits V
    JOIN vets E ON E.id=V.vet_id
    JOIN animals A ON A.id=V.animal_id
  WHERE E.name='Stephanie Mendez' AND
    V.visit_date BETWEEN '2020/04/01' AND '2020/08/30';

/*  - What animal has the most visits to vets? */
SELECT A.name AS animal_name, COUNT(V.visit_date) AS total_visits
  FROM visits V
    JOIN animals A ON A.id=V.animal_id
  GROUP BY animal_name
  ORDER BY total_visits DESC
  LIMIT 1;

/*  - Who was Maisy Smith's first visit? */
SELECT A.name AS animal_name, V.visit_date AS visit_on
  FROM visits V
    JOIN animals A ON A.id=V.animal_id
    JOIN vets E ON E.id=V.vet_id
  WHERE E.name='Maisy Smith'
  ORDER BY V.visit_date ASC
  LIMIT 1;
