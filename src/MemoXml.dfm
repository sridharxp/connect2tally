object postxmlfrm: Tpostxmlfrm
  Left = 207
  Top = 86
  Width = 537
  Height = 608
  Caption = 'Post XML to Tally'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 70
    Width = 521
    Height = 240
    TabOrder = 1
    object ReqMemo: TMemo
      Left = 1
      Top = 1
      Width = 519
      Height = 238
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 310
    Width = 521
    Height = 220
    Align = alCustom
    TabOrder = 2
    object ResMemo: TMemo
      Left = 1
      Top = 1
      Width = 519
      Height = 218
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 65
    Align = alCustom
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 6
      Width = 43
      Height = 20
      Caption = 'Open '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 32
      Width = 40
      Height = 20
      Caption = 'Save '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblPort: TLabel
      Left = 384
      Top = 6
      Width = 29
      Height = 20
      Caption = 'Port'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnPostXml: TButton
      Left = 384
      Top = 32
      Width = 96
      Height = 25
      Caption = 'Post XML'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnPostXmlClick
    end
    object edtReqFileName: TEdit
      Left = 120
      Top = 6
      Width = 192
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Test.xml'
    end
    object edtResFileName: TEdit
      Left = 120
      Top = 32
      Width = 192
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Tally.xml'
    end
    object edtPort: TEdit
      Left = 432
      Top = 6
      Width = 70
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '9000'
    end
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 32
    object mniool1: TMenuItem
      Caption = 'Tool'
      object mniTallyServer1: TMenuItem
        Caption = 'Test Tally Server'
        OnClick = mniTallyServer1Click
      end
      object mniLicenseKey1: TMenuItem
        Caption = 'Tally License Key'
        OnClick = mniLicenseKey1Click
      end
    end
    object Register1: TMenuItem
      Caption = 'Developer'
      OnClick = Register1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 368
    Top = 48
  end
  object IDHttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 120
    Top = 24
  end
end
