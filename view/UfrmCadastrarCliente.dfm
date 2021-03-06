object FrmCadastrarCliente: TFrmCadastrarCliente
  Left = 0
  Top = 0
  Caption = 'Cadastrar Cliente'
  ClientHeight = 363
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 322
    Width = 683
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnFechar: TButton
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 683
    Height = 322
    ActivePage = tbDados
    Align = alClient
    TabOrder = 0
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object edtPesquisar: TLabeledEdit
          Left = 16
          Top = 24
          Width = 289
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 588
          Top = 20
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBtnsPesq: TPanel
        Left = 0
        Top = 253
        Width = 675
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 426
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 507
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 588
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 52
        Width = 669
        Height = 198
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Visible = True
          end>
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 104
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object Estado: TLabel
        Left = 16
        Top = 160
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label2: TLabel
        Left = 176
        Top = 160
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object edtCodigo: TLabeledEdit
        Left = 16
        Top = 24
        Width = 81
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        Enabled = False
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Left = 16
        Top = 72
        Width = 433
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
      object cbxTipo: TComboBox
        Left = 16
        Top = 120
        Width = 81
        Height = 21
        ItemIndex = 0
        TabOrder = 2
        Text = 'F'#237'sico'
        Items.Strings = (
          'F'#237'sico'
          'Jur'#237'dico')
      end
      object edtDocumento: TLabeledEdit
        Left = 136
        Top = 120
        Width = 137
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Documento'
        MaxLength = 15
        TabOrder = 3
      end
      object edtTelefone: TLabeledEdit
        Left = 312
        Top = 120
        Width = 137
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Telefone'
        MaxLength = 10
        TabOrder = 4
      end
      object pnlBtnsCad: TPanel
        Left = 0
        Top = 253
        Width = 675
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        object btnListar: TButton
          Left = 345
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 426
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 507
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 588
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
      end
      object cbxEstado: TComboBox
        Left = 16
        Top = 176
        Width = 145
        Height = 21
        TabOrder = 6
      end
      object ComboBox1: TComboBox
        Left = 176
        Top = 176
        Width = 273
        Height = 21
        TabOrder = 7
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = DmCliente.sqlPesquisar
    Left = 340
    Top = 32
  end
  object DsEstados: TDataSource
    DataSet = DmEstado.sqlPesquisar
    Left = 348
    Top = 192
  end
end
