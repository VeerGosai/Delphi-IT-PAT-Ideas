program Password_Visible_p;

uses
  Vcl.Forms,
  Password_Visible_u in 'Password_Visible_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
