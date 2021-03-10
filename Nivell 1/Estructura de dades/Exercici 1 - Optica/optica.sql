CREATE DATABASE IF NOT EXISTS optica;
USE optica;

CREATE TABLE proveidor (
    codProveidor VARCHAR(15) NOT NULL PRIMARY KEY,
    nif VARCHAR(15),
    nom VARCHAR(15),
    address VARCHAR(15),
    fax INT,
    telf INT
);

CREATE TABLE marca (
	  codMarca VARCHAR(15) NOT NULL PRIMARY KEY,
    nombreMarca VARCHAR(20),
    codProveidor VARCHAR (15),
    CONSTRAINT FK_codProveidor FOREIGN KEY (codProveidor)
    REFERENCES proveidor(codProveidor)
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
    CONSTRAINT FK_codMarca FOREIGN KEY (codMarca)
    REFERENCES marca(codMarca)
);

CREATE TABLE transaccion (
  	transaccion_id INT PRIMARY KEY,
	  factura VARCHAR(15),
    cod VARCHAR(15),
    quantity INT,
    price FLOAT,
    CONSTRAINT FK_factura FOREIGN KEY (factura)
    REFERENCES compra(factura),
    CONSTRAINT FK_cod FOREIGN KEY (cod)
    REFERENCES ulleres(cod)
);

INSERT INTO proveidor (codProveidor, nif, nom, address, fax, telf)VALUES('porv 123','1234567', 'Juan', 'C/Urgell 12', 123456, 938765432);
INSERT INTO proveidor (codProveidor, nif, nom, address, fax, telf)VALUES('porv 124','1234568', 'Sara', 'C/Aribau 15', 923456, 938765420);
INSERT INTO proveidor (codProveidor, nif, nom, address, fax, telf)VALUES('porv 125','1234569', 'Toni', 'C/Balmes 120', 723456, 938765430);
INSERT INTO proveidor (codProveidor, nif, nom, address, fax, telf)VALUES('porv 126','1234570', 'Manuel', 'C/Sants 212', 523456, 93876540);

INSERT INTO marca VALUES('DIS23', 'Diesel', 'porv 123');
INSERT INTO marca VALUES('RAY100', 'Rayban', 'porv 124');

INSERT INTO cliente VALUES('NE1', 'Neus', 689483232, 'nunu1234@goomail.com', '08004', '2020-02-08');
INSERT INTO cliente VALUES('JUA2', 'Juanan', 689483232, 'Juanan12@goomail.com', '08004', '2020-12-28');

INSERT INTO empleado VALUES('EMP1', 'Jose');
INSERT INTO empleado VALUES('EMP2', 'Marta');

INSERT INTO compra VALUES('FAC123A', 'NE1', 'EMP1');
INSERT INTO compra VALUES('FAC123B','JUA2', 'EMP1');
INSERT INTO compra VALUES('FAC123C','JUA2', 'EMP2');
INSERT INTO compra VALUES('FAC123D','NE1', 'EMP2');

INSERT INTO ulleres VALUES('123A', 'DIS23', 2.3, 'blue','brown', 'mount');
INSERT INTO ulleres VALUES('123B', 'DIS23', 0.3, 'brown','red', 'put');
INSERT INTO ulleres VALUES('123C', 'RAY100', 7.3, 'black','brown', 'felx');
INSERT INTO ulleres VALUES('123D', 'RAY100', 1, 'turq','brown', 'flex');

INSERT INTO transaccion VALUES(1,'FAC123A','123A', 1, 99);
INSERT INTO transaccion VALUES(2,'FAC123B','123A', 1, 50);
INSERT INTO transaccion VALUES(3,'FAC123C','123B', 3, 170);
INSERT INTO transaccion VALUES(4,'FAC123D','123C', 4, 300);
