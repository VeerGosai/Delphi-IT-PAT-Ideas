program Loading_Screen_p;

uses
  Vcl.Forms,
  Loading_Screen_u in 'Loading_Screen_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
