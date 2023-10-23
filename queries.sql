/* query and update animals table for second project */
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
