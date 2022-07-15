use [Project_kopfschmerz_datenbankmodell];
go

drop table gamegenre,gamestyle,gameplattform;
drop trigger checkgame,zeigeneuesgamean,zeigeneuenuseran;
drop table game,rating,publisher,entwickler,beschreibung,genre,style,plattform,users;
drop table rechte;
DROP PROCEDURE Einfuegen;
go

-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE game(
	game_id int identity,
	gamename varchar(100),
	gamepreis varchar(50),
	gamelink varchar(5000),
	erscheinungsdatum varchar(50),
	rating_id int,
	publisher_id int ,
	entwickler_id int ,
	beschreibung_id int ,
	users_id int,
	constraint PK_game_game_id Primary key(game_id)
);
go

INSERT INTO game(gamename,gamepreis,gamelink,erscheinungsdatum,rating_id,publisher_id,entwickler_id,beschreibung_id,users_id) VALUES 
	('spiel1','12,23','bla@1spiel.de','12.1.20',1,2,3,1,1),
	('spiel2','22,23','bla@2spiel.de','12.2.20',2,4,6,2,2),
	('spiel3','32,23','bla@3spiel.de','12.3.20',3,6,9,3,3),
	('spiel4','42,23','bla@4spiel.de','12.4.20',4,8,12,4,4),
	('spiel5','52,23','bla@5spiel.de','12.5.20',5,10,15,5,5),
	('spiel6','62,23','bla@6spiel.de','12.6.20',1,12,18,6,6),
	('spiel7','72,23','bla@7spiel.de','12.7.20',2,14,21,7,7),
	('spiel8','82,23','bla@8spiel.de','12.8.20',3,16,24,8,8),
	('spiel9','92,23','bla@9spiel.de','12.9.20',4,18,27,9,9),
	('spiel10','102,23','bla@10spiel.de','12.10.20',5,20,30,10,10),
	('spiel11','112,23','bla@11spiel.de','12.11.20',1,22,33,1,11),
	('spiel12','122,23','bla@s12piel.de','12.12.20',2,24,36,2,12)
go

-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur draus gelesen
create table rating(
	rating_id int identity,
	rating varchar(50),
	constraint PK_rating_rating_id Primary key(rating_id)
);
go

INSERT INTO rating(rating) VALUES 
	('0'),
	('6'),
	('12'),
	('16'),
	('18');
go
-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur draus gelesen
create table publisher(
	publisher_id int identity,
	publisher varchar(100),
	land varchar(100),
	constraint PK_publisher_publisher_id Primary key(publisher_id)
);
go

