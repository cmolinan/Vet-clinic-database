/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name like '%mon'

-- List the name of all animals born between 2016 and 2019.
SELECT * FROM animals WHERE date_of_birth between '2016-01-01' AND '2019-12-31'

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM animals WHERE neutered AND escape_attempts < 3 

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT name, date_of_birth  FROM animals WHERE name='Agumon' or name='Pikachu'

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg >10.5

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name not like 'Gabumon'

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg between 10.4 and 17.3 



-- **** DAY 2 *****

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
BEGIN; 
UPDATE animals SET species = 'unspecified';
ROLLBACK;

-- Inside a transaction:
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN; 
UPDATE animals SET species = 'digimon' where name like '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
-- Commit the transaction.
UPDATE animals SET species = 'pokemon' where species = 'unspecified';
COMMIT;

-- Inside a transaction DELETE ALL records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- Inside a transaction: Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals where date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
-- Update all animals' weight to be their weight multiplied by -1.
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 

-- Rollback to the savepoint
ROLLBACK TO my_savepoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg <0
-- Commit transaction
COMMIT; 

