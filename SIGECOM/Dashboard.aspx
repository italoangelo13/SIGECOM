<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SIGECOM.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SIGECOM - Sistema de Gerenciamento Comercial</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../assets/img/favicon.ico" type="image/x-icon">--%>

    <!--Estilos-->
    <%--<link href="assets/materialize/css/materialize.min.css" rel="stylesheet" />--%>
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/fontello.css" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/animation.css" />
    <link href="assets/local/sigecomStyle.css" rel="stylesheet" />
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
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <%--<script src="assets/materialize/js/materialize.min.js"></script>--%>
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
                <div class="col-lg-9">
                    <h6>
                        <asp:HyperLink ID="_lkHome" NavigateUrl="~/indicativos.aspx" Target="tela" runat="server"><i class='icone-home'></i> Inicio</asp:HyperLink>
                        |
                        <asp:LinkButton ID="_lkLogout" runat="server" OnClick="_lkLogout_Click"><i class='icone-logout'></i> Sair</asp:LinkButton>
                    </h6>
                </div>
                <div class="col-lg-3 text-right">
                    <h6>Olá,
                        <asp:Label ID="_lblUsuario" runat="server">Usuario</asp:Label></h6>
                </div>
            </div>
            <div class="row">
                <nav class="navbar col-lg-12 navbar-expand-lg navbar-dark bg-blue">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownAdministrativo" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Administrativo
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownAdministrativo">
                                    <a class="dropdown-item" href="Views/Empresa.aspx" target="tela">Institucional</a>
                                    <a class="dropdown-item" href="#">Usuarios</a>
                                    <a class="dropdown-item" href="#">Funcionarios</a>
                                    <a class="dropdown-item" href="Views/Empresa.aspx" target="tela">Tipo Logradouro</a>
                                    <a class="dropdown-item" href="#">Logradouro</a>
                                    <a class="dropdown-item" href="#">Bairro</a>
                                    <a class="dropdown-item" href="#">Municipio</a>
                                    <a class="dropdown-item" href="#">Parametros</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">ADM001 - Relação de Usuarios</a>
                                    <a class="dropdown-item" href="#">ADM002 - Relação de Funcionarios</a>
                                    <a class="dropdown-item" href="#">ADM003 - Relação de Tipos de Logradouro</a>
                                    <a class="dropdown-item" href="#">ADM004 - Relação de Logradouros</a>
                                    <a class="dropdown-item" href="#">ADM005 - Relação de Bairros</a>
                                    <a class="dropdown-item" href="#">ADM006 - Relação de Municipios</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownComercial" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Comercial
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownComercial">
                                    <a class="dropdown-item" href="Views/Empresa.aspx" target="tela">Cliente</a>
                                    <a class="dropdown-item" href="#">Pedidos</a>
                                    <a class="dropdown-item" href="#">Orçamentos</a>
                                    <a class="dropdown-item" href="#">Promoções</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">COM001 - Relação de Clientes</a>
                                    <a class="dropdown-item" href="#">COM002 - Relação de Pedidos</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownAlmoxarifado" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Almoxarifado
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownAlmoxarifado">
                                    <a class="dropdown-item" href="Views/CRUDCategorias.aspx" target="tela">Categorias</a>
                                    <a class="dropdown-item" href="Views/Empresa.aspx" target="tela">Produtos</a>
                                    <a class="dropdown-item" href="#">Entrada de Produtos</a>
                                    <a class="dropdown-item" href="#">Saida de Produtos</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">ALM001 - Relação de Produtos</a>
                                    <a class="dropdown-item" href="#">ALM002 - Relação de Entradas de Produtos</a>
                                    <a class="dropdown-item" href="#">ALM002 - Relação de Saida de Produtos</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="row" style="margin: 0px">
                <iframe name="tela" src="indicativos.aspx" class="col-lg-12" height="626px" style="border: 0px; padding: 0px"></iframe>
            </div>
            <footer class="row bg-blue text-white" style="padding: 1px; margin: 0px;">
                <div class="col-lg-6">
                    <h6>SIGECOM - SISTEMA DE GERENCIAMENTO COMERCIAL</h6>
                    <i>Powered by Faria Soft - Todos os direitos Reservados</i>
                </div>
                <div class="col-lg-6 text-right">
                    Versão do Sistema -
                    <asp:Label runat="server" ID="_lblVersao">01.00.00.000</asp:Label>
                    <br />
                    Lançada em
                    <asp:Label runat="server" ID="_lblDtLancamento">20/03/2019 ás 16:53</asp:Label>
                </div>
            </footer>
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
