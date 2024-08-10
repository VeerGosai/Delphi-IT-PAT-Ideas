program CheckIfConnectedToInternet_p;

uses
  Vcl.Forms,
  CheckIfConnectedToInternet_u in 'CheckIfConnectedToInternet_u.pas' {frmCheckIfConnectedToInternet};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCheckIfConnectedToInternet, frmCheckIfConnectedToInternet);
  Application.Run;
end.
