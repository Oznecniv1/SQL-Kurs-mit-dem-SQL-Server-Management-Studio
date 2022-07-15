USE [SQL-Kurs]

DROP TABLE autor, buch, buchautor;

go
--------------------------------------------------------------------
CREATE TABLE autor (
	autor_ID INTEGER IDENTITY,
	vorname NVARCHAR (MAX) NOT NULL,
	nachname NVARCHAR (MAX) NOT NULL
);
CREATE TABLE buch (
	buch_ID INTEGER IDENTITY,
	titel NVARCHAR (MAX) NOT NULL
);
CREATE TABLE buchautor (
	buchautor_ID INTEGER IDENTITY,
	autor_ID INTEGER NOT NULL,
	buch_ID INTEGER  NOT NULL
);
GO
--------------------------------------------------------------------
DECLARE @titel VARCHAR(50);
DECLARE @vorname VARCHAR(50);
DECLARE @nachname VARCHAR(50);
DECLARE @autor_id Integer;
DECLARE @buch_id Integer;
declare @buchautor_id integer;
--------------------------------------------------------------------
set @titel = 'bananenreiter1';
set @vorname = 'hans';
set @nachname = 'dieter';

set @titel = 'bananenreiter2';
set @vorname = 'dieter';
set @nachname = 'hans';

set @titel = 'bananenreiter3';
set @vorname = 'hans';
set @nachname = 'hans';

set @titel = 'bananenreiter4';
set @vorname = 'dieter';
set @nachname = 'dieter';
--------------------------------------------------------------------
set @autor_id =(select autor_id from autor where vorname = @vorname and nachname = @nachname );
if (@autor_id is null)
begin
insert into autor(vorname , nachname) values(@vorname,@nachname);
set @autor_id = (select autor_id from autor where vorname = @vorname and nachname = @nachname )
end;
--------------------------------------------------------------------
set @buch_id =(select @buch_id from buch where titel = @titel );
if (@buch_id is null)
begin
insert into autor(vorname , nachname) values(@vorname,@nachname);
set @buch_id = (select @buch_id from buch where titel = @titel )
end;
--------------------------------------------------------------------
set @buchautor_id =(select @buchautor_id from buchautor where autor_id = @autor_id and buch_id = @buch_id );
if (@buchautor_id is null)
begin
insert into buchautor(autor_id , buch_ID) values(@autor_id,@buch_id);
set @buchautor_id =(select @buchautor_id from buchautor where autor_id = @autor_id and buch_id = @buch_id );
end;
--------------------------------------------------------------------