INSERT INTO publisher(publisher, land) VALUES 
	('Tencent','China'),
	('Sony Interactive Entertainment','japan'),
	('Microsoft Studios','Amerika'),
	('Apple','Amerika'),
	('Activision Blizzard','Amerika'),
	('Google','Amerika'),
	('NetEase','China'),
	('Electronic Arts','Amerika'),
	('Nintendo','Japan'),
	('Bandai Namco Games','Japan'),
	('Paradox Interactive','Schweden'),
	('Sega','Japan'),
	('Take-Two Interactive','Amerika'),
	('Warner Bros. Interactive Entertainment','Amerika'),
	('Bethesda Softworks','Amerika'),
	('Team17','England'),
	('Degica','Japan'),
	('Devolver Digital','Amerika'),
	('Daedalic Entertainment','Deutschland'),
	('Curve Digital','England'),
	('tinyBuild Games','Amerika'),
	('NIS America','Japan'),
	('Aksys Games','Amerika'),
	('505 Games','Italien'),
	('Gambitious Digital Entertainment','Niederlande'),
	('Focus Home Interactive','Frankreich'),
	('Artifex Mundi','Polen'),
	('Koei Tecmo','Japan'),
	('10tons Entertainment','Finnland'),
	('Idea Factory','Japan'),
	('Deep Silver','Deutschland'),
	('Digerati Distribution','Amerika'),
	('THQ Nordic GmbH','Wien'),
	('Aerosoft','Deutschland'),
	('Astragon','Deutschland'),
	('Bitcomposer','Deutschland'),
	('Crytek','Deutschland'),
	('TopWare Interactive','Deutschland'),
	('rondomedia','Deutschland'),
	('magnussoft','Deutschland'),
	('Kalypso Media','Deutschland'),
	('Gameforge','Deutschland'),
	('Deep Silver','Deutschland'),
	('Egosoft','Deutschland'),
	('Ubisoft','Kanada'),
	('Piranha Bytes','Deutschland'),
	('Neopoly','Deutschland'),
	('Crytek','Deutschland'),
	('Yager','Deutschland'),
	('Gamigo','Deutschland'),
	('King Art Games','Deutschland'),
	('Handygames','Deutschland'),
	('Deck 13','Deutschland'),
	('Cipsoft','Deutschland'),
	('Limbic Entertainment','Deutschland'),
	('Bigpoint','Deutschland'),
	('King','Deutschland'),
	('Gameduell','Deutschland'),
	('Gameforge','Deutschland'),
	('DS Fishlabs','Deutschland'),
	('Travian Games *','Deutschland'),
	('Kalypso Media *','Deutschland'),
	('Softgames','Deutschland'),
	('Chimera Entertainment','Deutschland'),
	('Upjers','Deutschland'),
	('Innogames','Deutschland'),
	('Realmforge Studios','Deutschland'),
	('Bytro Labs','Deutschland'),
	('Goodgame Studios','Deutschland'),
	('Wooga','Deutschland'),
	('Megazebra','Deutschland'),
	('Xyrality','Deutschland'),
	('Mimimi Games','Deutschland'),
	('Studio Fizbin','Deutschland'),
	('Nukklear','Deutschland'),
	('Sandbox Interactive','Deutschland'),
	('Black Forest Games','Deutschland'),
	('Klang','Deutschland'),
	('Rockfish Games','Deutschland'),
	('Whow Games','Deutschland'),
	('Grimlore Games','Deutschland'),
	('Cloud Imperium Games','Deutschland'),
	('Stratosphere Games','Deutschland'),
	('Kolibri Games','Deutschland'),
	('Wargaming Mobile','Deutschland'),
	('Ubisoft Blue Byte','Deutschland'),
	('Epic Games','Amerika'),
	('Riot Games','Amerika')
go

-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur draus gelesen
create table entwickler(
	entwickler_id int identity,
	entwickler varchar(100),
	land varchar(100),
	constraint PK_entwickler_entwickler_id Primary key(entwickler_id)
);
go

INSERT INTO entwickler(entwickler, land) VALUES 
	('Tencent','China'),
	('Sony Interactive Entertainment','japan'),
	('Microsoft Studios','Amerika'),
	('Apple','Amerika'),
	('Activision Blizzard','Amerika'),
	('Google','Amerika'),
	('NetEase','China'),
	('Electronic Arts','Amerika'),
	('Nintendo','Japan'),
	('Bandai Namco Games','Japan'),
	('Paradox Interactive','Schweden'),
	('Sega','Japan'),
	('Take-Two Interactive','Amerika'),
	('Warner Bros. Interactive Entertainment','Amerika'),
	('Bethesda Softworks','Amerika'),
	('Team17','England'),
	('Degica','Japan'),
	('Devolver Digital','Amerika'),
	('Daedalic Entertainment','Deutschland'),
	('Curve Digital','England'),
	('tinyBuild Games','Amerika'),
	('NIS America','Japan'),
	('Aksys Games','Amerika'),
	('505 Games','Italien'),
	('Gambitious Digital Entertainment','Niederlande'),
	('Focus Home Interactive','Frankreich'),
	('Artifex Mundi','Polen'),
	('Koei Tecmo','Japan'),
	('10tons Entertainment','Finnland'),
	('Idea Factory','Japan'),
	('Deep Silver','Deutschland'),
	('Digerati Distribution','Amerika'),
	('THQ Nordic GmbH','Wien'),
	('Aerosoft','Deutschland'),
	('Astragon','Deutschland'),
	('Bitcomposer','Deutschland'),
	('Crytek','Deutschland'),
	('TopWare Interactive','Deutschland'),
	('rondomedia','Deutschland'),
	('magnussoft','Deutschland'),
	('Kalypso Media','Deutschland'),
	('Gameforge','Deutschland'),
	('Deep Silver','Deutschland'),
	('Egosoft','Deutschland'),
	('Ubisoft','Kanada'),
	('Piranha Bytes','Deutschland'),
	('Neopoly','Deutschland'),
	('Crytek','Deutschland'),
	('Yager','Deutschland'),
	('Gamigo','Deutschland'),
	('King Art Games','Deutschland'),
	('Handygames','Deutschland'),
	('Deck 13','Deutschland'),
	('Cipsoft','Deutschland'),
	('Limbic Entertainment','Deutschland'),
	('Bigpoint','Deutschland'),
	('King','Deutschland'),
	('Gameduell','Deutschland'),
	('Gameforge','Deutschland'),
	('DS Fishlabs','Deutschland'),
	('Travian Games *','Deutschland'),
	('Kalypso Media *','Deutschland'),
	('Softgames','Deutschland'),
	('Chimera Entertainment','Deutschland'),
	('Upjers','Deutschland'),
	('Innogames','Deutschland'),
	('Realmforge Studios','Deutschland'),
	('Bytro Labs','Deutschland'),
	('Goodgame Studios','Deutschland'),
	('Wooga','Deutschland'),
	('Megazebra','Deutschland'),
	('Xyrality','Deutschland'),
	('Mimimi Games','Deutschland'),
	('Studio Fizbin','Deutschland'),
	('Nukklear','Deutschland'),
	('Sandbox Interactive','Deutschland'),
	('Black Forest Games','Deutschland'),
	('Klang','Deutschland'),
	('Rockfish Games','Deutschland'),
	('Whow Games','Deutschland'),
	('Grimlore Games','Deutschland'),
	('Cloud Imperium Games','Deutschland'),
	('Stratosphere Games','Deutschland'),
	('Kolibri Games','Deutschland'),
	('Wargaming Mobile','Deutschland'),
	('Ubisoft Blue Byte','Deutschland'),
	('Epic Games','Amerika'),
	('Riot Games','Amerika')
