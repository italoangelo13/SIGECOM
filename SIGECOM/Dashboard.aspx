<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SIGECOM.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Faria Personalizados</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../assets/img/favicon.ico" type="image/x-icon">

    <!--Estilos-->
    <link href="assets/materialize/css/materialize.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/fontello.css" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/animation.css" />
    <style>
        .modal-empresa {
            z-index: 999999;
            position: absolute;
            top: 0;
            background: rgba(0,0,0,0.5);
            height: 100vh;
            width: 100vw;
        }
    </style>

    <%-- Scripts --%>
    <script src="assets/local/jquery-3.3.1.min.js"></script>
    <script src="assets/materialize/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".dropdown-trigger").dropdown({
                autoTrigger: true,
                constrainWidth: false,
                hover: true
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="_lkCadEmpresa" Visible="false" NavigateUrl="~/Views/Empresa.aspx" Target="tela" runat="server"></asp:HyperLink>
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 0px">
                <div class="col l9">
                    <h6>
                        <asp:HyperLink ID="_lkHome" NavigateUrl="~/indicativos.aspx" Target="tela" runat="server"><i class='icone-home'></i> Inicio</asp:HyperLink>
                        |
                        <asp:LinkButton ID="_lkLogout" runat="server" OnClick="_lkLogout_Click"><i class='icone-logout'></i> Sair</asp:LinkButton>
                    </h6>
                </div>
                <div class="col l3 right-align">
                    <h6>Olá,
                        <asp:Label ID="_lblUsuario" runat="server">Usuario</asp:Label></h6>
                </div>
            </div>
            <div class="row" style="margin-bottom: 0px">
                <%-- Listagens Menu --%>

                <!-- Dropdown Admin -->
                <ul id="dropdownAdm" class="dropdown-content" style="width: 300px">
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Empresa</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Usuarios</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Funcionarios</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Departamentos</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server"  CssClass="dropdown-trigger" data-target="dropdownEnd" >Endereço</asp:HyperLink></li>
                    <li class="divider"></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="" Target="tela">ADM001 - Relação de Usuarios</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="" Target="tela">ADM002 - Relação de Funcionarios</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="" Target="tela">ADM003 - Relação de Departamentos</asp:HyperLink></li>
                </ul>


                <!-- Dropdown Endereco -->
                <ul id="dropdownEnd" class="dropdown-content" style="width: 300px;">
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Tipo Logradouro</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Logradouro</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Bairro</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Municipio</asp:HyperLink></li>
                </ul>
                <nav class="col l12 blue">
                    <div class="nav-wrapper ">

                        <ul id="nav-mobile" class="left hide-on-med-and-down">
                            <li>
                                <asp:HyperLink runat="server" CssClass="dropdown-trigger" data-target="dropdownAdm">Administrativo</asp:HyperLink>
                            </li>
                            <li><a href="badges.html">Usuarios</a></li>
                            <li><a href="collapsible.html">Funcionarios</a></li>
                            <li><a href="collapsible.html">Clientes</a></li>
                            <li><a href="collapsible.html">Produtos</a></li>
                            <li><a href="collapsible.html">Pedidos</a></li>
                            <li><a href="collapsible.html">Contas a Receber</a></li>
                            <li><a href="collapsible.html">Contas a Pagar</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="row">
                <iframe name="tela" src="indicativos.aspx" class="col l12" height="480px"></iframe>
            </div>
        </div>



        <!-- Modal Structure -->
        <asp:Panel runat="server" Visible="false" ID="_pnlmodalCadEmpresa" class="modal-empresa" Style="padding: 10px;">
            <div class="container white" style="padding: 10px;">
                <div class="row">
                    <div class="col l10">
                        <h4>Informações da Empresa</h4>
                    </div>
                    <div class="col l2">
                        <asp:Button ID="_btnSalvar" runat="server" CssClass="btn btn-large waves white-text" Text="Salvar" OnClick="_btnSalvar_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col l12">
                        <p>Constatamos que você ainda não preencheu as informações da sua empresa. Estas informações são necessarias para o funcionamento do sistema. Após o preenchimento, você poderá utilizar as funcionalidades que o nosso sistema lhe oferece.</p>
                        <h6><span class="red-text">* Campos Obrigatórios</span></h6>
                    </div>
                </div>
                <%-- Empresa --%>
                <div class="row light-blue">
                    <div class="col l12">
                        <h5 class="white-text">Empresa</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col l12">
                        <div class="container-fluid" runat="server">
                            <div class="row">
                                <div class="row">
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="_edNomeFantasia" runat="server"></asp:TextBox>
                                        <label for="_edNomeFantasia">Nome Fantasia <span class="red-text">*</span></label>
                                    </div>
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="_edRazaoSocial" runat="server"></asp:TextBox>
                                        <label for="_edRazaoSocial">Razão Social</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="_edcnpj" runat="server"></asp:TextBox>
                                        <label for="_edcnpj">CNPJ</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="_edEndereco" runat="server"></asp:TextBox>
                                        <label for="_edEndereco">Endereço</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s3">
                                        <asp:TextBox ID="_edTel1" runat="server"></asp:TextBox>
                                        <label for="_edTel1">Telefone Comercial 1</label>
                                    </div>
                                    <div class="input-field col s3">
                                        <asp:TextBox ID="_edTel2" runat="server"></asp:TextBox>
                                        <label for="_edTel2">Telefone Comercial 2</label>
                                    </div>
                                    <div class="input-field col s3">
                                        <asp:TextBox ID="_edFax" runat="server"></asp:TextBox>
                                        <label for="_edFax">Fax</label>
                                    </div>
                                    <div class="input-field col s3">
                                        <asp:TextBox ID="_edDataAbertura" runat="server" TextMode="Date"></asp:TextBox>
                                        <label for="_edDataAbertura">Date de Abertura</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Proprietario --%>
                <div class="row light-blue">
                    <div class="col l12">
                        <h5 class="white-text">Proprietário</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col l12">
                        <div class="container-fluid" runat="server">
                            <div class="row">
                                <div class="input-field col s6">
                                    <asp:TextBox ID="_edProprietario" runat="server"></asp:TextBox>
                                    <label for="_edProprietario">Propretário <span class="red-text">*</span></label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox ID="_edCpfProp" runat="server"></asp:TextBox>
                                    <label for="_edCpfProp">Cpf</label>
                                </div>
                                <div class="input-field col s3">
                                    <asp:TextBox ID="_edTelProp" runat="server"></asp:TextBox>
                                    <label for="_edTelProp">Telefone</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </asp:Panel>
    </form>
</body>
</html>
