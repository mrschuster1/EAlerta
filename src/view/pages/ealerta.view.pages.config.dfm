inherited PageConfig: TPageConfig
  Caption = 'Configura'#231#245'es'
  OnClose = FormClose
  TextHeight = 15
  inherited pnlClient: TPanel
    inherited pnlTop: TPanel
      ExplicitLeft = 40
      ExplicitTop = 40
      ExplicitWidth = 931
    end
    inherited pnlBottom: TPanel
      ExplicitLeft = 40
      ExplicitTop = 550
      ExplicitWidth = 931
      inherited btnFechar: TButton
        TabOrder = 3
      end
      object btnSalvar: TButton
        Left = 856
        Top = 20
        Width = 75
        Height = 33
        Align = alRight
        Caption = '&Salvar'
        TabOrder = 1
        OnClick = btnSalvarClick
      end
      object Cancelar: TButton
        AlignWithMargins = True
        Left = 771
        Top = 20
        Width = 75
        Height = 33
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alRight
        Caption = '&Cancelar'
        TabOrder = 2
        OnClick = CancelarClick
      end
    end
    object pgcConfig: TPageControl
      Left = 158
      Top = 113
      Width = 813
      Height = 437
      ActivePage = tabUsuarios
      Align = alClient
      MultiLine = True
      Style = tsFlatButtons
      TabOrder = 2
      object tabNotificacoes: TTabSheet
        Caption = 'Notifica'#231#245'es'
        object FlowPanelGeral: TFlowPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 404
          Align = alClient
          BevelOuter = bvNone
          FlowStyle = fsTopBottomLeftRight
          Padding.Left = 20
          Padding.Top = 20
          Padding.Right = 20
          Padding.Bottom = 20
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object pnlArquivoSom: TPanel
            AlignWithMargins = True
            Left = 20
            Top = 20
            Width = 449
            Height = 41
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            BevelOuter = bvNone
            TabOrder = 0
            object btnAbrirArquivoSom: TSpeedButton
              Left = 426
              Top = 17
              Width = 23
              Height = 24
              Align = alRight
              Caption = #59448
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe Fluent Icons'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              OnClick = btnAbrirArquivoSomClick
              ExplicitLeft = 80
              ExplicitTop = 8
              ExplicitHeight = 22
            end
            object lblArquivoSom: TLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 447
              Height = 15
              Margins.Left = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Arquivo de som'
              ExplicitWidth = 84
            end
            object edtArquivoSom: TEdit
              Left = 0
              Top = 17
              Width = 426
              Height = 24
              Align = alClient
              TabOrder = 0
              ExplicitHeight = 23
            end
          end
          object checkReproduzirSom: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 76
            Width = 181
            Height = 17
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            Caption = 'Reproduzir som'
            TabOrder = 1
          end
          object checkExibirNotificacoes: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 108
            Width = 181
            Height = 17
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            Caption = 'Exibir notifica'#231#245'es'
            TabOrder = 2
          end
          object checkEnviarCatapush: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 140
            Width = 205
            Height = 17
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            Caption = 'Enviar mensagem via Catapush'
            TabOrder = 3
          end
          object checkEnviarCallmebot: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 172
            Width = 205
            Height = 17
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            Caption = 'Enviar mensagem via Callmebot'
            TabOrder = 4
          end
        end
      end
      object tabConexao: TTabSheet
        Caption = 'Conex'#227'o'
        ImageIndex = 1
        object FlowPanelConexao: TFlowPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 404
          Align = alClient
          BevelOuter = bvNone
          FlowStyle = fsTopBottomLeftRight
          Padding.Left = 20
          Padding.Top = 20
          Padding.Right = 20
          Padding.Bottom = 20
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object pnlBancoEco: TPanel
            AlignWithMargins = True
            Left = 20
            Top = 20
            Width = 449
            Height = 41
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            BevelOuter = bvNone
            TabOrder = 0
            object btnBancoEco: TSpeedButton
              Left = 426
              Top = 17
              Width = 23
              Height = 24
              Align = alRight
              Caption = #59448
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe Fluent Icons'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              OnClick = btnBancoEcoClick
              ExplicitLeft = 80
              ExplicitTop = 8
              ExplicitHeight = 22
            end
            object lblBancoEco: TLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 447
              Height = 15
              Margins.Left = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Banco de dados Eco'
              ExplicitWidth = 106
            end
            object edtBancoEco: TEdit
              Left = 0
              Top = 17
              Width = 426
              Height = 24
              Align = alClient
              TabOrder = 0
              ExplicitHeight = 23
            end
          end
          object pnlUsuarioFirebird: TPanel
            AlignWithMargins = True
            Left = 20
            Top = 76
            Width = 101
            Height = 41
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            BevelOuter = bvNone
            TabOrder = 1
            object lblUsuarioFirebird: TLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 99
              Height = 15
              Margins.Left = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Usu'#225'rio Firebird'
              ExplicitWidth = 83
            end
            object edtUsuarioFirebird: TEdit
              Left = 0
              Top = 17
              Width = 101
              Height = 24
              Align = alClient
              TabOrder = 0
              ExplicitHeight = 23
            end
          end
          object pnlSenhaFirebird: TPanel
            AlignWithMargins = True
            Left = 20
            Top = 132
            Width = 101
            Height = 41
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            BevelOuter = bvNone
            TabOrder = 2
            object lblSenhaFirebird: TLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 99
              Height = 15
              Margins.Left = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Senha Firebird'
              ExplicitWidth = 76
            end
            object edtSenhaFirebird: TEdit
              Left = 0
              Top = 17
              Width = 101
              Height = 24
              Align = alClient
              PasswordChar = #8226
              TabOrder = 0
              ExplicitHeight = 23
            end
          end
          object pnlDriverFirebird: TPanel
            AlignWithMargins = True
            Left = 20
            Top = 188
            Width = 449
            Height = 41
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 15
            BevelOuter = bvNone
            TabOrder = 3
            object btnDriverFirebird: TSpeedButton
              Left = 426
              Top = 17
              Width = 23
              Height = 24
              Align = alRight
              Caption = #59448
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe Fluent Icons'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              OnClick = btnDriverFirebirdClick
              ExplicitLeft = 432
              ExplicitTop = 20
            end
            object lblDriverFirebird: TLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 447
              Height = 15
              Margins.Left = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Driver Firebird'
              ExplicitWidth = 75
            end
            object edtDriverFirebird: TEdit
              Left = 0
              Top = 17
              Width = 426
              Height = 24
              Align = alClient
              TabOrder = 0
              ExplicitHeight = 23
            end
          end
        end
      end
      object tabAparencia: TTabSheet
        Caption = 'Apar'#234'ncia'
        ImageIndex = 2
        object FlowPanel1: TFlowPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 404
          Align = alClient
          BevelOuter = bvNone
          FlowStyle = fsTopBottomLeftRight
          Padding.Left = 20
          Padding.Top = 20
          Padding.Right = 20
          Padding.Bottom = 20
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object comboEstilo: TComboBox
            Left = 20
            Top = 20
            Width = 381
            Height = 22
            Style = csOwnerDrawFixed
            TabOrder = 0
            OnChange = comboEstiloChange
          end
        end
      end
      object tabUsuarios: TTabSheet
        Caption = 'Usu'#225'rios'
        ImageIndex = 3
        object pnlUsuarios: TPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 404
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object GroupButtons: TButtonGroup
      AlignWithMargins = True
      Left = 45
      Top = 133
      Width = 108
      Height = 397
      Margins.Left = 5
      Margins.Top = 20
      Margins.Right = 5
      Margins.Bottom = 20
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonOptions = [gboFullSize, gboGroupStyle, gboShowCaptions]
      Items = <
        item
          Caption = 'Notifica'#231#245'es'
        end
        item
          Caption = 'Conex'#227'o'
        end
        item
          Caption = 'Apar'#234'ncia'
        end
        item
          Caption = 'Usu'#225'rios'
          Hint = 'Usu'#225'rios'
        end>
      TabOrder = 3
      OnButtonClicked = GroupButtonsButtonClicked
    end
  end
  object OpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileName = 
      'C:\Users\Public\Documents\Embarcadero\Studio\22.0\Samples\Object' +
      ' Pascal\VCL\SplitView'
    FileTypes = <>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Left = 790
    Top = 274
  end
end