go

-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur reinbeschrieben und programmteschnich draus gelesen
create table beschreibung(
	beschreibung_id int identity,
	beschreibung varchar(5000),
	constraint PK_beschreibung_beschreibung_id Primary key(beschreibung_id)
);
go

INSERT INTO beschreibung(beschreibung) VALUES 
	('1 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('2 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('3 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('4 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('5 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('6 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('7 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('8 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('9 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('10 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('11 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!'),

	('12 Bacon ipsum dolor amet filet mignon beef ribs shoulder rump, capicola brisket sirloin pancetta meatball. Frankfurter kielbasa fatback ribeye. Short loin porchetta ribeye frankfurter. Burgdoggen chicken short ribs ground round jerky. Drumstick tail pancetta, boudin flank short loin biltong t-bone. Drumstick meatloaf turducken, sausage ham hock kevin pork ribeye doner fatback hamburger flank andouille. Kevin strip steak rump, beef tail sirloin pork belly tongue capicola chuck turkey chicken.
	Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!');
go

-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur rausgelesen und mittels id in gamegenre hinterlegt
create table genre(
	genre_id  int identity,
	genre varchar(100),
	constraint pk_genre_genre_id primary key(genre_id)
);
go

INSERT INTO genre(genre) VALUES 
	('Action'),
	('Beat em ups'),
	('Ego Shooter'),
	('Erotikvideospiele'),
	('Geschicklichkeitsspiel'),
	('Jump and Runs'),
	('Lernspiel'),
	('Open World Spiel'),
	('Musik'),
	('Quiz'),
	('Rollenspiel'),
	('Puzzle'),
	('Shoot em up'),
	('Simulation'),
	('Western'),
	('Sport'),
	('Strategie'),
	('Abendteuer'),
	('Anime'),
	('Horror'),
	('Survival'),
	('SCI FI'),
	('Wetlraum'),
	('Roguelike')
go

-------------------------------------------------------------------------------------------------------------------------
--zwischen tabelle. wird nur reingeschrieben und mittels id hinterlegt
create table gamegenre(
	gamegenre_id int ,
	game_id int ,
	genre_id int,
	constraint pk_gamegenre_gamegenre_id primary key(gamegenre_id)
);
go

-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur rausgelesen und mittels id in gamestyle hinterlegt
create table style(
	style_id int identity ,
	style varchar(100),
	constraint pk_style_style_id primary key(style_id)
);
go

INSERT INTO style(style) VALUES 
        ('3D '),
        ('2D '),
        ('VR'),
        ('Cellshading')
go

-------------------------------------------------------------------------------------------------------------------------
--zwischen tabelle. wird nur reingeschrieben und mittels id hinterlegt
create table gamestyle(
	gamestyle_id int ,
	game_id int ,
	style_id int,
	constraint pk_gamestyle_gamestyle_id primary key(gamestyle_id)
);
go

-------------------------------------------------------------------------------------------------------------------------
--normale tabelle. wird nur rausgelesen und mittels id in gameplattform hinterlegt
create table plattform(
	plattform_id int identity,
	plattform varchar(100),
	constraint pk_plattform_plattform_id primary key(plattform_id)
);
go

-------------------------------------------------------------------------------------------------------------------------
INSERT INTO plattform(plattform) VALUES 
        ('Switch '),
        ('PC '),
        ('PS 4'),
        ('Wii'),
        ('Wii U '),
        ('PS 3 '),
        ('PS 2 '),
        ('XBox one '),
        ('XBOX 360 '),
        ('XBox one X '),
        ('PS4 Pro '),
        ('PS 5 '),
        ('PS 5 Pro '),
        ('XBox Scarlett '),
        ('Mobile ')
go
-------------------------------------------------------------------------------------------------------------------------
--zwischen tabelle. wird nur reingeschrieben und mittels id hinterlegt
create table gameplattform(
	gameplattform_id int identity,
	game_id int ,
	plattform_id int,
	constraint pk_gameplattform_gameplattform_id primary key(gameplattform_id)
	
);
go

-------------------------------------------------------------------------------------------------------------------------
--erstellung vom fk in tabelle game
alter table game
	ADD CONSTRAINT FK_rating_id FOREIGN KEY (rating_id)REFERENCES rating 
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
--erstellung vom fk in tabelle game
alter table game
	ADD CONSTRAINT FK_publisher_id FOREIGN KEY (publisher_id)REFERENCES publisher 
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
--erstellung vom fk in tabelle game
alter table game
	ADD CONSTRAINT FK_entwickler_id FOREIGN KEY (entwickler_id)REFERENCES entwickler 
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
--erstellung vom fk in tabelle game
alter table game
	ADD CONSTRAINT FK_beschreibung_id FOREIGN KEY (beschreibung_id)REFERENCES beschreibung 
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
alter table gameplattform
	ADD CONSTRAINT FK_gameplattform_game_id FOREIGN KEY (game_id) REFERENCES game
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
alter table gameplattform
	ADD CONSTRAINT FK_plattform_id FOREIGN KEY (plattform_id) REFERENCES plattform
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
alter table gamegenre
	ADD CONSTRAINT FK_gamegenre_game_id FOREIGN KEY (gamegenre_id) REFERENCES game
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
alter table gamegenre
	ADD CONSTRAINT FK_genre_id FOREIGN KEY (genre_id) REFERENCES genre
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
alter table gamestyle
	ADD CONSTRAINT FK_gamestyle_game_id FOREIGN KEY (gamestyle_id) REFERENCES  game
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
alter table gamestyle
	ADD CONSTRAINT FK_style_id FOREIGN KEY (style_id)REFERENCES style
	on delete cascade
	on update cascade;
go

-------------------------------------------------------------------------------------------------------------------------
create table users(
	users_id int identity,
	vorname varchar(100),
	nachname varchar(100),
	postleitzahl int ,
	ort varchar(50),
	strasse varchar(100),
	hausnummer varchar(100),
	e_mail varchar(200) ,
	passwort varchar(200) ,
	rechte_id int , 
	constraint PK_users_users_id Primary key(users_id)
);
go

INSERT INTO users(vorname,nachname,postleitzahl,ort,strasse,hausnummer,e_mail,passwort,rechte_id) VALUES 
        ('mario1','sigismondi1',00000,'ort0','zuhause1','1456','1bla@bla.de','1bla',1),
	    ('mario2','sigismondi2',10000,'ort1','zuhause2','2456','2bla@bla.de','2bla',2),
	    ('mario3','sigismondi3',20000,'ort2','zuhause3','3456','3bla@bla.de','3bla',3),
		('mario4','sigismondi4',30000,'ort3','zuhause4','4456','4bla@bla.de','4bla',4),
		('mario5','sigismondi5',40000,'ort4','zuhause5','5456','5bla@bla.de','5bla',5),
		('mario6','sigismondi6',50000,'ort5','zuhause6','6456','6bla@bla.de','6bla',1),
		('mario7','sigismondi7',60000,'ort6','zuhause7','7456','7bla@bla.de','7bla',2),
		('mario8','sigismondi8',70000,'ort7','zuhause8','8456','8bla@bla.de','8bla',3),
		('mario9','sigismondi9',80000,'ort8','zuhause9','9456','9bla@bla.de','9bla',4),
		('mario10','sigismondi10',90000,'ort9','zuhause10','1056','10bla@bla.de','10bla',5),
		('mario11','sigismondi11',10000,'ort10','zuhause11','1116','11bla@bla.de','11bla',1),
		('mario12','sigismondi12',11000,'ort11','zuhause12','1256','12bla@bla.de','12bla',2)

go
-------------------------------------------------------------------------------------------------------------------------
create table rechte(
	rechte_id int identity,
	rechte varchar(100),
	constraint PK_rechte Primary key(rechte_id)
);
go

INSERT INTO rechte( rechte) VALUES 
        ('rechte 1'),
        ('rechte 2'),
        ('rechte 3'),
        ('rechte 4'),
		('rechte 5')
go
-------------------------------------------------------------------------------------------------------------------------
select * from game;
go
-------------------------------------------------------------------------------------------------------------------------
select * from users;
go
-------------------------------------------------------------------------------------------------------------------------
select * from rating;
go
-------------------------------------------------------------------------------------------------------------------------
select * from publisher;
go
-------------------------------------------------------------------------------------------------------------------------
select * from entwickler;
go
-------------------------------------------------------------------------------------------------------------------------
select * from beschreibung;
go
-------------------------------------------------------------------------------------------------------------------------
select * from genre;
go
-------------------------------------------------------------------------------------------------------------------------
select * from gamegenre;
go
-------------------------------------------------------------------------------------------------------------------------
select * from plattform;
go
-------------------------------------------------------------------------------------------------------------------------
select * from gameplattform;
go
-------------------------------------------------------------------------------------------------------------------------
select * from style;
go
-------------------------------------------------------------------------------------------------------------------------
select * from gamestyle;
go
-------------------------------------------------------------------------------------------------------------------------
select * from rechte;
go
-------------------------------------------------------------------------------------------------------------------------
select (cast(count(game_id)as float) / (select count(*) from game)) * 100
from game
left join rating on game.rating_id = rating.rating_id  
where rating != '18';
go

-------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Einfuegen
--users
@vorname				varchar(100),
@nachname				varchar(100),
@postleitzahl			int,
@ort					varchar(100),
@strasse				varchar(100),
@hausnummer				varchar(100),
@e_mail					varchar(200),
@passwort				varchar(200),
@rechte					varchar(100),
--game
@gamename				varchar(100),
@gamepreis				float,
@gamelink				varchar(1000),
@erscheinungsdatum		varchar(100),
@rating					varchar(100),
@publisher				varchar(100),
@entwickler				varchar(100),
--beschreibung
@beschreibung			varchar(5000),
--genre
@genre					varchar(100),
--style
@style					varchar(100),
--plattform
@plattform				varchar(100)
-------------------------------------------------------------------------------------------------------------------------
as
begin
--users
declare @users_id			Integer;
declare @rechte_id			integer;
--game
declare @game_id			integer;
declare @rating_id			integer;
declare @publisher_id		integer;
declare @entwickler_id		integer;
declare @beschreibung_id	integer;
declare @genre_id			integer;
declare @style_id			integer;
declare @plattform_id		integer;
-------------------------------------------------------------------------------------------------------------------------
if	(@vorname is not null) and 
	(@nachname is not null) and 
	(@postleitzahl is not null) and 
	(@ort is not null) and 
	(@strasse is not null) and 
	(@hausnummer is not null) and 
	(@e_mail is not null) and 
	(@passwort is not null)  
	
	begin 
		set @users_id = (select users_id from users where	(vorname = @vorname) and 
															(nachname = @nachname) and 
															(postleitzahl = @postleitzahl) and 
															(ort = @ort) and 
															(strasse = @strasse) and 
															(hausnummer = @hausnummer) and 
															(e_mail = @e_mail) and 
															(passwort = @passwort)  
															);
		if(@users_id is null)
			begin
				insert into users (vorname, nachname, postleitzahl, ort,strasse, hausnummer, e_mail, passwort) 
				values (@vorname, @nachname, @postleitzahl, @ort,@strasse, @hausnummer, @e_mail, @passwort);
				set @users_id =(select users_id from users where	(vorname = @vorname) and 
																	(nachname = @nachname)and
																	(postleitzahl = @postleitzahl)and
																	(ort = @ort)and
																	(strasse = @strasse)and
																	(hausnummer = @hausnummer) and
																	(e_mail = @e_mail) and
																	(passwort = @passwort));
			end;
	end;
	else
	set @users_id = null;
-------------------------------------------------------------------------------------------------------------------------
if	(@gamename is not null) and 
	(@gamepreis is not null) and 
	(@gamelink is not null) and 
	(@erscheinungsdatum is not null)
	begin
		set @game_id = (select game_id from game where	(gamename = @gamename) and 
														(gamepreis = @gamepreis) and 
														(gamelink = @gamelink) and
														(erscheinungsdatum = @erscheinungsdatum) 
														);
	if (@game_id is null)
		begin
			insert into game (gamename,gamepreis,gamelink,erscheinungsdatum)
			values (@gamename,@gamepreis,@gamelink,@erscheinungsdatum);
			set @game_id = (select game_id from game where	(gamename = @gamename) and
															(gamepreis = @gamepreis) and
															(gamelink = @gamelink) and
															(erscheinungsdatum = @erscheinungsdatum)
															);
		end;
	end;
	else
	set @game_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@rechte is not null) --fertig??
	begin
		set @rechte_id = (select rechte_id from rechte where (rechte = @rechte));
		if (@rechte_id is null)
			begin
				insert into rechte(rechte) values (@rechte);
				set @rechte_id =(select rechte_id from rechte where (rechte = @rechte));
			end;
	end;
		else 
			set @rechte_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@rating is not null) --fertig??
	begin
		set @rating_id = (select rating_id from rating where (rating = @rating));
		if (@rating_id is null)
			begin
				insert into rating (rating) values (@rating);
				set @rating_id =(select rating_id from rating where (rating = @rating));
			end;
	end;
	else 
	set @rating_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@publisher is not null) --fertig??
	begin
		set @publisher_id = (select publisher_id from publisher where (publisher = @publisher));
		if (@publisher_id is null)
			begin
				insert into publisher (publisher) values (@publisher);
				set @publisher_id =(select publisher_id from publisher where (publisher = @publisher));
			end;
	end;
	else 
	set @publisher_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@entwickler is not null) --fertig??
	begin
		set @entwickler_id = (select entwickler_id from entwickler where (entwickler = @entwickler));
		if (@entwickler_id is null)
			begin
				insert into entwickler (entwickler) values (@entwickler);
				set @entwickler_id =(select entwickler_id from entwickler where (entwickler = @entwickler));
			end;
	end;
	else 
	set @entwickler_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@beschreibung is not null) --fertig??
	begin
		set @beschreibung_id = (select beschreibung_id from beschreibung where (beschreibung = @beschreibung));
		if (@beschreibung_id is null)
			begin
				insert into beschreibung (beschreibung) values (@beschreibung);
				set @beschreibung_id =(select beschreibung_id from beschreibung where (beschreibung = @beschreibung));
			end;
	end;
	else 
	set @beschreibung_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@genre is not null) --fertig??
	begin
		set @genre_id = (select genre_id from genre where (genre = @genre));
		if (@genre_id is null)
			begin
				insert into genre (genre) values (@genre);
				set @genre_id =(select genre_id from genre where (genre = @genre));
			end;
	end;
	else 
	set @genre_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@style is not null) --fertig??
	begin
		set @style_id = (select style_id from style where (style = @style));
		if (@style_id is null)
			begin
				insert into style (style) values (@style);
				set @style_id =(select style_id from style where (style = @style));
			end;
	end;
	else 
	set @style_id = null;
