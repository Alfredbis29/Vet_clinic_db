/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,name VARCHAR NOT NULL,date_of_birth DATE NOT NULL,escape_attempts INT NOT NULL,neutered 
BOOL NOT NULL,weight_kg DECIMAL(50,2) NOT NULL
);
ALTER TABLE animals ADD species varchar;

/* Create owners table */
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

/* Create species table */
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

/* Remove species column */
ALTER TABLE animals DROP COLUMN species;

/* Add species_id in animals table referenced from species table */
ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species (id);

/* Add owners_id in animals table referenced from owners table */
ALTER TABLE animals
ADD COLUMN owners_id INT REFERENCES owners (id);