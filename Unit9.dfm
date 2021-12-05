object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Form9'
  ClientHeight = 495
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 559
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 368
    Width = 772
    Height = 127
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 17
    Top = 58
    Width = 536
    Height = 21
    TabOrder = 2
    Text = 'RUA ALCINDO RIBEIRO CONRADO - DR., 1395, Franca - SP'
  end
  object Edit2: TEdit
    Left = 17
    Top = 104
    Width = 232
    Height = 21
    TabOrder = 3
  end
  object IdHTTP1: TIdHTTP
    HandleRedirects = True
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
    Left = 232
    Top = 128
  end
end
