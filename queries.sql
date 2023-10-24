SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE neutered = True AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = True;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* second project */
/* To start a transaction and update the animals specise column and then rollback the changes */
 BEGIN;
 UPDATE animals SET species = 'unspecified';
 SELECT * FROM animals;
 ROLLBACK;

 /* Inside a transaction */
 BEGIN;
 /* 1: Update the animals table by setting the species column to digimon for all animals that have a name ending in mon */
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

/* 2: Update the animals table by setting the species column to pokemon for all animals that don't have species already set. */
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';

/* Verify that changes were made. */
SELECT * FROM animals;

/* Commit the transaction. */
COMMIT;

/* Verify that changes persist after commit. */
SELECT * FROM animals;

/* Inside a transaction delete all records in the animals table, then roll back the transaction. */
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Inside a transaction: */
BEGIN;
/* 1:Delete all animals born after Jan 1st, 2022. */
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;

/* Create a savepoint for the transaction.*/
SAVEPOINT SP1;

/* Update all animals' weight to be their weight multiplied by -1 */
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;

/* Update all animals' weights that are negative to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

/* Query to show all existing animals */
SELECT COUNT(*) AS all_animals FROM animals;

/* Query to show animals have never tried to escape */
SELECT COUNT(*) AS never_escape FROM animals WHERE escape_attempts = 0;

/* Query to show the avarage weight of all animals */
SELECT AVG(weight_kg) AS avg_weight FROM animals;

/* Query to show Who escapes the most, neutered or not neutered animals */
SELECT neutered, COUNT(*) AS escape_attempts FROM animals GROUP BY neutered;

/* Query to show what is the minimum and maximum weight of each type of animal */
SELECT species, MIN(weight_kg) AS MIN_weight, MAX(weight_kg) AS MAX_weight FROM animals GROUP BY species;
/* Query to show the average number of escape attempts per animal type of those born between 1990 and 2000 */
SELECT AVG(escape_attempts) AS avarage_escape_attempts FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000;

                                             /* Day 3 project */

/* 1:Query to show which animals belong to Melody Pond */
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

/* 2: Query to show List of all animals that are pokemon */
SELECT animals.name AS animal_name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

/* 3: Query to show List all owners and their animals, include those that don't own any animal. */
SELECT owners.full_name AS owner_name, STRING_AGG(animals.name, ', ') AS animal_names FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name;


/* 4: Query to show How many animals are there per species? */
SELECT species.name AS species_name, COUNT(*) AS number_of_animals FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

/* 5: Query to show List all Digimon owned by Jennifer Orwell */
SELECT animals.name AS digimon_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id INNER JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* 6: Query to show List all animals owned by Dean Winchester that haven't tried to escape */
SELECT animals.name AS animal_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

/* Query to show Who owns the most animals */
SELECT owners.full_name AS owner_name, COUNT(animals.id) AS animal_count FROM owners LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owner_name ORDER BY animal_count DESC LIMIT 1;

/* Day 4 Project */
