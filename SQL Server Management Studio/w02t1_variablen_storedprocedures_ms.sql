USE [SQL-Kurs];

-- -----------------------------------------------
GO

SELECT Tier, Beine, Gattung  
	FROM TiereW01T4 
		LEFT JOIN Gattungen ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID
	ORDER BY Tier ASC;

-- -----------------------------------------------
GO

-- die verwendete Variable beginnt mit einem @ und muss korrekt deklariert werden (nur fuer diesen
-- Programmdurchlauf gueltig)
DECLARE @gat VARCHAR(50);

-- Zuweisung der Variablen mittels eines SELECT
SET @gat = (SELECT Gattung  
	FROM TiereW01T4 
		LEFT JOIN Gattungen ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID
	WHERE Tier='Hund');

PRINT @gat;

SELECT @gat AS 'Gattung vom "Hund"';

-- direkte Zuweisung der Variablen 
SET @gat = 'Irgendwas anderes';
PRINT @gat;

-- -----------------------------------------------
GO

-- Verwendung von Zeichenketten:
DECLARE @str1 VARCHAR(10);
DECLARE @str2 VARCHAR(10) = 'Leute';

SET @str1 = 'Hallo';
PRINT '@str1 + @str2 = ' + @str1 + ' ' + @str2; -- ' ' ist ein Leerzeichen

-- -----------------------------------------------
GO

-- Weil die Anweisung nach einem "GO" erfolgt, gilt ein neuer Gueltigkeitsbereich. Die
-- Variable wurde in einem anderen Gueltigkeitsbereich deklariert und ist daher hier nicht
-- mehr bekannt. Es muesste eine erneute Deklaration erfolgen.

DEClARE @gat INTEGER;
SET @gat = 13;

-- Variable um 4 erhoehen
SET @gat = @gat + 4; -- ausfuehrliche Notation
PRINT '(01) gat = ' + CAST(@gat AS VARCHAR(3));

SET @gat += 4; -- verkuerzte Notation (Erhoehung um 4)
PRINT '(02) gat = ' + CAST(@gat AS VARCHAR(3));

SET @gat -= 4; -- verkuerzte Notation (Verkleinerung um 4)
PRINT '(03) gat = ' + CAST(@gat AS VARCHAR(3));

SET @gat = @gat - 4; -- ausfuehrliche Notation
PRINT '(04) gat = ' + CAST(@gat AS VARCHAR(3));

PRINT '(05) gat = ' + CAST((@gat * 13) AS VARCHAR(3));
PRINT '(06) gat = ' + CAST(@gat AS VARCHAR(3));

-- -------------------------------------------------
GO

DECLARE @wert INTEGER = 10;

-- Ist @wert durch zwei ohne Rest teilbar? Falls ja, ist @wert gerade
IF (@wert % 2 = 0)
	BEGIN
	  -- wird ausgefuehrt, falls Bedingung wahr ist, also TRUE
	  -- beliebig viele Anweisungen
	  -- ...
	  PRINT '(07) ' + CAST(@wert AS VARCHAR(MAX)) + ' ist gerade!';
	  -- beliebig viele Anweisungen
	  -- ...
    END;

-- Ist @wert durch zwei nur mit Rest teilbar? Falls ja, ist @wert ungerade
IF (@wert % 2 != 0)
	BEGIN
	  -- beliebig viele Anweisungen
	  -- ...
	  PRINT '(08) ' + CAST(@wert AS VARCHAR(MAX)) + ' ist ungerade!';
	  -- beliebig viele Anweisungen
	  -- ...
    END;

-- Uebrigens: folgt auf das IF (bzw. das ELSE) nur eine Zeile, so kann auf BEGIN und END verzichtet werden

-- Kombination
IF (@wert % 2 = 0)
      -- Kommentar wird nicht als Anweisung gezaehlt
	  PRINT '(09) ' + CAST(@wert AS VARCHAR(MAX)) + ' ist gerade!';
ELSE 
	BEGIN
	  -- wird ausgefuehrt, falls Bedingung falsch ist, also FALSE
	  PRINT '(10) ' + CAST(@wert AS VARCHAR(MAX)) + ' ist ungerade!';
    END;

-- --------------------------------------------------------
GO

DECLARE @tier VARCHAR(50);
DECLARE @beine INTEGER;
DECLARE @gattung VARCHAR(50);

SET @tier = 'Maus';
SET @beine = 4;
SET @gattung = 'Saeugetier';

DECLARE @gattung_ID INTEGER = 
(SELECT Gattung_ID 
 FROM Gattungen 
 WHERE Gattung = @gattung);

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES (@tier, @beine, @gattung_ID);

SET @tier = 'Phantasietier';
SET @beine = 13;
SET @gattung = 'Phantasiegattung';

SET @gattung_ID = (
SELECT Gattung_ID 
FROM Gattungen 
WHERE Gattung = @gattung);
--INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) VALUES (@tier, @beine, @gattung_ID);
PRINT'-------------------------------------';
PRINT 'ID = ' + CAST( @gattung_ID AS VARCHAR(10));
IF (@gattung_ID IS NULL)
  BEGIN
    INSERT INTO Gattungen (Gattung) VALUES (@gattung);
	SET @gattung_ID = (SELECT Gattung_ID FROM Gattungen WHERE Gattung = @gattung);
  END;
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES (@tier, @beine, @gattung_ID);

SELECT * FROM Gattungen;
SELECT * FROM TiereW01T4;

/*
SELECT Tier, Beine, Gattung  
	FROM TiereW01T4 
		LEFT JOIN Gattungen ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID
	ORDER BY Tier ASC;
	*/
