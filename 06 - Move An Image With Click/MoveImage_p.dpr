program MoveImage_p;

uses
  Vcl.Forms,
  MoveImage_u in 'MoveImage_u.pas' {iMoveImage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TiMoveImage, iMoveImage);
  Application.Run;
end.
