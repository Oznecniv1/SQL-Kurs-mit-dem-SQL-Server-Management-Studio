USE [SQL-Kurs];

-- Ohne Doubletten: DISTINCT filtert doppelte Eintraege heraus
--
-- AS: fuer die Anzeige ein "neuer" Spaltenname (Ueberschrift). 
-- Es ist sinnvoll, diesen in Hochkommata zu setzen, damit alle gewuenschten 
-- Zeichen verwendet werden koennen
SELECT DISTINCT Tier AS '1234sdfghjklö"§$%&/(', Beine AS 腿數  FROM TiereW1T1 ORDER BY Tier ASC;

-- -------------------------------------------------

-- alle INT => Ergebnis INT, einer Fliesskomma => Ergebnis Fliesskomma
SELECT 22 / 7 AS '22/7', 22.0 / 7 AS '22.0/7', 22 / 7.0 AS '22/7.0';

/*
 * Arithmetische Operatoren
 * Logische Operatoren
 * Zuweisungsoperator (=)
 * Bitweise Operatoren
 * Mengenoperatoren (ANY, EXISTS, ALL)
 * Vergleichsoperatoren
 * Operator für das Verketten von Zeichenfolgen (+)
 * Verbundoperatoren (+=, -=, /=, *= ...)
 * Unäre Operatoren (NOT, +, -, ~)
 */

 -- Arithmetische Operatoren mit 7 und 4
 SELECT 
	7 + 4 AS 'Addition (+)',
	7 - 4 AS 'Subtraktion (-)',
	7 * 4 AS 'Multiplikation (*)',
	7 / 4 AS 'Division (/)',
	7 % 4 AS 'Modulo (%)';

-- geht nicht
-- SELECT 7 + 4 = 11

/* 
 * Vergleichsoperatoren:
 *
 *    <  kleiner als         >=  grösser oder gleich   !< nicht kleiner als
 *    >  grösser als         <=  kleiner oder gleich   !> nicht grösser als
 *    =  identisch(gleich)   <>  nicht identisch       != nicht identisch
 */
 

 /*
 * Logische Operatoren machen aus mehreren Bedingungen ein logisches Ergebnis
 *
 *    AND  logisches UND 
 *
 *    OR  logisches ODER
 *
 *    XOR(^) exklusives ODER (Antivalenz, d.h. die Operatoren müssen verschieden sein)
 *
 *    NOT  logisches NICHT (unär, nur für einen Operanden)
 *
 *    NOT TRUE = FALSE  
 *    NOT FALSE = TRUE
 */


/* 
 * Vergleichsoperatoren:
 * 
 *     - <Wert> op <Wert> ergibt <logischer Wert>
 *
 *     - >, <=  grösser als, kleiner oder gleich
 *     - <, >=  kleiner als, grösser oder gleich
 *     - =, <>  gleich, ungleich
 *     - !=     nicht gleich       <>
 *     - !>     nicht grösser als  <=
 *     - !<     nicht kleiner als  >=
 */ 

SELECT * FROM TiereW1T1 WHERE (Beine = 4);
SELECT * FROM TiereW1T1 WHERE NOT (Beine = 4);
SELECT * FROM TiereW1T1 WHERE (Beine <> 4);
SELECT * FROM TiereW1T1 WHERE (Beine != 4);

-- nur Personen mit ungerader ID ausgeben
SELECT Person_ID, Vorname, Nachname FROM Personen WHERE Person_ID % 2 = 1;

SELECT * FROM TiereW1T1 WHERE (Beine >= 2) AND (Beine <= 5);
SELECT * FROM TiereW1T1 WHERE (Beine BETWEEN 2 AND 5);
SELECT * FROM TiereW1T1 WHERE (Beine NOT BETWEEN 2 AND 5);

-- Mengenoperatoren
-- [NOT] IN stellt fest, ob ein Wert in einer Liste enthalten ist,
-- IN ist äquivalent zur quantifizierenden Bedingung '= ANY'
SELECT * FROM TiereW1T1 WHERE (Beine IN (0, 6, 2));
SELECT * FROM TiereW1T1 WHERE (Beine NOT IN (0, 4));

