USE [SQL-Kurs];

DROP TABLE TiereW01T4;
DROP TABLE Gattungen;
DROP TABLE Vereine;

-- -----------------------------------------------
GO

CREATE TABLE TiereW01T4 (
	Tiere_ID INT IDENTITY,
	Tier VARCHAR(50),
	Beine INTEGER,
	Gattung_ID INTEGER
);

CREATE TABLE Gattungen (
	Gattung_ID INT IDENTITY,
	Gattung VARCHAR(50)
);

INSERT INTO Gattungen (Gattung) VALUES ('Saeugetier'), ('Vogel'), ('Wirbellose'), 
	('Fisch'), ('Reptilie'), ('Amphibie');

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hund', 4, 1);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Katze', 4, 1);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Möwe', 2, 2);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Fliege', 6, 3);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hundertfüssler', 99, 3);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Regenwurm', 0, 3);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hering', 0, 4);

SELECT * FROM TiereW01T4;
SELECT * FROM Gattungen;

SELECT Tier 
FROM TiereW01T4 
WHERE (Gattung_ID = ANY (
	SELECT Gattung_ID 
	FROM Gattungen 
	WHERE Gattung_ID=999));

SELECT Tier 
FROM TiereW01T4 
WHERE (Gattung_ID = ALL (
	SELECT Gattung_ID 
	FROM Gattungen 
	WHERE Gattung_ID=1));

-- -----------------------------------------------
GO


INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hund', 4, 1);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Katze', 4, 1);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Möwe', 2, 2);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Fliege', 6, 3);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hundertfüssler', 99, 3);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Regenwurm', 0, 3);
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hering', 0, 4);
INSERT INTO TiereW01T4 (Tier, Beine) VALUES ('Qualle', 0);

SELECT * FROM TiereW01T4;

SELECT COUNT(*) FROM TiereW01T4;

-- Loeschen aller Datensaetze mit der ID >= 8
DELETE FROM TiereW01T4 WHERE Tiere_ID >= 8;

-- -----------------------------------------------
GO

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES ('Hering', 0, 4);
SELECT * FROM TiereW01T4;

-- Aendern zweier Werte beim Datensatz mit ID = 64
UPDATE TiereW01T4 
	SET Tier = 'Tintenfisch', Beine = 0, Gattung_ID = 3
	WHERE Tiere_ID = 64;

	
-- -----------------------------------------------
GO

-- Umbenennen einer Spalte
EXEC sp_rename 'TiereW01T4.Tier', 'Tiername', 'COLUMN';
EXEC sp_rename 'TiereW01T4.Tiername', 'Tier', 'COLUMN';

-- -----------------------------------------------
GO

-- alle Datensaetze der ersten Tabelle mit den entsprechenden Daten aus der zweiten Tabelle (falls vorhanden)
SELECT TiereW01T4.Tier, TiereW01T4.Beine, Gattungen.Gattung
	FROM TiereW01T4 LEFT OUTER JOIN Gattungen -- LEFT JOIN geht auch
	ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID;

-- alle Datensaetze der zweiten Tabelle mit den entsprechenden Daten aus der ersten Tabelle (falls vorhanden)
SELECT TiereW01T4.Tier, TiereW01T4.Beine, Gattungen.Gattung
	FROM TiereW01T4 RIGHT OUTER JOIN Gattungen -- RIGHT JOIN geht auch
	ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID;

-- alle Datensaetze der zweiten Tabelle mit den entsprechenden Daten aus der ersten Tabelle (falls vorhanden) und umgekehrt
SELECT TiereW01T4.Tier, TiereW01T4.Beine, Gattungen.Gattung
	FROM TiereW01T4 INNER JOIN Gattungen -- JOIN geht auch
	ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID;

-- Kombination aus LEFT JOIN und RIGHT JOIN (falls vorhanden)
SELECT TiereW01T4.Tier, TiereW01T4.Beine, Gattungen.Gattung
	FROM TiereW01T4 FULL OUTER JOIN Gattungen -- FULL JOIN geht auch
	ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID;

-- Kombination aus LEFT JOIN und RIGHT JOIN (falls vorhanden)
SELECT TiereW01T4.Tier, TiereW01T4.Beine, Gattungen.Gattung
	FROM TiereW01T4 CROSS JOIN Gattungen -- jeder Datensatz aus der ersten mit jedem aus der zweiten Tabelle
--	ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID;

-- -----------------------------------------------
GO

CREATE TABLE Vereine (
	ID INT IDENTITY,
	Verein VARCHAR(50)
);

INSERT INTO Vereine (Verein) VALUES ('BVB'), ('Schalke'), ('Bremen');

-- Jeder Verein spielt gegen allecanderen Vereine, aber niemals gegen sich selbst
SELECT Vereine1.Verein, Vereine2.Verein
	FROM Vereine AS Vereine1 CROSS JOIN Vereine AS Vereine2
	WHERE Vereine1.ID != Vereine2.ID;


-- -----------------------------------------------
GO

SELECT MAX(Beine) AS 'max', MIN(Beine) AS 'min', AVG(CAST(Beine AS FLOAT)) AS 'avg', SUM(Beine) AS 'sum'  FROM TiereW01T4;
