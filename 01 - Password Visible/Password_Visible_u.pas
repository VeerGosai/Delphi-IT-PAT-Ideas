unit Password_Visible_u;
//Copyright 2024 Veer Gosai - CC BY SA Attribution-ShareAlike 4.0 (Uses of this code must be referenced in PAT Decleration) https://github.com/VeerGosai
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtPassword: TEdit;
    lblPassword: TLabel;
    imgSPeye: TImage;
    procedure imgSPeyeMouseEnter(Sender: TObject);
    procedure imgSPeyeMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.imgSPeyeMouseEnter(Sender: TObject);
begin
  edtPassword.PasswordChar := #0;
  imgSPeye.Picture.LoadFromFile('Eye Open.png');
end;

procedure TForm1.imgSPeyeMouseLeave(Sender: TObject);
begin
  edtPassword.PasswordChar := '•';
  imgSPeye.Picture.LoadFromFile('Eye Closed.png');
end;

end.