-------------------------------------------------------------------------------------------------------------------------
if (@plattform is not null) --fertig??
	begin
		set @plattform_id = (select plattform_id from plattform where (plattform = @plattform));
		if (@plattform_id is null)
			begin
				insert into plattform (plattform) values (@plattform);
				set @plattform_id =(select plattform_id from plattform where (plattform = @plattform));
			end;
	end;
	else 
	set @plattform_id = null;
-------------------------------------------------------------------------------------------------------------------------
end;
go

--user
declare @vorname			varchar(100);
declare @nachname			varchar(100);
declare @postleitzahl		int;
declare @ort				varchar(100);
declare @strasse			varchar(100);
declare @hausnummer			varchar(100);
declare @e_mail				varchar(200);
declare @passwort			varchar(200);
declare @rechte				varchar(100);
--game
declare @gamename			varchar(100);
declare @gamepreis			float;
declare @gamelink			varchar(1000);
declare @erscheinungsdatum	varchar(100);
declare @rating				varchar(100);
declare @publisher			varchar(100);
declare @entwickler			varchar(100);
--beschreibung
declare @beschreibung		varchar(5000);
--genre
declare @genre				varchar(100);
--style
declare @style				varchar(100);
--plattform
declare @plattform			varchar(100);
-------------------------------------------------------------------------------------------------------------------------
--users
set @vorname				='testpro';
set @nachname				='testpro';
set @postleitzahl			= 30125
set @ort					='testpro';
set @strasse				='testpro';
set @hausnummer				='testpro';
set @e_mail					='testpro';
set @passwort				='testpro';
set @rechte					='testpro';
--game
set @gamename				='testpro';
set @gamepreis				= 12.12;
set @gamelink				='testpro';
set @erscheinungsdatum		='testpro';
set @rating					='testpro';
set @publisher				='testpro';
set @entwickler				='testpro';
--beschreibung
set @beschreibung			='testpro';
--genre
set @genre					='testpro';
--style
set @style					='testpro';
--plattform
set @plattform				='testpro';
-------------------------------------------------------------------------------------------------------------------------
execute Einfuegen	@vorname,
					@nachname,
					@postleitzahl,
					@ort,
					@strasse,
					@hausnummer,
					@e_mail,
					@passwort,
					@rechte,
					@gamename,
					@gamepreis,
					@gamelink,
					@erscheinungsdatum,
					@rating,
					@publisher,
					@entwickler,
					@beschreibung,
					@genre,
					@style,
					@plattform;
