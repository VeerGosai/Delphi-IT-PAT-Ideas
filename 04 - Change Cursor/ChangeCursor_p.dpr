program ChangeCursor_p;

uses
  Vcl.Forms,
  ChangeCursor_u in 'ChangeCursor_u.pas' {frmChangeCursor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmChangeCursor, frmChangeCursor);
  Application.Run;
end.
