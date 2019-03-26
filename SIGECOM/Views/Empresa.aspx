<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empresa.aspx.cs" Inherits="SIGECOM.Views.Empresa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Empresa</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../assets/img/favicon.ico" type="image/x-icon">--%>

    <!--Estilos-->
    <link href="../assets/materialize/css/materialize.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/fontello.css" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/animation.css" />
    <link href="../assets/local/sigecomStyle.css" rel="stylesheet" />


    <%-- Scripts --%>
    <script src="../assets/local/jquery-3.3.1.min.js"></script>
    <script src="../assets/materialize/js/materialize.min.js"></script>
    <script src="../assets/local/Format.js"></script>
    <script>
        $(document).ready(function () {
            $('#_edCep').change(function () {
                var cep = $('#_edCep').val().replace('-', '');
                var url = 'viacep.com.br/ws/' + cep + '/json/';
                $.ajax({
                    url: "http://" + url,
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    dataType: "jsonp",
                    data: {},
                    success: function (data) {
                        var municipio = data.localidade;
                        var bairro = data.bairro;
                        var logradouro = data.logradouro;
                        var complemento = data.complemento;
                        var uf = data.uf;
                        $('#_edMunicipio').val(municipio);
                        $('#_edBairro').val(bairro);
                        $('#_edLogradouro').val(logradouro);
                        $('#_edComplemento').val(complemento);
                        $('#_edUf').val(uf);
                    }
                });
            });
        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row bg-teal valign-wrapper" style="height: 50px;">
                <div class="col l12 right-align">
                    <h6 class="white-text"><strong>Dados Empresariais</strong></h6>
                </div>
            </div>

            <div class="row">
                <div class="col l12">
                    <asp:LinkButton ID="_lkSalvar" CssClass="btn btn-large green" runat="server" OnClick="_lkSalvar_Click"><i class="icone-floppy"></i> Salvar</asp:LinkButton>
                    <asp:LinkButton ID="_lkLimpar" CssClass="btn btn-large blue-grey" runat="server"><i class="icone-brush"></i> Limpar</asp:LinkButton>
                </div>
            </div>

            <div class="row">
                <div class="col l12">
                    <fieldset style="border: 1px solid #000" class="center-align">
                        <legend>
                            <h5>Informações da Empresa</h5>
                        </legend>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="input-field col s5">
                                    <asp:TextBox runat="server" ID="_edRazaoSocial" type="text"></asp:TextBox>
                                    <label for="_edRazaoSocial">Razão Social</label>
                                </div>
                                <div class="input-field col s5">
                                    <asp:TextBox runat="server" ID="_edNomeFantasia" type="text"></asp:TextBox>
                                    <label for="_edNomeFantasia">Nome Fantasia</label>
                                </div>
                                <div class="input-field col s2">
                                    <asp:TextBox ID="_edDataAbertura" runat="server" TextMode="Date"></asp:TextBox>
                                    <label for="_edDataAbertura">Date de Abertura</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s3">
                                    <asp:TextBox runat="server" ID="_edCnpj" type="text" onKeyDown="Format(this,Cnpj);" MaxLength="18" CssClass="validate"></asp:TextBox>
                                    <label for="_edCnpj">CNPJ</label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox runat="server" ID="_edTel1" type="text"></asp:TextBox>
                                    <label for="_edTel1">Telefone 1</label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox runat="server" ID="_edTel2" type="text"></asp:TextBox>
                                    <label for="_edTel2">Telefone 2</label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox runat="server" ID="_edFax" type="text"></asp:TextBox>
                                    <label for="_edFax">Fax</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" ID="_edProprietario" type="text"></asp:TextBox>
                                    <label for="_edProprietario">Nome Proprietario</label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox runat="server" ID="_edTelProp" type="text" onKeyDown="Format(this,Telefone);" MaxLength="9"></asp:TextBox>
                                    <label for="_edTelProp">Telefone Proprietario</label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox runat="server" ID="_edCpfProp" type="text"></asp:TextBox>
                                    <label for="_edCpfProp">CPF Proprietario</label>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset style="border: 1px solid #000" class="center-align">
                        <legend>
                            <h5>Endereço da Empresa</h5>
                        </legend>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="input-field col s2">
                                    <asp:TextBox runat="server" ID="_edCep" type="text" onKeyDown="Format(this,Cep);" MaxLength="9"></asp:TextBox>
                                    <label for="_edCep">Cep</label>
                                </div>
                                <div class="input-field col s5">
                                    <asp:TextBox runat="server" ID="_edMunicipio" type="text"></asp:TextBox>
                                    <label for="_edMunicipio">Municipio</label>
                                </div>
                                <div class="input-field col s5">
                                    <asp:TextBox runat="server" ID="_edBairro" type="text"></asp:TextBox>
                                    <label for="_edBairro">Bairro</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s5">
                                    <asp:TextBox runat="server" ID="_edLogradouro" type="text"></asp:TextBox>
                                    <label for="_edLogradouro">Logradouro</label>
                                </div>
                                <div class="input-field col s2">
                                    <asp:TextBox runat="server" ID="_edNumero" type="text" onKeyDown="Format(this,Number);" MaxLength="5"></asp:TextBox>
                                    <label for="_edNumero">Numero</label>
                                </div>
                                <div class="input-field col s5">
                                    <asp:TextBox runat="server" ID="_edComplemento" type="text"></asp:TextBox>
                                    <label for="_edComplemento">Complemento</label>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
