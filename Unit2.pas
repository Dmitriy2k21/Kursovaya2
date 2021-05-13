unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Field1: TCustomButton;
    Field2: TCustomMemo;
    function Funkfff(s: string): word;
    procedure Mas(var a: array of integer; const N: integer; var Sum: integer; var Sred: real);

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
var
  s: string;
begin
  s := inputBox('Ввод строки', 'Введите строку', '');
  messageDlg('Число букв f равно ' + IntToStr(Funkfff(s)), mtInformation,
    [mbOk], 0);
end;

procedure TForm2.Button2Click(Sender: TObject);
const
  N = 5;
var
  i: integer;
  a: array [1 .. N] of integer;
  Sum: integer;
  Sred: real;
begin
  memo1.Clear;
  Memo1.Lines.Add('Выводим начальный массив');
  for i := 1 to N do
  begin
    a[i] := Random(9);
    Memo1.Lines.Add(IntToStr(a[i]));
  end;
  Mas(a, N, Sum, Sred);
  Memo1.Lines.Add('Sum= ' + IntToStr(Sum));
  Memo1.lines.add('Sred= ' + FloatToStr(Sred));
  Memo1.Lines.Add('Выводим изменённый массив');
  for i := 1 to N do
  begin
    Memo1.Lines.Add(IntToStr(a[i]));
  end;

end;

function TForm2.Funkfff(s: string): word;
var
  i, Sum: word;
begin
  Sum := 0;
  for i := 1 to length(s) do
    if s[i] = 'f' then
      Sum := Sum + 1;
  result := Sum;
end;

procedure TForm2.Mas(var a: array of integer; const N: integer;
  var Sum: integer; var Sred: real);
var
  i: integer;
begin
  Sum := 0;
  for i := 0 to N - 1 do
    Sum := Sum + a[i];
  Sred := Sum / N;
  for i := 0 to N - 1 do
    if (a[i] mod 2) = 0 then
      a[i] := -1;
end;

end.
