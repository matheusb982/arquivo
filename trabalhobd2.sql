create database contract;

CREATE TYPE location AS (rua VARCHAR(10), 
numero VARCHAR(10), complemento VARCHAR(30));

CREATE TABLE provider (cnpj VARCHAR(11) PRIMARY KEY, 
name VARCHAR(20), phone VARCHAR(8), endereco location);

CREATE TABLE cliente (cod int PRIMARY KEY, name VARCHAR(20),
phone VARCHAR(8), endereco location);

CREATE TABLE person_legal (cnpj VARCHAR(11)) 
INHERITS (cliente);

CREATE TABLE person_physical (cpf VARCHAR(11)) 
INHERITS (cliente);

CREATE TABLE uniform (cod INTEGER, type VARCHAR(10),
value INTEGER) INHERITS (provider);

CREATE TABLE epi (cod INTEGER, type VARCHAR(10),
value INTEGER) INHERITS (provider);

CREATE TABLE maintenance (cod INTEGER, type VARCHAR(10),
value INTEGER) INHERITS (provider);

CREATE TABLE iower_contract (cnpj VARCHAR(11),
value INTEGER, type VARCHAR(10));

CREATE OR REPLACE FUNCTION insert_unif()RETURNS VOID AS
$$
DECLARE registro RECORD;
BEGIN
	SELECT cnpj, value, type INTO registro FROM uniform;
	IF registro.value < 20000 THEN
		INSERT INTO iower_contract(cnpj, value, type)VALUES(
		registro.cnpj, registro.value, registro.type);
	END IF;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_epi()RETURNS VOID AS
$$
DECLARE registro RECORD;
BEGIN
	SELECT cnpj, value, type INTO registro FROM epi;
	IF registro.value < 20000 THEN
		INSERT INTO iower_contract(cnpj, value, type)VALUES(
		registro.cnpj, registro.value, registro.type);
	END IF;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_main()RETURNS VOID AS
$$
DECLARE registro RECORD;
BEGIN
	SELECT cnpj, value, type INTO registro FROM maintenance;
	IF registro.value < 20000 THEN
		INSERT INTO iower_contract(cnpj, value, type)VALUES(
		registro.cnpj, registro.value, registro.type);
	END IF;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_prov()RETURNS VOID AS
$$
BEGIN
	SELECT insert_unif(); 
	SELECT insert_epi(); 
	SELECT insert_main(); 
END;
$$
LANGUAGE plpgsql;




