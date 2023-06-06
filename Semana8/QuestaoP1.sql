use test;
CREATE TABLE  MyTable (ColA INT PRIMARY KEY,
ColB CHAR(3));
INSERT INTO MyTable VALUES (1, 'PeV');
INSERT INTO MyTable VALUES (2, 'NeV');
INSERT INTO MyTable VALUES (3, 'FeB');

SELECT * FROM MyTable;

CREATE TABLE Carros (Codigo int PRIMARY KEY, Modelo text);

INSERT INTO Carros VALUES (NULL, "Alfa Romeo");

INSERT INTO Carros VALUES (5000, "Mazda");

SELECT COUNT(*) FROM Carros;

