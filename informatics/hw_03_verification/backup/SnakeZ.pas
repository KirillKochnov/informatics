program SnakeZ;

var
  N,i,L,K: Integer;
  A,B,C: Real;
  T: array of Real;

begin
  Write('Enter N- ');
  ReadLn(N);
  Write('Enter A- ');
  ReadLn(A);
  Write('Enter B- ');
  ReadLn(B);
  If (A>=B)then
  begin
    Write('Oshibka vvoda');
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
    if not ((T[i]>=A) and (B>T[i])) then
    begin
       L:=high(T);
       T[K]:=T[L];
       setLength(T,L);
       K:=K-1;
    end
    else K:=K+1;
  end;
  for i:=0 to high(T)-1 do
  begin
    WriteLn(Trunc(T[i]));
  end;
  ReadLn
end.

