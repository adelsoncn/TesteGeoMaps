unit Unit9;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.NetEncoding,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP, Vcl.OleCtrls, SHDocVw;

type
  TForm9 = class(TForm)
    IdHTTP1: TIdHTTP;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ExtractTextInsideGivenTagEx(const Tag, Text: string): string;
  function ExtractTagAndTextInsideGivenTagEx(
  const ATag, AText, ATextEndDefault: string;
  Const AMax: Integer): string;

var
  Form9: TForm9;

implementation

{$R *.dfm}

function ExtractTextInsideGivenTagEx(const Tag, Text: string): string;
var
  StartPos1, StartPos2, EndPos: integer;
  i: Integer;
begin
  result := '';
  StartPos1 := Pos('<' + Tag, Text);
  EndPos := Pos('</' + Tag + '>', Text);
  StartPos2 := 0;
  for i := StartPos1 + length(Tag) + 1 to EndPos do
    if Text[i] = '>' then
    begin
      StartPos2 := i + 1;
      break;
    end;


  if (StartPos2 > 0) and (EndPos > StartPos2) then
    result := Copy(Text, StartPos2, EndPos - StartPos2);
end;


function ExtractTagAndTextInsideGivenTagEx(
  const ATag, AText, ATextEndDefault: string;
  Const AMax: Integer): string;
var
  LStartPos, LEndPos: integer;
begin
  result := '';
  LStartPos := Pos('<' + ATag, AText);
  LEndPos := Pos('</' + ATag + '>', AText);
  if LEndPos = 0 then
    if not ATextEndDefault.IsEmpty then
      LEndPos := Pos(ATextEndDefault, AText)
    else
      LEndPos := LStartPos + AMax;
  if (LStartPos > 0) and (LEndPos > LStartPos) then
    result := Copy(AText, LStartPos, LEndPos - LStartPos + length(ATag) + 3);
end;

procedure TForm9.Button1Click(Sender: TObject);
var
  StreamData: TMemoryStream;
  Url: string;
  Texto, Texto2, Endereco: String;
  PosI, PosF: integer;
begin
  Url := 'https://www.google.com/maps/search/?api=1&query=';
  Url := Url + TNetEncoding.URL.Encode(Edit1.Text);
  StreamData := TMemoryStream.Create;
  try
    try
      IdHTTP1.HandleRedirects := True;
      IdHTTP1.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
      IdHTTP1.Get(Url, StreamData);
      StreamData.Position := 0;
      Memo1.Lines.LoadFromStream(StreamData);
      Texto := ExtractTagAndTextInsideGivenTagEx('meta content', memo1.Text,'&amp;', 50);
      PosI := Pos('center', Texto);
      PosF := Pos('&amp;', Texto);
      Texto2 := Copy(Texto, PosI + 7, (PosF - (PosI + 7)));
      Texto2 := StringReplace( Texto2,'%2C', ',', [rfReplaceAll]);
      edit2.Text := texto2;
    Except
      On E: Exception Do
        MessageDlg('Exception: ' + E.Message, mtError, [mbOK], 0);
    End;
  finally
    StreamData.free;
  end;
end;

end.
