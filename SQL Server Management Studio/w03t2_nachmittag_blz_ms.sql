USE [SQL-Kurs];


-- ------------------------------------------
GO

-- Tabelle erstellen, die den Inhalt der Postleitzahlendatei aufnehmen soll.
CREATE TABLE BLZ
(
   blz					VARCHAR(100),
   merkmal				VARCHAR(30),
   bezeichnung			varchar(150),
   plz					varchar(50),
   ort					varchar(200),
   kurzbezeichnung		varchar(200),
   pan					varchar(100),
   bic					varchar(200),
   pbm					varchar(30),
   datensatznummer		varchar(10),
   aenderungszeichen	varchar(10)
)

-- ------------------------------------------
GO

BULK INSERT BLZ
   FROM 'C:\Users\Mario\Desktop\SQL\BLZ.csv'
   WITH 
      (
	     DATAFILETYPE = 'char',
		 FORMAT = 'CSV',
		 firstrow = 2,
         FIELDTERMINATOR = ';',
         CODEPAGE = 65001,      -- Umwandlung von OEM (Standard) nach Westeuropäisch (mit Umlauten und sonstigen Sonderzeichen)
         ROWTERMINATOR = '\n'  -- Standardwert
      );

-- ------------------------------------------
GO
/*
ALTER TABLE BLZ
  ADD blz_ID INT IDENTITY;

-- ------------------------------------------
GO

ALTER TABLE BLZ
   ADD CONSTRAINT PK_blz_ID PRIMARY KEY (blz_ID);

-- ------------------------------------------
GO


-- 3. Nicht eindeutiger Index auf die Spalte 'PLZ'
CREATE INDEX IX_BLZ
	ON BLZ (pLZ);

-- ------------------------------------------
GO

-- 4. Nicht eindeutiger Index auf die Spalte 'Ortsname'
CREATE INDEX IX_blzort
	ON BLZ (Ort);

-- ------------------------------------------
GO


-- 5. Eindeutiger Index auf die Spalten PLZ und Ortsname
--	Fehler wegen doppelter Schlüssel!
CREATE UNIQUE INDEX IX_PLS_BLZ_Ort
	ON blz (PLZ, Ort);
*/
-- ------------------------------------------
GO
DROP TABLE BLZ;