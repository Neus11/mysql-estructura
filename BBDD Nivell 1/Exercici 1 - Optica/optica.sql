CREATE DATABASE optica;
USE optica;

CREATE TABLE proveidor (
    nif VARCHAR(15) NOT NULL PRIMARY KEY,
    nom VARCHAR(15),
    address VARCHAR(15),
    fax INT,
    telf INT,
    ulleres_cod VARCHAR(15)
);

CREATE TABLE ulleres (
	  cod VARCHAR(15) NOT NULL PRIMARY KEY,
    marca VARCHAR(10),
    graduacio DECIMAL(10,2),
    colorVidre VARCHAR(10),
    colorMunt VARCHAR(10),
    typeMunt VARCHAR(10)
);

CREATE TABLE cliente (
	  codiClient VARCHAR(15) NOT NULL PRIMARY KEY,
    nom VARCHAR(15),
    telf INT,
    email VARCHAR(30),
    addressPost VARCHAR(15),
    dateReg DATE
);

CREATE TABLE compra (
	  cod VARCHAR(15) NOT NULL,
    codiClient VARCHAR(15) NOT NULL,
	  empVenda VARCHAR(15),
    clientRef VARCHAR(15),
    CONSTRAINT PK_clientProduct PRIMARY KEY (cod,codiClient),
    CONSTRAINT FK_compUlleres FOREIGN KEY (cod)
    REFERENCES ulleres(cod),
    CONSTRAINT FK_compClie FOREIGN KEY (codiClient)
    REFERENCES cliente(codiClient)
);

ALTER TABLE proveidor ADD CONSTRAINT ulleres_cod_FK FOREIGN KEY (ulleres_cod) REFERENCES ulleres(cod);

INSERT INTO ulleres VALUES('123A', 'Rayban', 2.3, 'blue','brown', 'mount');
INSERT INTO ulleres VALUES('123B', 'Gucci', 0.3, 'brown','red', 'put');
INSERT INTO ulleres VALUES('123C', 'Armani', 7.3, 'black','brown', 'stone');
INSERT INTO ulleres VALUES('123D', 'Diesel', 1, 'turq','brown', 'flex');


INSERT INTO proveidor (nif, nom, address, fax, telf, ulleres_cod)VALUES('1234567', 'Juan', 'C/Urgell 12', 123456, 938765432,'123A');
INSERT INTO proveidor (nif, nom, address, fax, telf, ulleres_cod)VALUES('1234568', 'Sara', 'C/Aribau 15', 923456, 938765420,'123B');
INSERT INTO proveidor (nif, nom, address, fax, telf, ulleres_cod)VALUES('1234569', 'Toni', 'C/Balmes 120', 723456, 938765430,'123C');
INSERT INTO proveidor (nif, nom, address, fax, telf, ulleres_cod)VALUES('1234570', 'Manuel', 'C/Sants 212', 523456, 93876540,'123D');


INSERT INTO cliente VALUES('NE1', 'Neus', 689483232, 'nunu1234@goomail.com', '08004', '2020-02-08');
INSERT INTO cliente VALUES('JUA2', 'Juanan', 689483232, 'Juanan12@goomail.com', '08004', '2020-12-28');
INSERT INTO cliente VALUES('SARAI1', 'Sarai', 689483232, 'sarai1@goomail.com', '08004', '2021-01-10');
INSERT INTO cliente VALUES('JOSE2', 'Jose', 689483232, 'jose@goomail.com', '08004', '2019-02-09');


INSERT INTO compra VALUES('123A','NE1', 'Empleado 34', '3456Ref');
INSERT INTO compra VALUES('123B','JUA2', 'Empleado 34', '456Ref');
INSERT INTO compra VALUES('123C','JUA2', 'Empleado 2', '34Ref');
INSERT INTO compra VALUES('123D','NE1', 'Empleado 4', '5600Ref');
