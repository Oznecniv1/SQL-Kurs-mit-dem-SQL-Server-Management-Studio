--Es soll drei Tabellen geben:

--1) Buch
--   a) Buch_ID
--   b) Titel

--2) Autor
--   a) Autor_ID
--   b) Vorname
--   c) Nachname

--3) BuchAutor
--   a) ID
--   b) Buch_ID NOT NULL
--   c) Autor_ID NOT NULL

--Es sind ein paar Bücher einzupflegen. Ebenso ein paar Autoren. In der Tabelle Buchautor ist der 
--"Brückenschlag" zwischen den Tabellen. Hier wird realisiert, ob von einem Buch kein Autor bekannt ist 
--(Buch_ID nicht vorhanden), ob ein Buch mehrere Autoren hat oder ob ein Autor existiert bzw. welche Bücher
--welcher Autor geschrieben hat.

--1) Welcher Autor hat welches Buch geschrieben?
--2) Welches Buch wurde von welchem Autor geschrieben?
--3) Zu welchen Büchern ist kein Autor gespeichert?
--4) Zu welchen Autoren ist kein Buch gespeichert?


USE [SQL-Kurs]

CREATE TABLE Buch (
	Buch_ID INTEGER IDENTITY,
	Titel NVARCHAR (MAX) NOT NULL
);

CREATE TABLE Autor (
	Autor_ID INTEGER IDENTITY,
	Vorname NVARCHAR (MAX) NOT NULL,
	Nachname NVARCHAR (MAX) NOT NULL
);

CREATE TABLE BuchAutor (
	BuchAutor_ID INTEGER IDENTITY,
	Autor_ID INTEGER NOT NULL,
	Buch_ID INTEGER  NOT NULL
);

INSERT INTO Autor (Vorname, Nachname) VALUES
	('Günther', 'Grass'),
	('Siegfried', 'Lenz'),
	('Enid', 'Blyton'),
	('Astrid', 'Lindgren'),
	('Ilja', 'Bronstein'),
	('Konstantin', 'Semendjajew'),
	('Gerhard', 'Musiol'),
	('Heiner', 'Mühlig'),
	('Willi', 'Witzig');

INSERT INTO Buch (Titel) VALUES
	('Der Butt'), 
	('Die Blechtrommel'),
	('Fundbüro'),
	('Deutschstunde'),
	('5 Freunde und der Feuerturm'),
	('Pippi Langstrumpf'),
	('Die Kinder von Bullerbü'),
	('Das Taschenbuch der Mathematik'),
	('Die 5 dööfsten Bücher der Welt');

INSERT INTO BuchAutor (Autor_ID, Buch_ID) VALUES
	(1, 1), (1, 2),
	(2, 3), (2, 4),
	(3, 5),
	(4, 6), (4, 7),
	(5, 8), (6, 8), (7, 8), (8, 8);

-- ---------------------------------------------
GO

-- 1)
SELECT Autor.Vorname, Autor.Nachname, Buch.Titel
	FROM Autor
		LEFT JOIN BuchAutor ON Autor.Autor_ID = BuchAutor.Autor_ID
		LEFT JOIN Buch ON Buch.Buch_ID = BuchAutor.Buch_ID
	WHERE Buch.Titel IS NOT NULL;

-- 2)
SELECT Buch.Titel, Autor.Vorname, Autor.Nachname
	FROM Buch
		LEFT JOIN BuchAutor ON Buch.Buch_ID = BuchAutor.Buch_ID
		LEFT JOIN Autor ON BuchAutor.Autor_ID = Autor.Autor_ID
	WHERE (Autor.Vorname IS NOT NULL);

SELECT Autor.Vorname, Autor.Nachname, Buch.Titel
	FROM Autor
		RIGHT JOIN BuchAutor ON Autor.Autor_ID = BuchAutor.Autor_ID
	    RIGHT JOIN Buch ON Buch.Buch_ID = BuchAutor.Buch_ID
	WHERE Buch.Titel IS NOT NULL;

-- 3)
SELECT Buch.Titel
	FROM Buch
		LEFT JOIN BuchAutor ON Buch.Buch_ID = BuchAutor.Buch_ID
		LEFT JOIN Autor ON BuchAutor.Autor_ID = Autor.Autor_ID
	WHERE (Autor.Vorname IS NULL) AND (Autor.Nachname IS NULL);

-- 4)
SELECT Autor.Vorname, Autor.Nachname
	FROM Autor
	WHERE Autor.Autor_ID != ALL (SELECT BuchAutor.Autor_ID FROM BuchAutor);
-- ---------------------------------------------
GO

DROP TABLE Autor, Buch, BuchAutor;