-------------------------------------------------------------------------------------------------------------------------
go

create trigger zeigeneuenuseran
	on users
	after insert
as
begin
	select vorname,nachname,postleitzahl,ort,strasse,hausnummer,e_mail,passwort from inserted;
	declare @usercursor cursor;
	set @usercursor = CURSOR local scroll FOR select	vorname,
														nachname,
														postleitzahl,
														ort,
														strasse,
														hausnummer,
														e_mail,
														passwort
														from inserted;					
	declare @vorname		varchar(100);
	declare	@nachname		varchar(100);
	declare	@postleitzahl	varchar(100);
	declare	@ort			varchar(100);
	declare	@strasse		varchar(100);
	declare	@hausnummer		varchar(100);
	declare	@e_mail			varchar(100);
	declare	@passwort		varchar(100);
	open @usercursor;
	fetch next from @usercursor into	@vorname,
										@nachname,
										@postleitzahl,
										@ort,
										@strasse,
										@hausnummer,
										@e_mail,
										@passwort;
	while(@@FETCH_STATUS =0)
	begin
		print 'neuer user: '+	@vorname		+' '+  
								@nachname		+' '+  
								@postleitzahl	+' '+  
								@ort			+' '+  
								@strasse		+' '+  
								@hausnummer		+' '+  
								@e_mail			+' '+  
								@passwort		+' ';

		fetch next from @usercursor into @vorname,
										 @nachname,
										 @postleitzahl,
										 @ort,
										 @strasse,
										 @hausnummer,
										 @e_mail,
										 @passwort;
	end;
	close @usercursor;
	deallocate @usercursor;
