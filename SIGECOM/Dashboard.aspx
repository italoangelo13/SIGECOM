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

    <%-- Scripts --%>
    <script src="assets/materialize/js/materialize.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom:0px">
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
            <div class="row" style="margin-bottom:0px">
                <nav class="col l12 blue">
                    <div class="nav-wrapper ">
                        <ul id="nav-mobile" class="left hide-on-med-and-down">
                            <li><asp:HyperLink runat="server" NavigateUrl="~/Views/Empresa.aspx" Target="tela">Empresa</asp:HyperLink></li>
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
                <iframe name="tela" src="indicativos.aspx" class="col l12" height="480px">

                </iframe>
            </div>
        </div>
    </form>
</body>
</html>
