unit Loading_Screen_u;
//Copyright 2024 Veer Gosai - CC BY SA Attribution-ShareAlike 4.0 (Uses of this code must be referenced in PAT Decleration) https://github.com/VeerGosai
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlLoading: TPanel;
    imgLoadingCircle: TImage;
    lblLoadingTitle: TLabel;
    lblLoadingCopyright: TLabel;
    Label1: TLabel;
    timerLoading: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure timerLoadingTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  // Loading Initilise  (you need to ajust Form Width and Height)

  Form1.Width := 495 - 6;
  Form1.Height := 346;

  Form1.BorderStyle := bsNone;

  (imgLoadingCircle.Picture.Graphic as TGIFImage).Animate := True;
end;

procedure TForm1.timerLoadingTimer(Sender: TObject);
begin
  timerLoading.Enabled := False;
  Form1.BorderStyle := bsSizeable;


  Form1.Width := 1020;
  Form1.Height := 800 - 55;

  (imgLoadingCircle.Picture.Graphic as TGIFImage).Animate := False;

  pnlLoading.Hide;

end;

end.