end;
go
-------------------------------------------------------------------------------------------------------------------------
create trigger zeigeneuesgamean
	on game 
	after insert
as
begin
	select gamename,gamepreis,gamelink,erscheinungsdatum from inserted;
	declare @gamecursor cursor;
	set @gamecursor = CURSOR LOCAL SCROLL FOR SELECT	gamename,
														gamepreis,
														gamelink,
														erscheinungsdatum
	FROM inserted;
	declare @gamename				varchar(100);
	declare	@gamepreis				varchar(100);
	declare	@gamelink				varchar(100);
	declare	@erscheinungsdatum		varchar(100);
	open @gamecursor;
	fetch next from @gamecursor into 	@gamename,
										@gamepreis,
										@gamelink,
										@erscheinungsdatum

	while (@@FETCH_STATUS =0)
	begin
		print 'neues game: ' +	@gamename			+' '+   
								@gamepreis			+' '+  
								@gamelink			+' '+  
								@erscheinungsdatum	+' ';

		fetch next from @gamecursor into	@gamename,
											@gamepreis,
											@gamelink,
											@erscheinungsdatum;
	end;
	close @gamecursor;
	deallocate @gamecursor;
end;
go
-------------------------------------------------------------------------------------------------------------------------
create trigger checkgame
	on users
	after delete
