USE [SQL-Kurs];
----------------------------------------------------------------------------------------------------------------------------------
DROP TABLE W01T2_nachmittagsübung_personen;
----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE W01T2_nachmittagsübung_personen (
	personen_id bigint identity,
	vorname VARCHAR(50),
	zweitervorname varchar(50),
	nachname VARCHAR(50),
	postleitzahl varchar(5),
	ort varchar(100),
	strasse varchar(100),
	hausnummer varchar(5),
	autokenntzeichen varchar (5)
	);

----------------------------------------------------------------------------------------------------------------------------------
GO
----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('asd1','asd1','masd1','11111','asd1','asd1','asd1','asd1');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('bgh2','bgh2','bgh2','22222','bgh2','bgh2','bgh2','bgh2');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('orc3','orc3','orc3','33333','orc3','orc3','orc3','orc3');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('duff4','duff4','duff4','44444','duff4','duff4','duff4','duff4');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('eur5','eur5','eur5','55555','eur5','eur5','eur5','eur5');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('far6','far6','far6','66666','far6','far6','far6','far6');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('ghi7','ghi7','ghi7','77777','ghi7','ghi7','ghi7','ghi7');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('hi8','hi8','hi8','88888','hi8','hi8','hi8','hi8');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('ihh9','ihh9','ihh9','99999','ihh9','ihh9','ihh9','ihh9');
INSERT INTO W01T2_nachmittagsübung_personen (vorname,zweitervorname,nachname,postleitzahl,ort,strasse,hausnummer,autokenntzeichen) 
VALUES ('jah0','jah0','jah0','00000','jah0','jah0','jah0','jah0');
----------------------------------------------------------------------------------------------------------------------------------
--vorname
select t.vorname,t.zweitervorname,t.nachname,t.postleitzahl,t.ort,t.strasse,t.hausnummer,t.hausnummer,t.autokenntzeichen
from W01T2_nachmittagsübung_personen as t
order by postleitzahl asc ;
----------------------------------------------------------------------------------------------------------------------------------
--vornamen
select t.vorname
from W01T2_nachmittagsübung_personen as t
order by vorname asc ;
----------------------------------------------------------------------------------------------------------------------------------
-- nachnamen
select t.nachname
from W01T2_nachmittagsübung_personen as t
order by nachname desc ;
----------------------------------------------------------------------------------------------------------------------------------
-- plz
select t.postleitzahl
from W01T2_nachmittagsübung_personen as t
order by postleitzahl desc ;

select t.postleitzahl
from W01T2_nachmittagsübung_personen as t
order by postleitzahl asc ;
----------------------------------------------------------------------------------------------------------------------------------
--aurich
--berlin
select t.vorname,t.nachname
from W01T2_nachmittagsübung_personen as t
where postleitzahl <= 15000 ;
----------------------------------------------------------------------------------------------------------------------------------
--vor und nachname
select t.vorname,t.nachname
from W01T2_nachmittagsübung_personen as t
where vorname like 'a%' and nachname like 'm%';