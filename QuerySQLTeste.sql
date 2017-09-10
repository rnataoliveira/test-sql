CREATE DATABASE db_testeSQLValemobi;

GO
USE db_testeSQLValemobi;

CREATE TABLE Customer(
	IdCustomer integer PRIMARY KEY NOT NULL IDENTITY(1,1),
	NmCustomer varchar(255) NOT NULL,
	CpfCnpj numeric NOT NULL
);

CREATE TABLE AddressType(
	CdAddressType char(1) PRIMARY KEY NOT NULL,
	AddressType varchar(50) NOT NULL
);

CREATE TABLE CustomerAddress(
	IdCustomer integer,
	CdAddressType char(1),
	Street varchar(255) NOT NULL,
	Lot integer NOT NULL,
	Reference varchar(255) NULL,
	ZipCode varchar(50) NOT NULL

	CONSTRAINT FK_IdCustomer FOREIGN KEY (IdCustomer) REFERENCES Customer(IdCustomer),
	CONSTRAINT FK_CdAddressType FOREIGN KEY (CdAddressType) REFERENCES AddressType(CdAddressType),
	CONSTRAINT PK_CustomerAddress PRIMARY KEY (IdCustomer, CdAddressType)
);

INSERT INTO AddressType(CdAddressType, AddressType)
 VALUES 
	('R', 'Residêncial'),
	('C', 'Comercial'),
	('O', 'Outros');

SELECT * FROM AddressType;

INSERT INTO Customer(NmCustomer, CpfCnpj)
VALUES
	('Joãozinho Silva', 88877766655);

SELECT SCOPE_IDENTITY() AS IdLastCustomer;

INSERT INTO CustomerAddress(IdCustomer, CdAddressType, Street, Lot, Reference, ZipCode)
VALUES
	(1, 'R','Rua das Flores',1,null,'01234-567'),
	(1, 'C','Rua das Pedras',100,'Conjuntos 200','01234-567');

SELECT * FROM CustomerAddress;

DELETE FROM CustomerAddress WHERE IdCustomer = (SELECT IdCustomer FROM Customer WHERE CpfCnpj = 88877766655);
DELETE FROM Customer WHERE CpfCnpj = 88877766655;


/*Obs.: Padrão de notação CamelCase*/