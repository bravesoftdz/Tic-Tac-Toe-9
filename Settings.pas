unit Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TicTacToe, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ColorBox1: TColorBox;
    Label2: TLabel;
    Button1: TButton;
    procedure ColorBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses GameOver;

procedure TForm3.Button1Click(Sender: TObject);
var
   f:TextFile;
begin
   if Edit1.Text<>'' then
    begin
    form1.NamePl:=Edit1.Text;
    assignfile(f,'resource/settings.txt');
    rewrite(f);
    writeln(f, edit1.Text);
    writeln(f, colorbox1.Selected);
    closefile(f);
    close;
    end
       else
       Messagebox(handle,PChar('������� ������'),PChar('������'),MB_ICONERROR );
end;

procedure TForm3.ColorBox1Change(Sender: TObject);
begin
   form1.Color:=ColorBox1.Selected;
   form2.color:=ColorBox1.Selected;
   form3.Color:=ColorBox1.Selected;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
    form3.Color:=Form1.Color_set;
    colorbox1.Selected:=Form1.Color_set;

end;

procedure TForm3.FormShow(Sender: TObject);
begin
    Edit1.Text:=Form1.NamePl;
end;

end.