SELECT POWER(2, 5) AS 'POWER(2, 5)'; -- 2 hoch 5
SELECT SQRT(2) AS 'SQRT(2)'; -- Wurzel aus 2
SELECT POWER(27.0, CAST(1 AS REAL) /3) AS 'POWER(2, CAST(1 AS REAL) / 3)'; -- dritte Wurzel aus 27 (3 * 3 * 3 = 27)
SELECT 2 * CAST('0123' AS INT); -- 246

-- ------------------------------------------------------
GO

-- Wie teuer ist eine Fahrt mit meinem Auto bei Spritkosten von 1,42€
-- und einer Fahrt von 50 km bei einem Verbauch von 7 Liter pro 100 km?

-- 1. Version (falsches Ergebnis)
SELECT 50 * 7 / 100 * 1.42;

-- 2. Version (richtiges Ergebnis)
SELECT 50 * 7.0 / 100 * 1.42;

-- Gibt das aktuelle Systemdatum und die aktuelle Systemuhrzeit im internen Standardformat zurueck
SELECT GETDATE() AS 'Datun/Uhrzeit';

-- DATEADD (Datumsteil, Anzahl, Datum)
--
-- Gibt einen neuen datetime-Wert zurück, der auf dem Hinzufügen eines Intervalls zum angegebenen Datum
-- basiert.
-- Datumsteil
-- ----------
-- year
-- quarter
-- month
-- dayofyear
-- day
-- week
-- weekday
-- hour
-- minute
-- second
-- millisecond
--
-- Anzahl
-- ------
-- Der Wert, um den Datumsteil inkrementiert wird. Wird ein Wert angegeben, der keine ganze Zahl ist, 
-- werden die Dezimalstellen des Wertes entfernt. Wenn Sie z. B. day für Datumsteil und 1.75 für Anzahl
-- angeben, wird Datum um 1 inkrementiert.
--
-- Datum
-- -----
-- Ist ein Ausdruck, der einen datetime- oder smalldatetime-Wert oder eine Zeichenfolge in einem Datumsformat
-- zurückgibt. Weitere Informationen zu Datumsangaben finden Sie unter Datum und Uhrzeit (Transact-SQL).

-- Welches Datum ist 100 Tage ab jetzt bzw. war vor 100 Tagen? 
SELECT DATEADD(DAY, 100, GETDATE()), GETDATE() + 100;
SELECT DATEADD(DAY, -100, GETDATE()), GETDATE() - 100;

-- 1.75 wird zu einem INT (also 1). Es werden keine untergeordneten Einheiten umgerechnet
SELECT DATEADD(DAY, 1.75, GETDATE());

-- Datum und Uhrzeit in 12 Stunden
SELECT DATEADD (HOUR, 12, GETDATE());

-- Datum und Uhrzeit in 3 Wochen, 5 Tagen und 7 Stunden
SELECT DATEADD(WEEK, 3, DATEADD(DAY, 5, DATEADD(HOUR, 7, GETDATE())));

-- wieviele Wochen bzw. Tage bis Weihnachten?
SELECT DATEDIFF(DAY, GETDATE(), '24.12.2021') AS Tage, DATEDIFF(WEEK, GETDATE(), '24.12.2021') AS Wochen;

SELECT DATEPART (DAY, GETDATE()); -- Tag des Monats von heute
SELECT DATEPART (WEEKDAY, GETDATE()); -- Wochentag von heute
SELECT DATEPART (MONTH, GETDATE()); -- Monat von heute
SELECT DATEPART (HOUR, GETDATE()); -- Stunde von jetzt

SET LANGUAGE ITALIAN;
SELECT DATENAME (MONTH, GETDATE()), DATENAME (WEEKDAY, GETDATE()) ;

SET LANGUAGE DUTCH;
SELECT DATENAME (MONTH, GETDATE()), DATENAME (WEEKDAY, GETDATE()) ;

SET LANGUAGE DEUTSCH;
SELECT DATENAME (MONTH, GETDATE()), DATENAME (WEEKDAY, GETDATE()) ;
