program Snake;
var
  T: array of array of Integer;
  M,N,i,j,xc,yc,x,y,Tnomb: Integer;
  IsAddDirUp: Boolean;

function Nomb(): Integer;
begin
  Nomb:= Tnomb;
  if Tnomb = 1 then
    Prov:= true;
  if Tnomb = 9 then
    Prov:= false;
  if Prov then
    Tnomb += 1
  else
    Tnomb -= 1;
end;

begin
  Write('Введите количество столбцов и строк: ');
  ReadLn(M,N);
  SetLength(T,N,M);
  xc:=M;
  yc:=N-1;
  x:=0;
  y:=0;
  Tnomb:=1;
  while (xc + yc) > 0 do
  begin
    for i := 0 to xc - 1 do
    begin
      T[y][x + i]:=Nomb();
    end;
    if yc = 0 then
      break;
    xc -= 1;
    x += i;
    y += 1;
    for i := 0 to yc - 1 do
    begin
      T[y + i][x]:=Nomb();
    end;
    if xc = 0 then
      break;
    yc -= 1;
    x -= 1;
    y += i;
    for i := 0 to xc - 1 do
    begin
      T[y][x - i]:=Nomb();
    end;     
    if yc = 0 then
      break;
    xc -= 1;
    x -= i;
    y -= 1;

    for i := 0 to yc - 1 do
    begin
      T[y - i][x]:=Nomb();
    end;
    if xc = 0 then
      break;
    yc -= 1;
    x += 1;
    y -= i;
  end;
  for i:= 0 to N-1 do
  begin
    for j:= 0 to M-1 do
    begin
      Write(T[i][j]:3);
    end;
    WriteLn();
  end;
  ReadLn();
end.

