inherited FormMain: TFormMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'EAlerta'
  ClientHeight = 634
  ClientWidth = 947
  DoubleBuffered = True
  FormStyle = fsMDIForm
  OnCloseQuery = FormCloseQuery
  ExplicitHeight = 672
  TextHeight = 17
  inherited pnlBackground: TPanel
    Width = 947
    Height = 609
    ParentColor = True
    ExplicitWidth = 941
    object pnlClient: TPanel
      Left = 20
      Top = 0
      Width = 927
      Height = 609
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Right = 10
      TabOrder = 0
      ExplicitWidth = 921
      ExplicitHeight = 600
    end
    object svMenu: TSplitView
      Left = 0
      Top = 0
      Width = 20
      Height = 609
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      CloseStyle = svcCompact
      Color = clBlack
      CompactWidth = 20
      DisplayMode = svmOverlay
      Opened = False
      OpenedWidth = 200
      Placement = svpLeft
      TabOrder = 1
      OnClosed = svMenuClosed
      OnExit = svMenuExit
      OnOpened = svMenuOpened
      ExplicitHeight = 600
      object btnMenu: TSpeedButton
        Left = 0
        Top = 0
        Width = 20
        Height = 609
        Hint = 'Menu'
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = #59243
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe Fluent Icons'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        OnClick = btnMenuClick
      end
      object GroupButtons: TButtonGroup
        AlignWithMargins = True
        Left = 25
        Top = 20
        Width = 9
        Height = 569
        Margins.Left = 5
        Margins.Top = 20
        Margins.Right = 5
        Margins.Bottom = 20
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ButtonOptions = [gboFullSize, gboGroupStyle, gboShowCaptions]
        Items = <
          item
            Caption = 'In'#237'cio'
            Hint = 'In'#237'cio'
          end
          item
            Caption = 'Configura'#231#245'es'
            Hint = 'Configura'#231#245'es'
          end>
        ItemIndex = 0
        TabOrder = 0
        OnButtonClicked = GroupButtonsButtonClicked
        ExplicitHeight = 560
      end
      object pnlMenuRightMargin: TPanel
        AlignWithMargins = True
        Left = 19
        Top = 5
        Width = 1
        Height = 599
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alRight
        BevelOuter = bvNone
        Color = cl3DDkShadow
        ParentBackground = False
        TabOrder = 1
        StyleElements = [seFont, seBorder]
        ExplicitHeight = 590
      end
    end
  end
  inherited pnlCaptionBar: TPanel
    Width = 947
    Padding.Left = 0
    ExplicitWidth = 941
    inherited btnClose: TSpeedButton
      Left = 912
      ExplicitLeft = 907
    end
    inherited btnWindow: TSpeedButton
      Left = 877
      ExplicitLeft = 862
    end
    inherited btnMinimize: TSpeedButton
      Left = 842
      ExplicitLeft = 817
    end
    inherited lblFormCaption: TLabel
      AlignWithMargins = True
      Height = 25
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
    end
    object btnConfig: TSpeedButton [4]
      Left = 772
      Top = 0
      Width = 35
      Height = 25
      Hint = 'Configura'#231#245'es'
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      Caption = #59155
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe Fluent Icons'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      OnClick = btnConfigClick
      ExplicitLeft = 700
      ExplicitTop = 4
      ExplicitHeight = 21
    end
    inherited btnHelp: TSpeedButton
      Left = 807
      OnClick = btnHelpClick
      ExplicitLeft = 772
    end
  end
end
