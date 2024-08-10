unit Login_u;
//Copyright 2024 Veer Gosai - CC BY SA Attribution-ShareAlike 4.0 (Uses of this code must be referenced in PAT Decleration) https://github.com/VeerGosai
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    edtUsername: TEdit;
    edtPassword: TEdit;
    lblPassword: TLabel;
    lblUsernamne: TLabel;
    btnLogin: TButton;
    rgpAccountType: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnLoginClick(Sender: TObject);
var
  sUsername, sPassword : String;
  bLogin : Boolean;
begin
  bLogin := False;
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;

  //For Grade 10 PAT (Grade 11 &12s should make use of a Database or Textfile)
  //You can use the radio group to assosiate users e.g bAdmin and sUsername

  if (sUsername = 'John') and (sPassword = '1234') then
  begin
    bLogin := True;
    ShowMessage('Login Successful');
  end
  else
  begin
    ShowMessage('Login Failed (Incorrect User/Password)');
  end;


end;

end.
