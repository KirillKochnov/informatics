program SnakeZ;

var
  N,i,K: Integer;
  A,B,C: Integer;
  T: array of Integer;

begin
  Write('Enter N- ');
  ReadLn(N);
  Write('Enter A- ');
  ReadLn(A);
  Write('Enter B- ');
  ReadLn(B);
  If (A>=B)then
  begin
    WriteLn('Oshibka vvoda');
    ReadLn;
    Exit();
  end;
  SetLength(T,N);
  for i:=0 to N-1 do
  begin
    ReadLn(C);
    T[i]:=C;
  end;
  K:=0;
  for i:=0 to N-1 do
  begin
    if ((T[i]>=A) and (B>T[i])) then
    begin
       T[K]:=T[i];
       K:=K+1;
    end;
  end;
  SetLength(T,K);
  WriteLn('');
  WriteLn('Proverka:');
  WriteLn('');
  WriteLn('dlina massiva- ',Length(T));
  for i:=0 to K-1 do
  begin
    WriteLn(T[i]);
  end;
  ReadLn;
end.

