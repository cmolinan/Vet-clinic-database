/* Database schema to keep the structure of entire database. */

-- ** DAY 1 **
CREATE TABLE animals(
  id     INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name    varchar,
  date_of_birth  date,
  escape_attempts int,
  neutered  bit,
  weight_kg real
);

-- ** DAY 2 **
--Add a column species of type string to your animals table. Modify your schema.sql file.
alter table animals add column species varchar;

-- ** DAY 3 

-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE owners(
  id   int GENERATED ALWAYS AS IDENTITY,
  full_name  varchar,
  age  int,
  PRIMARY KEY (id)
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE species(
  id   int GENERATED ALWAYS AS IDENTITY,
  name  varchar,
   PRIMARY KEY (id)	
);

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals  ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id)  REFERENCES species(id); 

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals  ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id)  REFERENCES owners(id); 

