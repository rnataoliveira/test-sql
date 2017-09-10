CREATE DATABASE db_testeSQLValemobi;

GO
USE db_testeSQLValemobi;

CREATE TABLE tb_customer(
	id_customer integer PRIMARY KEY NOT NULL IDENTITY(1,1),
	nm_customer varchar(255) NOT NULL,
	cpf_cnpj numeric NOT NULL
);

CREATE TABLE dm_address_type(
	cd_address_type char(1) PRIMARY KEY NOT NULL,
	ds_address_type varchar(50) NOT NULL
);

CREATE TABLE tb_customer_address(
	id_customer integer,
	cd_address_type char(1),
	street varchar(255) NOT NULL,
	lot integer NOT NULL,
	reference varchar(255) NULL,
	zip_code varchar(50) NOT NULL

	CONSTRAINT fk_id_customer FOREIGN KEY (id_customer) REFERENCES tb_customer(id_customer),
	CONSTRAINT fk_cd_address_type FOREIGN KEY (cd_address_type) REFERENCES dm_address_type(cd_address_type),
	CONSTRAINT pk_tb_customer_address PRIMARY KEY (id_customer, cd_address_type)
);

/*
1­‐Identifique as colunas que compõe a chave primária de cada tabela.
R.: Tabela: tb_customer PK = id_customer
	Tabela: dm_address_type PK = cd_address_type
	Tabela: FK id_customer + FK cd_address_type formam a PK
*/

INSERT INTO dm_address_type(cd_address_type, ds_address_type)
 VALUES 
	('R', 'Residêncial'),
	('C', 'Comercial'),
	('O', 'Outros');

SELECT * FROM dm_address_type;

/*
2­‐Utilizando o comando INSERT de SQL, crie os scripts para cadastrar o cliente abaixo:
Joãozinho Silva -­‐ 888.777.666-­‐55
Endereço Residencial: Rua das Flores, 1. CEP: 01234-­‐567
Endereço Comercial: Rua das Pedras, 100 Conjunto 200. CEP: 01234-­‐567
*/

INSERT INTO tb_customer(nm_customer, cpf_cnpj)
VALUES
	('Joãozinho Silva', 88877766655);

SELECT SCOPE_IDENTITY() AS id_last_customer;

INSERT INTO tb_customer_address(id_customer, cd_address_type, street, lot, reference, zip_code)
VALUES
	(1, 'R','Rua das Flores',1,null,'01234-567'),
	(1, 'C','Rua das Pedras',100,'Conjuntos 200','01234-567');

SELECT * FROM tb_customer_address;

/*
3­‐Quantos endereços diferentes podem ser cadastrado para um cliente?
R.:Um cliente pode ter um endereço do tipo R(Residêncial), um do tipo C(Comercial) e um do tipo O(Outros).

4-­Dado um CPF, qual seria o passo a passo para excluir um cliente da nossa base de dados?


DELETE FROM tb_customer
WHERE cpf_cnpj = 88877766655;

Neste caso não será possível excluir pois há uma foreign key nesta linha.
*/