as
begin
	delete from game where gamename in(
		select game.gamename
				from game
					join users on USERs.users_id = game.game_id where (users.users_id is null));		
end;
-------------------------------------------------------------------------------------------------------------------------
go

declare @vorname			varchar(100);
declare @nachname			varchar(100);
declare @postleitzahl		varchar(100);
declare @ort				varchar(100);
declare @strasse			varchar(100);
declare @hausnummer			varchar(100);
declare @e_mail				varchar(200);
declare @passwort			varchar(200);
declare @rechte				varchar(100);
--game
declare @gamename			varchar(100);
declare @gamepreis			varchar(100);
declare @gamelink			varchar(1000);
declare @erscheinungsdatum	varchar(100);
declare @rating				varchar(100);
declare @publisher			varchar(100);
declare @entwickler			varchar(100);
--beschreibung
declare @beschreibung		varchar(5000);
--genre
declare @genre				varchar(100);
--style
declare @style				varchar(100);
--plattform
declare @plattform			varchar(100);
-------------------------------------------------------------------------------------------------------------------------
set @vorname				= 'testtrigger';
set	@nachname				= 'testtrigger';
set	@postleitzahl			= 30125;
set	@ort					= 'testtrigger';
set	@strasse				= 'testtrigger';
set	@hausnummer				= 'testtrigger';
set	@e_mail					= 'testtrigger';
set	@passwort				= 'testtrigger';
--game
set @gamename				= 'testtrigger';
set @gamepreis				= 12.22;
set @gamelink				= 'testtrigger';
set @erscheinungsdatum		= 'testtrigger';
set @rating					= 'testtrigger';
set @publisher				= 'testtrigger';
set @entwickler				= 'testtrigger';
--beschreibung
set @beschreibung			= 'testtrigger';
--genre
set @genre					= 'testtrigger';
--style
set @style					= 'testtrigger';
--plattform
set @plattform				= 'testtrigger';
-------------------------------------------------------------------------------------------------------------------------
execute Einfuegen	@vorname,
					@nachname,
					@postleitzahl,
					@ort,
					@strasse,
					@hausnummer,
					@e_mail,
					@passwort,
					@rechte,
					@gamename,
					@gamepreis,
					@gamelink,
					@erscheinungsdatum,
					@rating,
					@publisher,
					@entwickler,
					@beschreibung,
					@genre,
					@style,
					@plattform;
