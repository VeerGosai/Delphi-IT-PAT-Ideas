program South_Africa_Map_p;

uses
  Vcl.Forms,
  South_Africa_Map_u in 'South_Africa_Map_u.pas' {frmMap};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMap, frmMap);
  Application.Run;
end.
