SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE (neutered IS true AND escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');
SELECT (name,escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered is true;
SELECT name FROM animals WHERE name !='Gabumon';
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 OR weight_kg = 17.3;
  --in transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change
  begin transaction;
  update animals set species = 'unspecified';
  rollback;
  --in transaction
  -- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
begin;
update animals set species ='digimon' where name like '%mon';
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
update animals set species ='pokemon' where species is null;
commit;
--  Inside a transaction delete all records in the animals table, then roll back the transaction
begin;
delete from animals *;
rollback;
----Inside a transaction
begin
delete from animals * where  date_of_birth > '2022-1-01';
savepoint savepoint1
update animals set weight_kg = weight_kg * -1;
rollback to savepoint savepoint1;
update animals set weight_kg = weight_kg * -1;
commit
-- Write queries to answer the following questions:
----How many animals are there?
select * from animals;
----How many animals have never tried to escape?
select * from animals where escape_attempts = 0;
---- What is the average weight of animals?
select avg(weight_kg) from animals;
----Who escapes the most, neutered or not neutered animals?
select name from animals where escape_attempts = (select max(escape_attempts) from animals);
----What is the minimum and maximum weight of each type of animal?
 select species, min(weight_kg), max(weight_kg) from animals group by species;
 ----What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where extract(year from date_of_birth) between 1990 and 2000 group by species;
