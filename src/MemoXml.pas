(*
Copyright (C) 2013, Sridharan S

This file is part of Tally Connector.

Tally Connector is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Tally Connector is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License version 3
along with Integration Tools for Tally. If not, see <http://www.gnu.org/licenses/>.
*)
unit MemoXml;
{ TbjClient is not used }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, StdCtrls, xmldbpst,
  IdIntercept, IdSSLOpenSSL,
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,
  license, ExtCtrls, Menus,
  ShellApi;

type
  Tpostxmlfrm = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnPostXml: TButton;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    Register1: TMenuItem;
    IDHttp: TIdHTTP;
    ResMemo: TMemo;
    ReqMemo: TMemo;
    edtReqFileName: TEdit;
    edtResFileName: TEdit;
    edtPort: TEdit;
    lblPort: TLabel;
    mniool1: TMenuItem;
    mniTallyServer1: TMenuItem;
    mniLicenseKey1: TMenuItem;
    procedure btnPostXmlClick(Sender: TObject);
    procedure GetSerialNo1Click(Sender: TObject);
    procedure Register1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniLicenseKey1Click(Sender: TObject);
    procedure mniTallyServer1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    req: TMemoryStream;
    res: TMemoryStream;
    function GetXmlMemo:boolean;
    function GetXmlFile:boolean;
  public
    { Public declarations }
    Host: string;
  end;

procedure dropname;

var
  postxmlfrm: Tpostxmlfrm;

implementation
{$R *.dfm}

function Tpostxmlfrm.GetXmlMemo;
var
  xstr: pChar;
begin
  Result := False;
  if Length(Trim(ReqMemo.Lines.Text)) > 0 then
  begin
    if (MessageDlg('Post Memo lines?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
      Exit;
    xStr := pAnsichar(ReqMemo.Lines.Text);
    Req.Clear;
    Req.Write(xStr^, Length(xStr));
    Result := True;
  end;
end;

function Tpostxmlfrm.GetXmlFile;
var
xstr: string;
begin
  Result := False;
  if (Length(edtReqFileName.Text) = 0) or (not FileExists(EdtReqFileName.Text)) then
    if not OpenDialog1.Execute then
      Abort
  else
    EdtReqFileName.Text := OpenDialog1.FileName;
  if FileExists(EdtReqFileName.Text) then
  begin
    Req.LoadFromFile(EdtReqFileName.Text);
    SetString(xstr, pchar(Req.Memory),
    Req.Size div Sizeof(char));
    ReqMemo.Clear;
    ReqMemo.Lines.Append(xStr);
    Result := True;
  end;
end;

procedure Tpostxmlfrm.btnPostXmlClick(Sender: TObject);
var
xstr: string;
begin
  Res.Clear;
  Req.Clear;
  if Length(edtPort.Text) > 0 then
    Host := 'http://127.0.0.1:'+ edtPort.Text;
  try
    if not GetXmlMemo then
      GetXmlFile;
  except
      raise exception.Create('No Xml Input!');
  end;
  try
    ResMemo.Clear;
    IdHttp.Post(Host, Req, Res);
    SetString(xStr, pchar(Res.Memory),
      Res.Size div Sizeof(char));
    ResMemo.Lines.Append(xStr);
  except
//    raise exception.Create('Error Receiving Data from Tally');
    raise exception.Create('Error connecting to Tally');
  end;
  if Length(EdtResFileName.Text) > 0 then
    Res.SaveToFile(EdtResFileName.Text);
  IdHttp.Disconnect;
end;

procedure dropname;
begin
//  ShowMessage('Sridharan S, excel2tallyerp@gmail.com');
  MessageDlg('Sridharan S' + #10 + '+91 98656 82910' + #10 +'excel2tallyerp@gmail.com'
  + #10 + 'Telegram: https://t.me/excel2tallyerp',
    mtInformation, [mbOK], 0);end;

procedure Tpostxmlfrm.GetSerialNo1Click(Sender: TObject);
var
  xdb: Tbjxmllicense;
begin
  xdb := Tbjxmllicense.Create;
  try
    if Length(xdb.GetLicenseNo) > 0 then
    MessageDlg(xdb.GetLicenseNo, mtInformation, [mbOK], 0)
    else
    MessageDlg('Update Tally!', mtError, [mbOK], 0);
  finally
  xdb.Free;
  end;
end;

procedure Tpostxmlfrm.Register1Click(Sender: TObject);
begin
  DropName;
end;

procedure Tpostxmlfrm.FormCreate(Sender: TObject);
begin
  Host := 'http://127.0.0.1:9000';
  Res := TMemoryStream.Create();
  Req := TMemoryStream.Create();
end;

procedure Tpostxmlfrm.FormDestroy(Sender: TObject);
begin
    req.Free;
    res.Free;
end;

procedure Tpostxmlfrm.mniLicenseKey1Click(Sender: TObject);
var
  xdb: Tbjxmllicense;
begin
  xdb := Tbjxmllicense.Create;
  try
    xdb.port := StrtoInt(edtPort.Text);
    if Length(xdb.GetLicenseNo) > 0 then
    MessageDlg(xdb.GetLicenseNo, mtInformation, [mbOK], 0)
    else
    MessageDlg('Update Tally!', mtError, [mbOK], 0);
  finally
  xdb.Free;
  end;
end;

procedure Tpostxmlfrm.mniTallyServer1Click(Sender: TObject);
var
url: string;
begin
  url := 'http://127.0.0.1' + ':' + edtPort.Text;
  URL := StringReplace(URL, '"', '%22', [rfReplaceAll]);
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

end.

