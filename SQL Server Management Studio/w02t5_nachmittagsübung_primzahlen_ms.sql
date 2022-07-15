declare
@Ergebnis int=0,
@Start int=2,
@Teiler int=2

while(@Start<=1000)
Begin
set @Start= @Start+1
set @Teiler= 2

while(@Teiler<@Start)
begin
set @Ergebnis=@Start%@Teiler
set @Teiler=@Teiler+1

if(@Ergebnis=0)
begin
set @Teiler=20000
break
end
end

if(@Teiler<15000 )
begin
select @Start, ' Ist eine Primzahl'
end
end