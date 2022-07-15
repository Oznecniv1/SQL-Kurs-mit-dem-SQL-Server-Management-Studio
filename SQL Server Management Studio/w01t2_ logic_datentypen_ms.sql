USE [SQL-Kurs];

-- filtern: alle Tiere, die 4 Beine haben oder 6 Beine und mit 'F' anfangen.
SELECT Tier, Beine FROM TiereW1T1 WHERE Beine = 4 OR Beine = 6 AND Tier LIKE 'F%';

-- filtern: alle Tiere, die 4 oder 6 Beine haben und mit 'F' anfangen.
SELECT Tier, Beine FROM TiereW1T1 WHERE (Beine = 4 OR Beine = 6) AND Tier LIKE 'F%';

/*
    1 + 2 * 3 = 7
    3 * 1 + 2 = 5

	Erst mit der richtigen Klammerung wird das Ergebnis sicher:
	(1 + 2) * 3 = 9
	3 * (1 + 2) = 9
*/

/*
Numerische Datentypen lassen sich in 3 Untergruppen aufteilen: 
1) Ganzzahlen
   a) BIT: 0 oder 1 (1 Bit)
   b) TINYINT: 0 bis 255 (8 Bit)
   c) SMALLINT: -32768 bis 32767 (16 Bit)
   d) INT/INTEGER: -2.147.483.648 bis 2.147.483.647 (32 Bit)
   e) BIGINT: -9.223.372.036.854.775.808 bis 9.223.372.036.854.775.807 (64 Bit)
2) Kommazahlen mit fester Genauigkeit
   a) MONEY: -922.337.203.685.477,5808 bis 922.337.203.685.477,5807 (64 Bit)
   b) SMALLMONEY: -214.748,3648 bis 214.748,3647 (32 Bit)
3) Kommazahlen mit variabler Genauigkeit (Fliesskommazahlen)
   a) FLOAT: -1,79E+308 bis -2,23E-308, 0 und 2,23E-308 bis 1,79E+308 (abh. von Zahl)
   b) REAL: -3,40E+38 bis -1,18E-38, 0 und 1,18E-38 bis 3,40E+38 (32 Bit)

Alphanumerische Datentypen:
4) KEIN UNICODE
   a) feste Laenge: CHAR(<anzahl>)
   b) variable Laenge mit Obergrenze: VARCHAR(<anzahl>)
   c) variable Laenge "ohne" Obergrenze: VARCHAR(MAX), max ist dabei 2.147.483.647
5) UNICODE
   a) feste Laenge: NCHAR(<anzahl>)
   b) variable Laenge mit Obergrenze: NVARCHAR(<anzahl>)
   c) variable Laenge "ohne" Obergrenze: NVARCHAR(MAX), max ist dabei 2.147.483.647

6) Binaere Datentypen
   a) BINARY(<anzahl>)
   b) VARBINARY(<anzahl>)
   c) VARBINARY(MAX)

7) Temporale Datentypen
   a) DATETIME
   b) TIME (seit SQL Server 2008)
   c) DATE (seit SQL Server 2008)

8) Spezielles
   a) XML
*/

DROP TABLE W01T2_TestTab1;

CREATE TABLE W01T2_TestTab1 (
	kette VARCHAR(5),
	ketteVCM VARCHAR(MAX)
	);

-- -------------------------------------------------------
GO

INSERT INTO W01T2_TestTab1 (kette) VALUES ('abc');
INSERT INTO W01T2_TestTab1 (kette) VALUES ('abcde');
-- zu lang, wird nicht gespeichert
-- INSERT INTO W01T2_TestTab1 (kette) VALUES ('abcdefgh');

SELECT * FROM W01T2_TestTab1;

ALTER TABLE W01T2_TestTab1 ALTER COLUMN kette VARCHAR(5);

-- -------------------------------------------------------
GO

/*
"NULL" bezeichnet (als "nichts" zu verstehen) das Fehlen einer Information. 
Das ist aber in vielen Faellen nicht erwuenscht und muss daher explizit "abgeschaltet"
werden. Dies geschieht bei der Erzeugung der Tabelle durch "NOT NULL".
*/

-- INSERT INTO TiereW1T1 (Tier, Beine) VALUES (NULL, 13);
-- INSERT INTO TiereW1T1 (Tier, Beine) VALUES ('Yeti', NULL);
SELECT * FROM TiereW1T1;

-- Tier-Tabelle erzeugen
 CREATE TABLE TiereW1T2
 (
	Tiere_ID INT IDENTITY,
	Tier VARCHAR(50) NULL,
	Beine INTEGER NOT NULL -- kein Wert darf NULL werden!
 );

 INSERT INTO TiereW1T2 (Tier, Beine) VALUES (NULL, 13);
 INSERT INTO TiereW1T2 (Tier, Beine) VALUES ('Yeti', NULL);
 SELECT * FROM TiereW1T2;


/*
https://docs.microsoft.com/de-de/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15
*/

/*
Es ist eine Tabelle mit Personendaten zu erzeugen:
1) Name
2) Vorname
3) PLZ
4) Ort
5) Autokennzeichen

Dort sind einige Datensaetze einzutragen. Keine Information darf NULL sein! Die PLZ ist immer
fuenfstellig!

1) Aufsteigend nach Vorname
2) Aufsteigend nach Name, bei Namensgleichheit, Untersortierung nach Vorname aufsteigend
3) Absteigend nach Postleitzahl
4) Welcher Ort hat das Kennzeichen AUR?
5) Welche Personen kommen aus Berlin?
6) Wessen Vorname beginnt mit einem A UND Nachname mit einem M?
7) Alle Personen aus der Nordhaelfte Deutschlands (PLZ max 5) und wer aus der Suedhaelfte (PLZ >= 6)?
*/
