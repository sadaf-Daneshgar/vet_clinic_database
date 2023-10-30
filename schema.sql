/* Qurey for creating database */
CREATE Database vet_clinic;

CREATE TABLE animals (
   id INTEGER NOT NULL UNIQUE PRIMARY KEY ,
   name VARCHAR(100) NOT NULL,
   date_of_birth DATE NOT NULL,
   escape_attempts INT NOT NULL,
   neutered BOOLEAN NOT NULL,
   weight_kg DECIMAL(5,2) NOT NULL
);

         /* Second project */

/* Query for adding new column into table */
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

         /* Day 3 Project */

CREATE TABLE owners (
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(100) NOT NULL,
   age INTEGER NOT NULL
);

CREATE TABLE species (
   id SERIAL PRIMARY KEY,
   name VARCHAR(100) NOT NULL
);

/* Query for removing column species from animals table */
ALTER TABLE animals DROP COLUMN species;

/* Query for Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);

/* Query for add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

/* Day 4 project */
CREATE TABLE vets (
   id SERIAL PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   age INTEGER NOT NULL,
   date_of_graduation DATE NOT NULL
);

/* Query to create tabel of specializations for many to many relationship between vets and species */
CREATE TABLE specializations (
   species_id INTEGER REFERENCES species(id),
   vet_id INTEGER REFERENCES vets,
   CONSTRAINT pk_specializations PRIMARY KEY (species_id, vet_id)
);

/* Query for many to many relationship between animals and vets */
CREATE TABLE visits (
   id SERIAL PRIMARY KEY,
   date_of_visit DATE NOT NULL,
   animal_id INTEGER,
   vet_id INTEGER,
   CONSTRAINT fk_animal_id FOREIGN KEY (animal_id) REFERENCES animals(id),
   CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets(id)
);

  /* Day 5 project */
  
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Remove the NOT NULL constraint from the age column
ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;

/* create index to decrease the execution time of the query */
CREATE INDEX idx_visits_animal_id ON visits(animal_id);
CREATE INDEX idx_visits_vet_id ON visits(vet_id);
CREATE INDEX idx_owners_email ON owners(email);
