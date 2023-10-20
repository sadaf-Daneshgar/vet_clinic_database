/* Qurey for creating database */
CREATE Database vet_clinic;

CREATE TABLE animals (
   id INTEGER NOT NULL UNIQUE PRIMARY KEY ,
   name VARCHAR(100) NOT NULL,
   date_of_birth DATE NOT NULL,
   escape_attempts INTEGER NOT NULL,
   neutered BOOLEAN NOT NULL,
   weight_kg DECIMAL(5,2) NOT NULL);

/* Query for adding new column into table */
/* query and update animals table for second project */

ALTER TABLE animals ADD COLUMN species VARCHAR(100);