-------------------------------------------------------------------------------------------------------------------------
go
-------------------------------------------------------------------------------------------------------------------------
select * from game;
go
-------------------------------------------------------------------------------------------------------------------------
select * from users;
go
-------------------------------------------------------------------------------------------------------------------------
select * from rating;
go
-------------------------------------------------------------------------------------------------------------------------
select * from publisher;
go
-------------------------------------------------------------------------------------------------------------------------
select * from entwickler;
go
-------------------------------------------------------------------------------------------------------------------------
select * from beschreibung;
go
-------------------------------------------------------------------------------------------------------------------------
select * from genre;
go
-------------------------------------------------------------------------------------------------------------------------
select * from gamegenre;
go
-------------------------------------------------------------------------------------------------------------------------
select * from plattform;
go
-------------------------------------------------------------------------------------------------------------------------
select * from gameplattform;
go
-------------------------------------------------------------------------------------------------------------------------
select * from style;
go
-------------------------------------------------------------------------------------------------------------------------
select * from gamestyle;
go
-------------------------------------------------------------------------------------------------------------------------
select * from rechte;
go
-------------------------------------------------------------------------------------------------------------------------
/*
Aufgabenstellung:

ich werde eine DB mit 13 tabellen erstellen.
ich werde mit alter table die FK einfügen.
ich werde die normalisierungsform einhalten.
ich werde ein erm in ssms erstellen.
ich werde die tabellen mittels insert into mit inhalt befüllen.
ich werde mittels select aus die tabellen lesen.
ich werde die DB exportieren und bei alfa hochladen.

	aufgaben von dozi:

	select:
	wieviele % der spiele sind für minderjährige geeignet.

	prozedur:
	speichert neues spiel inklusive genre, plattform, usw.

	trigger:
	1. ich trigger alles was nicht niet und nagelfest ist ALTER!
	1.1 ich trigger user und trigger game(zum teil)
*/