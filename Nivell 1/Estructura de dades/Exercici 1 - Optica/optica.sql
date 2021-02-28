
CREATE DATABASE IF NOT EXISTS optica;
USE optica;

CREATE TABLE proveidor (
    nif VARCHAR(15) NOT NULL PRIMARY KEY,
    nom VARCHAR(15),
    address VARCHAR(15),
    fax INT,
    telf INT
);

CREATE TABLE marca (
	  codMarca VARCHAR(15) NOT NULL PRIMARY KEY,
    nombreMarca VARCHAR(20)
);

CREATE TABLE cliente (
	  codiClient VARCHAR(15) NOT NULL PRIMARY KEY,
    nom VARCHAR(15),
    telf INT,
    email VARCHAR(30),
    addressPost VARCHAR(15),
    dateReg DATE
);

CREATE TABLE empleado (
	codEmp VARCHAR(15) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE compra (
	factura VARCHAR(15) PRIMARY KEY,
    codiClient VARCHAR(15),
    codEmp VARCHAR(15),
    CONSTRAINT FK_codiClient FOREIGN KEY (codiClient)
    REFERENCES cliente(codiClient),
    CONSTRAINT FK_codEmp FOREIGN KEY (codEmp)
    REFERENCES empleado(codEmp)
);

CREATE TABLE ulleres (
	cod VARCHAR(15) NOT NULL PRIMARY KEY,
    codMarca VARCHAR(15),
    graduacio DECIMAL(10,2),
    colorVidre VARCHAR(10),
    colorMunt VARCHAR(10),
    typeMunt VARCHAR(10),
    nifProve VARCHAR (15),
    compraUlleres VARCHAR(15),
    CONSTRAINT FK_nifProve FOREIGN KEY (nifProve)
    REFERENCES proveidor(nif),
    CONSTRAINT FK_codMarca FOREIGN KEY (codMarca)
    REFERENCES marca(codMarca),
    CONSTRAINT FK_compraUlleres FOREIGN KEY (compraUlleres)
    REFERENCES compra(factura)
);

INSERT INTO proveidor (nif, nom, address, fax, telf)VALUES('1234567', 'Juan', 'C/Urgell 12', 123456, 938765432);
INSERT INTO proveidor (nif, nom, address, fax, telf)VALUES('1234568', 'Sara', 'C/Aribau 15', 923456, 938765420);
INSERT INTO proveidor (nif, nom, address, fax, telf)VALUES('1234569', 'Toni', 'C/Balmes 120', 723456, 938765430);
INSERT INTO proveidor (nif, nom, address, fax, telf)VALUES('1234570', 'Manuel', 'C/Sants 212', 523456, 93876540);

INSERT INTO marca VALUES('DIS23', 'Diesel');
INSERT INTO marca VALUES('RAY100', 'Rayban');

INSERT INTO cliente VALUES('NE1', 'Neus', 689483232, 'nunu1234@goomail.com', '08004', '2020-02-08');
INSERT INTO cliente VALUES('JUA2', 'Juanan', 689483232, 'Juanan12@goomail.com', '08004', '2020-12-28');

INSERT INTO empleado VALUES('EMP1', 'Jose');
INSERT INTO empleado VALUES('EMP2', 'Marta');

INSERT INTO compra VALUES('123A', 'NE1', 'EMP1');
INSERT INTO compra VALUES('123B','JUA2', 'EMP1');
INSERT INTO compra VALUES('123C','JUA2', 'EMP2');
INSERT INTO compra VALUES('123D','NE1', 'EMP2');

INSERT INTO ulleres VALUES('123A', 'DIS23', 2.3, 'blue','brown', 'mount','1234567', '123A');
INSERT INTO ulleres VALUES('123B', 'DIS23', 0.3, 'brown','red', 'put', '1234568','123B');
INSERT INTO ulleres VALUES('123C', 'RAY100', 7.3, 'black','brown', 'felx','1234568', '123C');
INSERT INTO ulleres VALUES('123D', 'RAY100', 1, 'turq','brown', 'flex','1234570', '123D');
