/*
Es ist eine Tabelle mit Personendaten zu erzeugen:
1) Name
2) Vorname
3) PLZ
4) Ort
5) Autokennzeichen

Dort sind einige Datensaetze einzutragen. Keine Infvormation darf NULL sein! Die PLZ ist immer
fuenfstellig!

1) Aufsteigend nach Vorname
2) Aufsteigend nach Name, bei Namensgleichheit, Untersortierung nach Vorname aufsteigend
3) Absteigend nach Postleitzahl
4) Welcher Ort hat das Kennzeichen AUR?
5) Welche Personen kommen aus Berlin?
6) Wessen Vorname beginnt mit einem A UND Nachname mit einem M?
7) Alle Personen aus der Nordhaelfte Deutschlands (PLZ max 5) und wer aus der Suedhaelfte (PLZ >= 6)?
*/

USE [SQL-Kurs];

-- ----------------------------------------------------------------
GO

DROP TABLE Personen;

CREATE TABLE Personen (
	Person_ID BIGINT IDENTITY,
	Vorname NVARCHAR(MAX) NOT NULL,
	Nachname NVARCHAR(MAX) NOT NULL,
	PLZ NVARCHAR(5) NOT NULL,
	Ort NVARCHAR(MAX) NOT NULL,
	Kennzeichen NVARCHAR(3) NOT NULL
);

INSERT INTO Personen (Nachname, Vorname, PLZ, Ort, Kennzeichen) 
	VALUES ('Grosskopf', 'André', '26670', 'Uplengen', 'LER');
INSERT INTO Personen (Nachname, Vorname, PLZ, Ort, Kennzeichen) 
	VALUES ('Mustermann', 'Max', '76661', 'Musterhausen', 'MSH');
INSERT INTO Personen (Nachname, Vorname, PLZ, Ort, Kennzeichen) 
	VALUES ('Ukena', 'Fokko', '26200', 'Aurich', 'AUR');
INSERT INTO Personen (Nachname, Vorname, PLZ, Ort, Kennzeichen) 
	VALUES ('Merkel', 'Angela', '10000', 'Berlin', 'B');
INSERT INTO Personen (Nachname, Vorname, PLZ, Ort, Kennzeichen) 
	VALUES ('Merkel', 'Aaron', '12000', 'Berlin', 'B');
INSERT INTO Personen (Nachname, Vorname, PLZ, Ort, Kennzeichen) 
	VALUES ('Müller', 'Antonia', '99999', 'Posemuckel', 'PSM');


-- SELECT TOP(1) Ort FROM Personen; SELECT TOP(1) PLZ FROM Personen

-- ----------------------------------------------------------------
GO

-- 1) Aufsteigend nach Vorname
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen FROM Personen ORDER BY Vorname ASC;

-- 2) Aufsteigend nach Name, bei Namensgleichheit, Untersortierung nach Vorname aufsteigend
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen FROM Personen ORDER BY Nachname ASC, Vorname ASC;

-- 3) Absteigend nach Postleitzahl
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen FROM Personen ORDER BY PLZ DESC;

-- 4) Welcher Ort hat das Kennzeichen AUR?
SELECT Ort, Kennzeichen FROM Personen WHERE Kennzeichen='AUR';

-- 5) Welche Personen kommen aus Berlin?
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen 
	FROM Personen 
	WHERE (Ort Like' Berlin-%') OR (Ort Like 'Berlin %') OR (Ort = 'Berlin') 
	ORDER BY Nachname ASC, Vorname  ASC;

-- 6) Wessen Vorname beginnt mit einem A UND Nachname mit einem M?
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen 
	FROM Personen 
	WHERE (Vorname LIKE 'A%') AND (Nachname LIKE 'M%')
	ORDER BY Nachname ASC, Vorname  ASC;

-- 7) Alle Personen aus der Nordhaelfte Deutschlands (PLZ max 5) und wer aus der Suedhaelfte (PLZ >= 6)?
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen 
	FROM Personen 
	WHERE (PLZ < '60000')
	ORDER BY Nachname ASC, Vorname  ASC;
SELECT Vorname, Nachname, PLZ, Ort, Kennzeichen 
	FROM Personen 
	WHERE (PLZ >= '60000')
	ORDER BY Nachname ASC, Vorname  ASC;
