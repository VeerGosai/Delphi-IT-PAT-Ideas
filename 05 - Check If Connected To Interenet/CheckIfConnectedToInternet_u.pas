unit CheckIfConnectedToInternet_u;
//Copyright 2024 Veer Gosai - CC BY SA Attribution-ShareAlike 4.0 (Uses of this code must be referenced in PAT Decleration) https://github.com/VeerGosai
//Requires Delphi 7 Or Above
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmCheckIfConnectedToInternet = class(TForm)
    btnInternet: TButton;
    lblInternet: TLabel;
    IdHTTP: TIdHTTP;
    Label1: TLabel;
    procedure btnInternetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function IsInternetConnection: Boolean;
  end;

var
  frmCheckIfConnectedToInternet: TfrmCheckIfConnectedToInternet;
  bConnected : Boolean;

implementation

{$R *.dfm}

{ TfrmCheckIfConnectedToInternet }

//Function That Checks If Connected To The Internet (Can Use Your Own Server)
function TfrmCheckIfConnectedToInternet.IsInternetConnection: Boolean;
begin
try
    IdHTTP.Get('http://www.google.com');       //It May Take Up To 10 Seconds To Respond
  except                                       //If Program Freezes It Should Respond Within 5 Seconds
    on E: Exception do                         //IdHTTP Component Required
    begin
      if not(E is EIdHTTPProtocolException) then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
  Result := True;
end;

//Button Used To Check If Connected
procedure TfrmCheckIfConnectedToInternet.btnInternetClick(Sender: TObject);
begin
  bConnected := IsInternetConnection;

  if bConnected = True then
  begin
    lblInternet.Caption := 'Status: Connected To The Internet';
  end
  else
  begin
    lblInternet.Caption := 'Status: NOT Connected To The Internet';
  end;

end;

end.
