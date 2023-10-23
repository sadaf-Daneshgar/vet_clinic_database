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
