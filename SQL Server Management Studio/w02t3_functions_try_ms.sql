use [SQL-Kurs];

------------------------------------------------------------------------------------------
go

create function quadrat
(@zahl bigint)
returns bigint
as
begin
return @zahl * @zahl;
end;
------------------------------------------------------------------------------------------
go

print dbo.quadrat(0123456789);
------------------------------------------------------------------------------------------
go

create function flaeche
(@a float, @b float)
returns bigint
as
begin
return @a * @b;
end;

------------------------------------------------------------------------------------------
go

print dbo.flaeche(0123456789,1234567890);
------------------------------------------------------------------------------------------
go

create function heutedatum()
	returns varchar(50)as
		begin
			declare @back varchar(10);
			declare @help int;

			set @help = DATEPART(DAY,GETDATE());
			declare @d varchar(2) = cast (datepart ( day,getdate())as varchar(2));
			if(@help < 10)
			set @d = '0'+@d;

			set @help = DATEPART(MONTH,GETDATE());
			declare @m varchar(2) = cast (datepart ( MONTH,getdate())as varchar(2));
			if(@help < 10)
			set @m = '0'+@m;

			set @help = DATEPART(YEAR,GETDATE());
			declare @y varchar(4) = cast (datepart ( YEAR,getdate())as varchar(4));
			if(@help < 10)
			set @y = '0'+@y;

			return @d+'.'+@m+'.'+@y;
		end;
		
------------------------------------------------------------------------------------------
go

print dbo.heutedatum();
--select * from [SQL-Kurs].dbo.tierew01t4;
------------------------------------------------------------------------------------------
go

begin try
print 'fehler zu beginn';
drop function heutedatum;
print 'fehler in datum';
drop function quadrat;
print 'fehler in quadrat';
drop function flaeche;
print 'fehler in fläche';
end try
begin catch
print 'fehler';
print error_message('das klappt nicht!');
end catch;

print 'erfolgreich durchgelaufen';
------------------------------------------------------------------------------------------
go






