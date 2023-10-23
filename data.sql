 /* Inserting new data into table */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
 (1, 'Agumon', '2020-02-03', 0, True, 10.23),
 (2, 'Gabumon', '2018-11-15', 2, True, 8),
 (3, 'Pikachu', '2021-01-07', 1, False, 15.04),
 (4, 'Devimon', '2017-05-12', 5, True, 11);

          /* Second Project */
/* query and update animals table for second project */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
 (5, 'Charmander', '2020-02-08', 0, False, -11),
 (6, 'Plantmon', '2021-11-15', 2, True, -5.7),
 (7, 'Squirtle', '1993-04-02', 3, False, -12.13),
 (8, 'Angemon', '2005-06-12', 1, True, -45),
 (9, 'Boarmon', '2005-06-07', 7, True, 20.4),
 (10, 'Blossom', '1998-10-13', 3, True, 17),
 (11, 'Ditto', '2022-05-14', 4, True, 22);

           /* Day 3 project */

/* inserting data into owners table */
INSERT INTO owners (id, full_name, age) VALUES
(1, 'Sam Smith', 34),
(2, 'Jennifer Orwell', 19),
(3, 'Bob', 45),
(4, 'Melody Pond', 77),
(5, 'Dean Winchester', 14),
(6, 'Jodie Whittaker', 38);

/* inserting data into species table */
INSERT INTO species (id, name) VALUES
(1, 'Pokemon'),
(2, 'Digimon');

/* Query If the name ends in "mon" it will be Digimon else other animals are Pokemon */
UPDATE animals SET species_id =(SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

/* Query modify animals to include owner info */
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
