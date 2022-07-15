USE [SQL-Kurs];
go

-- GESPEICHERTE PROZEDUREN (STORED PROCEDURES) sind SQL-Statements, die ähnlich wie
-- Sichten immer wieder verwendet werden, und die mit einer Anweisung, nämlich mit
-- 'EXEC prozedurname', aufgerufen werden. Der besondere Vorteil ihrer Verwendung
-- besteht darin, dass mit Übergabeparametern eine Stored Procedure flexibel an
-- Aufgaben angepasst werden kann. Allerdings haben Stored Procedures keinen
-- Rückgabewert, und vor allem keine Relation (Tabelle) als Rückgabewert.
--
-- Stored Procedures werden im System massiv verwendet. Alle Datenbankobjekte,
-- die mit 'sp_' beginnen, sind gespeicherte Systemprozeduren und alles, was
-- mit 'xp_' anfängt, sind gespeicherte Systemprozeduren, die im Betriebssystem
-- Programme ausführen können (z.B. 'xp_sendmail').
--
-- Vereinfachte Syntax:
--
--		CREATE PROCEDURE Prozedurname
--			parameterliste,..
--		AS
--			BEGIN
--				-- beliebige Mengen an SQL-Befehlen
--				-- mit RETURN kann eine sp verlassen werden
--			END

-- -------------------------------------------------
GO

CREATE PROCEDURE MeineProzedur1 AS
   BEGIN
      PRINT 'Hallo aus der MeineProzedur1'
   END

-- -------------------------------------------------
GO

CREATE PROCEDURE MeineProzedur2 AS
   BEGIN
      PRINT 'Hallo aus der MeineProzedur2';

	  -- Sofortiges Verlassen der Prozedur 
	  -- RETURN;

	  SELECT Tier, Beine, Gattung  
	     FROM TiereW01T4 LEFT JOIN Gattungen ON TiereW01T4.Gattung_ID = Gattungen.Gattung_ID;
   END;

-- -------------------------------------------------
GO

-- QUOTENAME: Gibt eine Unicode-Zeichenfolge mit hinzugefügten Trennzeichen zurück, 
-- sodass die Eingabezeichenfolge ein gültiger SQL Server-Begrenzungsbezeichner wird.
CREATE PROCEDURE TabelleAuslesen
   @tabname NVARCHAR(MAX)
   AS
      BEGIN
		 -- print QUOTENAME(@tabname);
		 DECLARE @sql NVARCHAR(MAX) = N'SELECT * FROM ' + QUOTENAME(@tabname);
		 -- PRINT @sql
         EXECUTE sp_executesql @sql
	  END;
-- -------------------------------------------------
GO

CREATE PROCEDURE TabellenAuslesen
   @spalten NVARCHAR(MAX),
   @tabname1 NVARCHAR(MAX),
   @tabname2 NVARCHAR(MAX),
   @bedingung NVARCHAR(MAX)
   AS
      BEGIN
		 DECLARE @sql NVARCHAR(MAX) 
			= N'SELECT '
			  + @spalten
			  + ' FROM ' 
			  + QUOTENAME(@tabname1) 
			  + ' LEFT JOIN ' 
			  + QUOTENAME(@tabname2)
		      + ' ON ' 
			  + @bedingung;
		 PRINT @sql
         EXECUTE sp_executesql @sql
	  END;

-- -------------------------------------------------
GO

--EXECUTE MeineProzedur1;
EXECUTE MeineProzedur2;

-- EXEC TabelleAuslesen 'TiereW01T4';
--EXEC TabellenAuslesen 'Tier, Beine, Gattung', 'TiereW01T4', 'Gattungen', 'TiereW01T4.Gattung_ID = Gattungen.Gattung_ID';
DROP PROCEDURE MeineProzedur1, MeineProzedur2, TabelleAuslesen, TabellenAuslesen;
go