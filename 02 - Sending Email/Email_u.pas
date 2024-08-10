unit Email_u;
//Copyright 2024 Veer Gosai - CC BY SA Attribution-ShareAlike 4.0 (Uses of this code must be referenced in PAT Decleration) https://github.com/VeerGosai
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage;

type
  TForm1 = class(TForm)
    btnEmail: TButton;
    idmsg1: TIdMessage;
    idsmtp1: TIdSMTP;
    idslhndlrscktpnsl1: TIdSSLIOHandlerSocketOpenSSL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//******************************************************************************Email
// Email Configuration
  procedure Gmail(username, password, totarget, subject, body: string);
VAR
  MailData: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;

begin
// Input
  SMTP := TIdSMTP.Create(nil);
  MailData := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

//Configuration
  //SSL (Secure Sockets Layer) 128-bit encryption
  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmUnassigned;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;

  //Email Contents
  MailData.From.Address := username;
  MailData.Recipients.EMailAddresses := totarget;
  MailData.subject := subject;
  MailData.body.text := body;

  //SMPT (Simple Mail Transfer Protocol) Gmail Configuration
  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';  //Please note that GMAIL ADDRESSS WILL NOT WORK AFTER Janyary 2023
  SMTP.Port := 587;               //A Custom Domain will have to be used (Personal Reccomedation: Domains.co.za / Cheapest: Web-telecoms)
  SMTP.username := '';            //Place Username
  SMTP.password := '';            //Place email Password
  SMTP.UseTLS := utUseExplicitTLS;
  //SMTP Send
  SMTP.Connect;
  SMTP.Send(MailData);
  SMTP.Disconnect;

//Output (SMTP, MailData and SSL Destructor)
  SMTP.Free;
  MailData.Free;
  SSL.Free;

end;

procedure TForm1.btnEmailClick(Sender: TObject);
var
  sOTP, sUsername, sPassword, sSendersEmail, sInputOTP : String;
  sMailUsername, sMailPassword, sMailTo, sMailSubject, sMailP1, sMailP2, sMailBody: String;
  sUser : String;
  iOTP : Integer;
begin
// OTP Generation & Input
  iOTP := random(899999) + 100000;
  sOTP := IntToStr(iOTP);                    //Generate 6 Digit OTP
  sUser := '';

// e-Mail OTP Input & Sending
  sMailUsername := '@yourdomain.co.za';  //Enter Email
  sMailPassword := '';  //Email Password
  sMailTo := '@gmail.com';   //Senders Email
  sMailSubject := 'OTP';

  sMailP1 := 'Your  OTP: ' + sOTP + #10 +
    'Do Not Share This Code With Anyone';
  sMailP2 := '';

  sMailBody := sMailP1 + #10 + #10 + #10 + sMailP2;

  try
    begin
      Gmail(sMailUsername, sMailPassword, sMailTo, sMailSubject, sMailBody);
    end;
  except

  end;
end;

end.
