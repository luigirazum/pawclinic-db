/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES ('Agumon', '2020/02/03', 0, true, 10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES ('Gabumon', '2018/11/15', 2, true, 8);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES ('Pikachu', '2021/01/07', 1, false, 15.04);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES ('Devimon', '2017/05/12', 5, true, 11);

/* Start query-update-animals milestone */
/* --------------------------------------- */
/* Insert the following data */
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
  VALUES
    ('Charmander', '2020/02/08', -11, false, 0),
    ('Plantmon', '2021/11/15', -5.7, true, 2),
    ('Squirtle', '1993/04/02', -12.13, false, 3),
    ('Angemon', '2005/06/12', -45, true, 1),
    ('Boarmon', '2005/06/07', 20.4, true, 7),
    ('Blossom', '1998/10/13', 17, true, 3),
    ('Ditto', '2022/05/14', 22, true, 4);

/* Start queries-with-multiple-tables milestone */
/* --------------------------------------- */
/* Insert the following data in 'owners' table */
/*  - Sam Smith 34 years old. */
/*  - Jennifer Orwell 19 years old. */
/*  - Bob 45 years old. */
/*  - Melody Pond 77 years old. */
/*  - Dean Winchester 14 years old. */
/*  - Jodie Whittaker 38 years old. */
INSERT INTO owners(full_name, age)
  VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

/* Insert the following data into the `species` table: */
/*  - Pokemon */
/*  - Digimon */
INSERT INTO species
  VALUES
    (DEFAULT, 'Pokemon'),
    (DEFAULT, 'Digimon');

/* Modify your inserted animals so it includes the `species_id` value: */
/*  - If the name ends in "mon" it will be Digimon */
UPDATE animals
  SET species_id=(SELECT id
    FROM species
    WHERE name='Digimon')
  WHERE name LIKE '%mon';

/*  - All other animals are Pokemon */
UPDATE animals
  SET species_id=(SELECT id
    FROM species
    WHERE name='Pokemon')
  WHERE name NOT LIKE '%mon';

/* Modify your inserted animals to include owner information (`owner_id`): */
/*  - Sam Smith owns Agumon. */
UPDATE animals
  SET owner_id=(SELECT id
    FROM owners
    WHERE full_name='Sam Smith')
  WHERE name IN ('Agumon');
