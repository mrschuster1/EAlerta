inherited FormDialog: TFormDialog
  BorderIcons = [biSystemMenu]
  Caption = 'EAlerta'
  ClientHeight = 262
  ClientWidth = 388
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  ExplicitWidth = 400
  ExplicitHeight = 300
  TextHeight = 17
  inherited pnlBackground: TPanel
    Width = 388
    Height = 237
    Padding.Left = 20
    Padding.Top = 20
    Padding.Right = 20
    Padding.Bottom = 20
    object lblTitle: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 348
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      AutoSize = False
      Caption = 'T'#237'tulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      WordWrap = True
      ExplicitTop = 17
    end
    object lblBody: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 60
      Width = 348
      Height = 20
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Mensagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      WordWrap = True
      ExplicitTop = 50
      ExplicitWidth = 76
    end
    object pnlBottom: TPanel
      Left = 20
      Top = 176
      Width = 348
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 176
      ExplicitTop = 112
      ExplicitWidth = 185
      object btnPrimary: TButton
        Left = 0
        Top = 0
        Width = 164
        Height = 41
        Align = alLeft
        Caption = '&Ok'
        TabOrder = 0
        OnClick = btnPrimaryClick
      end
      object btnSecondary: TButton
        Left = 184
        Top = 0
        Width = 164
        Height = 41
        Align = alRight
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = btnSecondaryClick
        ExplicitLeft = 174
      end
    end
    object pnlInput: TPanel
      AlignWithMargins = True
      Left = 23
      Top = 93
      Width = 342
      Height = 30
      Margins.Bottom = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 20
      ExplicitTop = 100
      ExplicitWidth = 348
      object btnSenha: TSpeedButton
        Left = 312
        Top = 0
        Width = 30
        Height = 30
        Hint = 'Ajuda'
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alRight
        Caption = #63373
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe Fluent Icons'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        OnMouseDown = btnSenhaMouseDown
        OnMouseUp = btnSenhaMouseUp
        ExplicitLeft = 326
      end
      object edtInput: TEdit
        Left = 0
        Top = 0
        Width = 312
        Height = 30
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 20
        ExplicitTop = 103
        ExplicitWidth = 348
        ExplicitHeight = 25
      end
    end
  end
  inherited pnlCaptionBar: TPanel
    Width = 388
    inherited btnClose: TSpeedButton
      Left = 353
    end
    inherited btnWindow: TSpeedButton
      Left = 318
    end
    inherited btnMinimize: TSpeedButton
      Left = 283
    end
    inherited lblFormCaption: TLabel
      ExplicitTop = -6
      ExplicitHeight = 25
    end
    inherited btnHelp: TSpeedButton
      Left = 248
    end
  end
end
