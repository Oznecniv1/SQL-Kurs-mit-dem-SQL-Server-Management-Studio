/*
Anmeldung: 
Servernamen einstellen
Windows-Authentifizierung
verbinden
datenbank anlegen:
rechtsklick auf "datenbanken" und dann "neue datenbank"
"Programm anlegen":
rechtsklick auf die datenbank
"neue abfrage"
*/
-----------------------------------------------------------
--welche datenbank soll verwendet werden
USE [SQL-Kurs]
-----------------------------------------------------------
--tier-tabelle löschen
drop table tierew1t1;
-----------------------------------------------------------
--tier tabelle erzeugen
create table tierew1t1 
(
	tiere_ID int IDENTITY,
	tier varchar(50),
	beine integer  
);
-----------------------------------------------------------
insert into tierew1t1 (tier, beine)values ('hund', 4);
insert into tierew1t1 (tier, beine)values ('katze', 4);
insert into tierew1t1 (tier, beine)values ('maus', 4);
insert into tierew1t1 (tier, beine)values ('wildschwein', 4);
insert into tierew1t1 (tier, beine)values ('fliege', 6);
insert into tierew1t1 (tier, beine)values ('hunderfüssler', 99);
insert into tierew1t1 (tier, beine)values ('hering', 0);
insert into tierew1t1 (tier, beine)values ('regenwurm', 0);
insert into tierew1t1 (tier, beine)values ('känguru', 3);
insert into tierew1t1 (tier, beine)values ('elefant', 5);
insert into tierew1t1 (tier, beine)values ('libelle', 6);
insert into tierew1t1 (tier, beine)values ('fledermaus', 2);
insert into tierew1t1 (tier, beine)values ('kamera', 3);
insert into tierew1t1 (tier, beine)values ('strauss', 2);
insert into tierew1t1 (tier, beine)values ('thausendfüssler', 999);
insert into tierew1t1 (tier, beine)values ('mensch', 1);
insert into tierew1t1 (tier, beine)values (null, 42);
-----------------------------------------------------------
go 

-----------------------------------------------------------
select t.tier,t.beine
from tierew1t1 as t;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t;
-----------------------------------------------------------
select t.tiere_ID, t.tier,t.beine
from tierew1t1 as t;
-----------------------------------------------------------
select t.* 
from tierew1t1 as t;
-----------------------------------------------------------
select top(2) t.tiere_ID, t.tier,t.beine 
from tierew1t1 as t;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t 
order by tier asc;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t 
order by tier desc;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t 
order by beine asc;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t 
order by beine desc;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t
where beine = 4;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t
where beine <= 4;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t
where beine >= 4;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t
where beine < 4;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t
where beine > 4;
-----------------------------------------------------------
select t.beine,t.tier
from tierew1t1 as t
where beine < 5 
order by beine desc, tier asc;
-----------------------------------------------------------
select t.tier
from tierew1t1 as t
where t.tier like 'h%' 
order by tier desc;
-----------------------------------------------------------
select t.tier
from tierew1t1 as t
where t.tier like '%e' 
order by tier asc;
-----------------------------------------------------------
select t.tier
from tierew1t1 as t
where t.tier like '%nd_%' 
order by tier asc;
-----------------------------------------------------------
select t.tier
from tierew1t1 as t
where t.tier >= 'M';
-----------------------------------------------------------
select t.tier
from tierew1t1 as t
where ((t.tier >= 'M') or (tier <= 'K'));
-----------------------------------------------------------