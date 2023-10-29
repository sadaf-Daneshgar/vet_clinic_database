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
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

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

/* Day 4 project */

/* insert values into vet table */
INSERT INTO vets (id, name, age, date_of_graduation) VALUES
(1, 'William Tatcher', 45, '2000-04-23'),
(2, 'Maisy Smith', 26, '2019-01-17'),
(3, 'Stephanie Mendez', 64, '1981-05-04'),
(4, 'Jack Harkness', 38, '2008-06-08');

/* insert values into specializations table */
INSERT INTO specializations (species_id, vet_id) VALUES
(1, 1),
(1, 3),
(2, 3),
(2, 4);

INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES
/* Agumon visited William Tatcher */
('2020-05-24', 1, 1),
/* Agumon visited Stephanie Mendez */
('2020-07-22', 1, 3),
/* Gabumon visited Jack Harkness */
('2021-02-02', 2, 4),
/* Pikachu visited Maisy Smith */
('2020-01-05', 3, 2),
/* Pikachu visited Maisy Smith */
('2020-03-08', 3, 2),
/* Pikachu visited Maisy Smith */
('2020-05-14', 3, 2),
/* Devimon visited Stephanie Mendez */
('2021-05-04', 4, 3),
/* Charmander visited Jack Harkness */
('2021-02-24', 5, 4),
/* Plantmon visited Maisy Smith */
('2019-12-21', 6, 2),
/* Plantmon visited William Tatcher */
('2020-08-10', 6, 1),
/* Plantmon visited Maisy Smith */
('2021-04-07', 6, 2),
/* Squirtle visited Stephanie Mendez */
('2019-09-29', 7, 3),
/* Angemon visited Jack Harkness */
('2020-10-03', 8, 4),
/* Angemon visited Jack Harkness */
('2020-11-04', 8, 4),
/* Boarmon visited Maisy Smith */
('2019-01-24', 9, 2), 
/* Boarmon visited Maisy Smith */
('2019-05-15', 9, 2),
/* Boarmon visited Maisy Smith */
('2020-02-27', 9, 2),
/* Boarmon visited Maisy Smith */
('2020-08-03', 9, 2),
/* Blossom visited Stephanie Mendez */
('2020-05-24', 10, 3),
/* Blossom visited William Tatcher */
('2021-01-11', 10 ,1);

/* Day 5 project */

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
