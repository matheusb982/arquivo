create database functions;

create table department(cod int primary key, name varchar(20));

create table employee(registration int primary key, name varchar(40), salary numeric(10,
2), sex char(1), check(sex in('M', 'F' )), dep_cod int, foreign key(dep_cod) references department); 

create table salary_good(registration int primary key, name varchar(40), salary numeric(10,2));

drop table salary_good;


CREATE OR REPLACE FUNCTION inserting_salary()RETURNS VOID AS
$$
DECLARE registro RECORD;
BEGIN
	SELECT registration, name, salary INTO registro FROM employee;
	IF registro.salary > 20000 THEN
		INSERT INTO salary_good(registartion, name, salary)VALUES(
		registro.registration, registro.name, registro.salary);
	END IF;
END;
$$
LANGUAGE plpgsql;

SELECT insert_salary(); 
