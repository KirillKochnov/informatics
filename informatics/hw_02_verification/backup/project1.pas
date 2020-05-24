program project1;
var
  F: text;
  A: String;
  i,j: Integer;
begin
  assign(F,'Food Subsidy.txt');
  WriteLn(' Food Subsidy');
  reset(F);
  While not EOF(F) do
  begin
    ReadLn(F,A);
    for i:=0 to length(A)-1 do
    begin
        if ((A[i]='/') and (A[i+1]='0') and ( (A[i+2]='3') or (A[i+2]='4') or (A[i+2]='5')) and (A[i+3]='/')) then
        begin
           for j:=0 to length(A)-1 do
           begin
             if (A[j]<>';') then
             begin
                Write(A[j]);
             end
             else break;
           end;
           WriteLn();
        end;
    end;
  end;
  close(F);
  ReadLn
end.

