program Snake;
var
  T: array of array of Integer;
  M,N,i,j,xc,yc,x,y,AddVal: Integer;
  IsAddDirUp: Boolean;

function IncDec(): Integer;
begin
  IncDec:= AddVal;
  if AddVal = 1 then
    IsAddDirUp:= true;
  if AddVal = 9 then
    IsAddDirUp:= false;
  if IsAddDirUp then
    AddVal += 1
  else
    AddVal -= 1;
end;

begin
  Write('Введите количество столбцов и строк: ');
  ReadLn(M,N);
  SetLength(T,M,N);
  xc:= M;
  yc:= N - 1;
  x:= 0;
  y:= 0;
  AddVal:= 1;
  while (xc + yc) > 0 do
  begin
    for i := 0 to xc - 1 do
    begin
      T[y][x + i] := IncDec();
    end;
    if yc = 0 then
      break;
    xc -= 1;
    x += i;
    y += 1;
    for i := 0 to yc - 1 do
    begin
      T[y + i][x] := IncDec();
    end;
    if xc = 0 then
      break;
    yc -= 1;
    x -= 1;
    y += i;
    for i := 0 to xc - 1 do
    begin
      T[y][x - i] := IncDec();
    end;     
    if yc = 0 then
      break;
    xc -= 1;
    x -= i;
    y -= 1;

    for i := 0 to yc - 1 do
    begin
      T[y - i][x] := IncDec();
    end;
    if xc = 0 then
      break;
    yc -= 1;
    x += 1;
    y -= i;
  end;
  for i := 0 to N - 1 do
  begin
    for j := 0 to M - 1 do
    begin
      Write(T[i][j]:3);
    end;
    WriteLn();
  end;
  ReadLn();
end.

