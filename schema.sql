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
