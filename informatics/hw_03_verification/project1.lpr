program SnakeZ;

var
  N,i,J,K: Integer;
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
  J:=0;
  K:=0;
  for i:=0 to N-1 do
  begin
    ReadLn(C);
    if (C >= A) and (C < B) then
    begin
      T[J]:=C;
      J:=J+1;
    end
    else
    begin
      K:=K+1;
      SetLength(T,N-K);
    end;
  end;
  ReadLn
end.

