USE [SQL-Kurs];
-------------------------------------------------------------------------------------------------------------
SELECT Tier 
FROM TiereW01T4
WHERE (Beine = 4) AND (Tier LIKE 'H%');
-------------------------------------------------------------------------------------------------------------
SELECT t 
FROM 
   (SELECT Tier AS t, Beine AS b 
    FROM TiereW01T4 
	WHERE Tier like 'H%') AS u
WHERE b = 4;
--same shit
select t.tier, t.beine
from TiereW01T4 as t
where Tier like 'H%' and beine = 4;
-------------------------------------------------------------------------------------------------------------
SELECT Tier,Beine,
	(SELECT Gattung 
	 FROM Gattungen 
	 WHERE TiereW01T4.Gattung_ID = Gattungen.Gattung_ID)
FROM TiereW01T4;
--same shit
select t.Tier,t.Beine,g.Gattung
from gattungen as g,tiereW01T4 as t
where t.Gattung_ID = g.Gattung_ID;
-------------------------------------------------------------------------------------------------------------
INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES ('Tintenfisch' , 0,
	(SELECT Gattung_ID 
	 FROM Gattungen 
	 WHERE Gattung='Wirbellose'));

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES ('Möwe' , 2,
	(SELECT Gattung_ID 
	 FROM Gattungen 
	 WHERE Gattung='Vogel'));

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES ('Huhn' , 2,
	(SELECT Gattung_ID 
	 FROM Gattungen 
	 WHERE Gattung='Vogel'));

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES ('Halbes Hähnchen' , 2,
	(SELECT Gattung_ID 
	 FROM Gattungen 
	 WHERE Gattung='Vogel'));

INSERT INTO TiereW01T4 (Tier, Beine, Gattung_ID) 
VALUES ('Habicht' , 2,
	(SELECT Gattung_ID 
	 FROM Gattungen 
	 WHERE Gattung='Vogel'));
-------------------------------------------------------------------------------------------------------------
UPDATE TiereW01T4 SET Beine=1 WHERE (Tier = 'Halbes Hähnchen');
-------------------------------------------------------------------------------------------------------------
SELECT DISTINCT Tier, Beine 
FROM TiereW01T4;
-------------------------------------------------------------------------------------------------------------
DELETE 
FROM TiereW01T4 
WHERE (Tier = 'Tintenfisch' AND Beine = 0 AND Tiere_ID >
	(SELECT MIN(Tiere_ID) 
	 FROM TiereW01T4 
	 WHERE Tier = 'Tintenfisch' AND Beine = 0));
-------------------------------------------------------------------------------------------------------------
DELETE 
FROM TiereW01T4 
WHERE (Tier = 'Möwe' AND Beine = 2 AND Tiere_ID >
	(SELECT MIN(Tiere_ID) 
	 FROM TiereW01T4 
	 WHERE Tier = 'Möwe' AND Beine = 2));

-------------------------------------------------------------------------------------------------------------
GO
-------------------------------------------------------------------------------------------------------------
SELECT COUNT(Tier) AS Anzahl, AVG(CAST(Beine AS FLOAT)) AS Mittelwert, Gattung 
	FROM TiereW01T4
		LEFT JOIN Gattungen ON Gattungen.Gattung_ID = TiereW01T4.Gattung_ID
	WHERE (Tier LIKE 'H%')
	GROUP BY Gattungen.Gattung
	HAVING (AVG(CAST(Beine AS FLOAT)) > 0)
	ORDER BY Gattungen.Gattung DESC;
-------------------------------------------------------------------------------------------------------------