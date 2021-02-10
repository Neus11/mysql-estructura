CREATE DATABASE pizzeria;

USE pizzeria;

CREATE TABLE provincia (
  idProv VARCHAR(5) NOT NULL PRIMARY KEY,
  nom VARCHAR(25),
  idLoca VARCHAR(10)
);

CREATE TABLE localitat (
  idLoca VARCHAR(10) NOT NULL PRIMARY KEY,
  nom VARCHAR(25),
  idClient INT
);

CREATE TABLE cliente (
  idClient INT NOT NULL PRIMARY KEY,
  nom VARCHAR(25),
  cognom VARCHAR(25),
  codPost INT,
  telf INT,
  idCom INT
);

CREATE TABLE comanda (
  idCom INT NOT NULL PRIMARY KEY,
  diaTime DATE
);

CREATE TABLE producto (
  idProduct INT NOT NULL PRIMARY KEY,
  nom VARCHAR(25),
  preuProduct DECIMAL(10,2),
  tipus VARCHAR(25),
  idCateg INT,
  nomCateg VARCHAR(25),
  hamburguesa VARCHAR(25),
  beguda VARCHAR(25)
);

CREATE TABLE comndaXproduc (
  idCom INT NOT NULL,
  idProduct INT NOT NULL,
  comandaType VARCHAR(25),
  quantity INT,
  preu DECIMAL(10,2),
  diaHora DATETIME
);

CREATE TABLE botiga (
  idBotiga INT NOT NULL PRIMARY KEY,
  addressBot VARCHAR(50),
  codPost INT,
  localit VARCHAR(25),
  provinc VARCHAR(25),
  idCom INT,
  idEmp INT
);

CREATE TABLE empleat (
  idEmp INT NOT NULL PRIMARY KEY,
  nom VARCHAR(25),
  cognom VARCHAR(25),
  nif VARCHAR(25),
  telf INT,
  tipus VARCHAR(25)
);

ALTER TABLE provincia
ADD CONSTRAINT idLoca_fk FOREIGN KEY (idLoca)
REFERENCES localitat(idLoca)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE localitat
ADD CONSTRAINT idClient_fk FOREIGN KEY (idClient)
REFERENCES cliente(idClient)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE comndaXproduc ADD PRIMARY KEY (idCom, idProduct);

ALTER TABLE comndaXproduc
ADD CONSTRAINT idCom_fk FOREIGN KEY (idCom)
REFERENCES comanda(idCom)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE comndaXproduc
ADD CONSTRAINT idProduct_fk FOREIGN KEY (idProduct)
REFERENCES producto(idProduct)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE botiga
ADD CONSTRAINT idCom_bot_fk FOREIGN KEY (idCom)
REFERENCES comanda(idCom)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE botiga
ADD CONSTRAINT idEmp_fk FOREIGN KEY (idEmp)
REFERENCES empleat(idEmp)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE cliente
ADD CONSTRAINT idCom_clie_fk FOREIGN KEY (idCom)
REFERENCES comanda(idCom)
ON UPDATE CASCADE ON DELETE CASCADE;


INSERT INTO comanda VALUES(001, '2021-02-10');
INSERT INTO comanda VALUES(002, '2021-02-05');
INSERT INTO comanda VALUES(003, '2021-02-07');
INSERT INTO comanda VALUES(004, '2021-01-30');

INSERT INTO cliente VALUES(111,'Juan', 'Martimez', 08001, 689445566,001);
INSERT INTO cliente VALUES(222,'Sonia', 'Timez', 08002, 689775566,002);
INSERT INTO cliente VALUES(333,'Jani', 'Mez', 08003, 689885566, 003);
INSERT INTO cliente VALUES(444,'Cristina', 'Castro', 08004, 689335566, 004);

INSERT INTO localitat VALUES('BADA', 'Badalona', 111);
INSERT INTO localitat VALUES('ARN', 'Arenys', 222);
INSERT INTO localitat VALUES('CUG', 'Sant Cugat', 333);
INSERT INTO localitat VALUES('SANTA', 'Santa Coloma', 444);

INSERT INTO provincia(idProv, nom, idLoca) VALUES('BCN', 'Barcelona', 'BADA');
INSERT INTO provincia(idProv, nom, idLoca) VALUES('GIR', 'Girona', 'ARN');
INSERT INTO provincia(idProv, nom, idLoca) VALUES('LLEI', 'Lleida', 'CUG');
INSERT INTO provincia(idProv, nom, idLoca) VALUES('TARR', 'Tarragona', 'SANTA');

INSERT INTO producto(idProduct, nom, preuProduct, tipus, idCateg, nomCateg)
VALUES (123, 'Pizza Carbonara', 10.50, 'Pizza', 11, 'Pizza Blanca');
INSERT INTO producto(idProduct, nom, preuProduct, tipus, idCateg, nomCateg)
VALUES (124, 'Pizza 4 Quesos', 12.50, 'Pizza', 12, 'Pizza Vegetariana');
INSERT INTO producto(idProduct, nom, preuProduct, tipus, idCateg, nomCateg)
VALUES (125, 'Pizza Peperoni', 11.50, 'Pizza', 13, 'Pizza Tradicional');
INSERT INTO producto(idProduct, nom, preuProduct, tipus, idCateg, nomCateg)
VALUES (126, 'Pizza Veggie', 10.50, 'Pizza', 12, 'Pizza Vegetariana');

INSERT INTO empleat VALUES (51,'Josep', 'Maria', '4567890M', 682222233, 'Cuiner');
INSERT INTO empleat VALUES (52,'Jordi', 'Calvo', '4567890W', 683332233, 'Rider');
INSERT INTO empleat VALUES (53,'Marta', 'Marzal', '4567890R', 684442233, 'Cuinera');
INSERT INTO empleat VALUES (54,'Nuria', 'Fernan', '4567890Z', 685552233, 'Rider');

INSERT INTO botiga VALUES (1234, 'Carre Un', 08001, 'Barcelona', 'Barcelona', 001, 51);
INSERT INTO botiga VALUES (1235, 'Carre Dos', 08002, 'Badalona', 'Barcelona', 002, 53);
INSERT INTO botiga VALUES (1236, 'Carre Tres', 08001, 'Hospitalet', 'Barcelona', 003, 51);
INSERT INTO botiga VALUES (1237, 'Carre Cuatre', 08002, 'EL Prat', 'Barcelona', 004, 53);

INSERT INTO comndaXproduc VALUES (001, 123, 'Recollir', 2, 25.50, '2021-01-18 13:17:17');
INSERT INTO comndaXproduc VALUES (002, 124, 'Delivery', 2, 15.50, '2021-01-06 17:17:17');
INSERT INTO comndaXproduc VALUES (003, 125, 'Delivery', 3, 35.50, '2021-01-18 12:17:17');
INSERT INTO comndaXproduc VALUES (001, 126, 'Recollir', 1, 5.50, '2021-01-18 21:17:17');
