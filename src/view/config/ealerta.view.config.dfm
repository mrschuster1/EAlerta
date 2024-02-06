inherited FormConfig: TFormConfig
  Caption = 'Configura'#231#245'es'
  ClientHeight = 744
  ClientWidth = 1092
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 1104
  ExplicitHeight = 782
  TextHeight = 17
  inherited pnlClient: TPanel
    Width = 1092
    Height = 719
    ExplicitWidth = 1086
    ExplicitHeight = 710
    object btnSalvar: TButton
      AlignWithMargins = True
      Left = 20
      Top = 619
      Width = 1052
      Height = 40
      Margins.Left = 20
      Margins.Top = 5
      Margins.Right = 20
      Margins.Bottom = 5
      Align = alBottom
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitTop = 610
      ExplicitWidth = 1046
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 20
      Top = 669
      Width = 1052
      Height = 40
      Margins.Left = 20
      Margins.Top = 5
      Margins.Right = 20
      Margins.Bottom = 10
      Align = alBottom
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      ExplicitTop = 660
      ExplicitWidth = 1046
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 1092
      Height = 614
      ActivePage = tabConexao
      Align = alClient
      RaggedRight = True
      TabOrder = 2
      ExplicitWidth = 1086
      ExplicitHeight = 605
      object tabConexao: TTabSheet
        Caption = 'Conex'#227'o'
        object ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 1084
          Height = 582
          HorzScrollBar.Smooth = True
          HorzScrollBar.Style = ssHotTrack
          HorzScrollBar.Tracking = True
          VertScrollBar.Smooth = True
          VertScrollBar.Style = ssHotTrack
          VertScrollBar.Tracking = True
          Align = alClient
          BorderStyle = bsNone
          Padding.Left = 20
          Padding.Top = 50
          Padding.Right = 20
          Padding.Bottom = 20
          TabOrder = 0
          OnMouseWheel = ScrollBoxMouseWheel
          ExplicitWidth = 1078
          ExplicitHeight = 573
          object lblEnviarMensagemCallmebot: TLabel
            AlignWithMargins = True
            Left = 20
            Top = 459
            Width = 1023
            Height = 17
            Margins.Left = 0
            Margins.Top = 20
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Enviar mensagem Callmebot'
            ExplicitWidth = 173
          end
          object lblEnviarMensagemCatapush: TLabel
            AlignWithMargins = True
            Left = 20
            Top = 531
            Width = 1023
            Height = 17
            Margins.Left = 0
            Margins.Top = 20
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Enviar mensagem Catapush'
            ExplicitWidth = 169
          end
          object lblExibirNotificacoes: TLabel
            AlignWithMargins = True
            Left = 20
            Top = 315
            Width = 1023
            Height = 17
            Margins.Left = 0
            Margins.Top = 20
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Exibir notifica'#231#245'es'
            ExplicitWidth = 109
          end
          object lblReproduzirSom: TLabel
            AlignWithMargins = True
            Left = 20
            Top = 387
            Width = 1023
            Height = 17
            Margins.Left = 0
            Margins.Top = 20
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Reproduzir som'
            ExplicitWidth = 96
          end
          object lblEstilo: TLabel
            AlignWithMargins = True
            Left = 20
            Top = 603
            Width = 1023
            Height = 17
            Margins.Left = 0
            Margins.Top = 20
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Estilo'
            ExplicitWidth = 32
          end
          object edtArquivoSom: TLabeledEdit
            AlignWithMargins = True
            Left = 20
            Top = 105
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 30
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            EditLabel.Width = 186
            EditLabel.Height = 17
            EditLabel.Caption = 'Arquivo de som da notifica'#231#227'o'
            TabOrder = 1
            Text = ''
            ExplicitWidth = 1017
          end
          object edtBancoFirebirdEco: TLabeledEdit
            Left = 20
            Top = 50
            Width = 1023
            Height = 25
            Align = alTop
            EditLabel.Width = 172
            EditLabel.Height = 17
            EditLabel.Caption = 'Banco de dados Eco Firebird'
            TabOrder = 0
            Text = ''
            ExplicitWidth = 1017
          end
          object edtCelularCallmebot: TLabeledEdit
            AlignWithMargins = True
            Left = 20
            Top = 160
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 30
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            EditLabel.Width = 274
            EditLabel.Height = 17
            EditLabel.Caption = '[Callmebot] Celular para envio de mensagens'
            TabOrder = 2
            Text = ''
            ExplicitWidth = 1017
          end
          object edtCelularCatapush: TLabeledEdit
            AlignWithMargins = True
            Left = 20
            Top = 270
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 30
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            EditLabel.Width = 270
            EditLabel.Height = 17
            EditLabel.Caption = '[Catapush] Celular para envio de mensagens'
            TabOrder = 4
            Text = ''
            ExplicitWidth = 1017
          end
          object edtChaveApiCallmebot: TLabeledEdit
            AlignWithMargins = True
            Left = 20
            Top = 215
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 30
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            EditLabel.Width = 132
            EditLabel.Height = 17
            EditLabel.Caption = '[Callmebot] Chave api'
            TabOrder = 3
            Text = ''
            ExplicitWidth = 1017
          end
          object switchCatapush: TToggleSwitch
            AlignWithMargins = True
            Left = 20
            Top = 558
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 10
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            AutoSize = False
            StateCaptions.CaptionOn = 'Sim'
            StateCaptions.CaptionOff = 'N'#227'o'
            SwitchHeight = 18
            SwitchWidth = 40
            TabOrder = 8
            ExplicitWidth = 1017
          end
          object switchNotificacoes: TToggleSwitch
            AlignWithMargins = True
            Left = 20
            Top = 342
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 10
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            AutoSize = False
            StateCaptions.CaptionOn = 'Sim'
            StateCaptions.CaptionOff = 'N'#227'o'
            SwitchHeight = 18
            SwitchWidth = 40
            TabOrder = 5
            ExplicitWidth = 1017
          end
          object switchSom: TToggleSwitch
            AlignWithMargins = True
            Left = 20
            Top = 414
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 10
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            AutoSize = False
            StateCaptions.CaptionOn = 'Sim'
            StateCaptions.CaptionOff = 'N'#227'o'
            SwitchHeight = 18
            SwitchWidth = 40
            TabOrder = 6
            ExplicitWidth = 1017
          end
          object swtichCallmebot: TToggleSwitch
            AlignWithMargins = True
            Left = 20
            Top = 486
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 10
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            AutoSize = False
            StateCaptions.CaptionOn = 'Sim'
            StateCaptions.CaptionOff = 'N'#227'o'
            SwitchHeight = 18
            SwitchWidth = 40
            TabOrder = 7
            ExplicitWidth = 1017
          end
          object comboEstilo: TComboBox
            AlignWithMargins = True
            Left = 20
            Top = 625
            Width = 1023
            Height = 25
            Margins.Left = 0
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            AutoDropDown = True
            AutoDropDownWidth = True
            AutoCloseUp = True
            Style = csDropDownList
            ExtendedUI = True
            Sorted = True
            TabOrder = 9
            OnChange = comboEstiloChange
            ExplicitWidth = 1017
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
      end
    end
  end
  inherited pnlCaptionBar: TPanel
    Width = 1092
    Color = clWindowFrame
    ExplicitWidth = 1086
    inherited btnClose: TSpeedButton
      Left = 1057
      ExplicitLeft = 526
    end
    inherited btnWindow: TSpeedButton
      Left = 1022
      ExplicitLeft = 481
    end
    inherited btnMinimize: TSpeedButton
      Left = 987
      ExplicitLeft = 436
    end
    inherited lblFormCaption: TLabel
      Height = 25
    end
    inherited btnHelp: TSpeedButton
      Left = 952
      ExplicitLeft = 391
    end
  end
end
