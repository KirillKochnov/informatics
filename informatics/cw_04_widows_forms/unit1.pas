unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    edtAX: TEdit;
    edtBX: TEdit;
    edtCX: TEdit;
    edtAY: TEdit;
    edtBY: TEdit;
    edtCY: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  A, B, C : TPoint;
implementation

{$R *.lfm}

{ TForm1 }

function GetDist(P1: TPoint; P2: TPoint): Real;
begin
  GetDist := sqrt(sqr(P1.X - P2.X) + sqr(P1.Y - P2.Y));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  AB, BC, AC : Real;
  P, P_2 : Real;
  Square : Real;
begin
  A.X := StrToInt(edtAX.Text);
  A.Y := StrToInt(edtAY.Text);

  B.X := StrToInt(edtBX.Text);
  B.Y := StrToInt(edtBY.Text);

  C.X := StrToInt(edtCX.Text);
  C.Y := StrToInt(edtCY.Text);

  AB := GetDist(A, B);
  BC := GetDist(B, C);
  AC := GetDist(A, C);

  P := AB + BC + AC;
  P_2 := P / 2;

  Square := sqrt(P_2 * (P_2 - AB) * (P_2 - BC) * (P_2 - AC));

  ShowMessage('Square = ' + FloatToStrF(Square, ffFixed, 0, 4));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  A, B, C : TPoint;
  AB, BC, AC : Real;
begin
  AB := GetDist(A, B);
  BC := GetDist(B, C);
  AC := GetDist(A, C);
  A.X := StrToInt(edtAX.Text);
  A.Y := StrToInt(edtAY.Text);

  B.X := StrToInt(edtBX.Text);
  B.Y := StrToInt(edtBY.Text);

  C.X := StrToInt(edtCX.Text);
  C.Y := StrToInt(edtCY.Text);

  Image1.Canvas.Brush.Style := bsSolid;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Rectangle(0, 0, 580, 580);
  with Image1.Canvas do
  begin
    Pen.Color := clBlue;
    Pen.Width := 3;

    MoveTo(A);
    LineTo(B);
    LineTo(C);
    LineTo(A);

    Pen.Width := 1;
    Brush.Color := RGBToColor(220, 20, 60);

    Ellipse(A.X - 5, A.Y - 5, A.X + 5, A.Y + 5);
    Ellipse(B.X - 5, B.Y - 5, B.X + 5, B.Y + 5);
    Ellipse(C.X - 5, C.Y - 5, C.X + 5, C.Y + 5);

    Brush.Style := bsClear;
    TextOut(A.X, A.Y, 'A');
    TextOut(B.X, B.Y, 'B');
    TextOut(C.X, C.Y, 'C');
  end;
//  Image.Canvas.TextOut
 // TextOut(C.X, C.Y, 'C')

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  O:TPoint;
  AB, BC, AC, R,P : Real;
begin
  with Image1.Canvas do
  begin
    AB := GetDist(A, B);
    BC := GetDist(B, C);
    AC := GetDist(A, C);
    O.X:=Round((BC*A.X+AC*B.X+AB*C.X)/(AB+BC+AC));
    O.Y:=Round((BC*A.Y+AC*B.Y+AB*C.Y)/(AB+BC+AC));
    Pen.Width := 1;
    Brush.Color := RGBToColor(0,0,0);
    Ellipse(O.X - 5,O.Y - 5, O.X + 5, O.Y + 5);
    Brush.Style := bsClear;
    TextOut(O.X, O.Y, 'O');
    P:=(AB+BC+AC)/2;
    R:=sqrt(((P-AB)*(P-AC)*(P-BC))/(P));
    Pen.Width:=3;
    Pen.Color:=Clpurple;
    Ellipse(Round(O.X-R),Round(O.Y-R),Round(O.X+R),Round(O.Y+R));

  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  T1,T2,T3:TPoint;
  AB, BC, AC : Real;
begin
  with Image1.Canvas do
  begin
    Pen.Color := clGreen;
    Pen.Width := 3;
    T1.X:=(A.X+B.X) div 2;
    T1.Y:=(A.Y+B.Y) div 2;
    MoveTo(C);
    LineTo(T1);
    T2.X:=(C.X+B.X) div 2;
    T2.Y:=(C.Y+B.Y) div 2;
    MoveTo(A);
    LineTo(T2);
    T3.X:=(A.X+C.X) div 2;
    T3.Y:=(A.Y+C.Y) div 2;
    MoveTo(B);
    LineTo(T3);
    Pen.Width := 1;
    Brush.Color := RGBToColor(39, 202, 135);
    Ellipse(T1.X - 5, T1.Y - 5, T1.X + 5,T1.Y + 5);
    Ellipse(T2.X - 5,T2.Y - 5, T2.X + 5,T2.Y + 5);
    Ellipse(T3.X - 5, T3.Y - 5, T3.X + 5, T3.Y + 5);
    Brush.Style := bsClear;
    TextOut(T1.X, T2.Y, 'T1');
    TextOut(T2.X, T2.Y, 'T2');
    TextOut(T3.X, T3.Y, 'T3');
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Image1.Canvas.Brush.Style := bsSolid;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Rectangle(0, 0, 580, 580);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  M1,M2,M3:TPoint;
  AB, BC, AC, K: Real;
begin
  with Image1.Canvas do
  begin
    AB := GetDist(A, B);
    BC := GetDist(B, C);
    AC := GetDist(A, C);
    Pen.Color := clred;
    Pen.Width := 3;
    K:=BC/AC;
    M1.X:=Round((B.X+(K*A.X))/(1+K));
    M1.Y:=Round((B.Y+(K*A.Y))/(1+K));
    MoveTo(C);
    LineTo(M1);
    K:=AC/AB;
    M2.X:=Round((C.X+(K*B.X))/(1+K));
    M2.Y:=Round((C.Y+(K*B.Y))/(1+K));
    MoveTo(A);
    LineTo(M2);
    K:=AB/BC;
    M3.X:=Round((A.X+(K*C.X))/(1+K));
    M3.Y:=Round((A.Y+(K*C.Y))/(1+K));
    MoveTo(B);
    LineTo(M3);
    Pen.Width := 1;
    Brush.Color := RGBToColor(39, 202, 135);
    Ellipse(M1.X - 5, M1.Y - 5, M1.X + 5,M1.Y + 5);
    Ellipse(M2.X - 5,M2.Y - 5, M2.X + 5,M2.Y + 5);
    Ellipse(M3.X - 5, M3.Y - 5, M3.X + 5, M3.Y + 5);
    Brush.Style := bsClear;
    TextOut(M1.X, M2.Y, 'M1');
    TextOut(M2.X, M2.Y, 'M2');
    TextOut(M3.X, M3.Y, 'M3');
  end;
end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;
end.

