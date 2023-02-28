unit mosaicer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    StaticText1: TStaticText;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
var quality:string;
procedure doit;
var src,dest:string;
begin
     src:= form1.edit1.text;
     dest:=form1.edit2.text;
     
     halt;
end;
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
   quality:=' ';
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
     quality:='128';
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
     quality:='32';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    doit;
end;
begin
     quality:='';
end.
