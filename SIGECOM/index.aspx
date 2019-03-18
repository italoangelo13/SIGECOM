<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SIGECOM.index" %>

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
<body style="background: url('../assets/img/bg-admin.jpg');">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-top: 100px;">
                <div class="col l4">
                </div>
                <div class="col l4 white" style="padding:15px; border-radius:5px">
                    <div class=" row" style="width:100%">
                            <div class="col s12 center">
                                <h1>SIGECOM</h1>
                            </div>
                    </div>
                    <div class=" row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="_edUsuario" runat="server"></asp:TextBox>
                                <label for="_edUsuario"><i class="icone-user"></i>Usuario</label>
                            </div>
                            <div class="input-field col s12">
                                <asp:TextBox ID="_edSenha" runat="server" TextMode="Password"></asp:TextBox>
                                <label for="_edSenha"><i class="icone-lock"></i>Senha</label>
                            </div>
                    </div>
                    <div class=" row">
                            <div class="col s12 center">
                                <asp:Button ID="_btnAcessar" runat="server" style="width:100%" CssClass="btn btn-block btn-large waves-light" Text="Acessar" OnClick="_btnAcessar_Click"/>
                            </div>
                    </div>
                    <div class=" row">
                            <div class="col s12 center">
                                <h6 style="font-size:10pt">Powered by Faria Soft @ Todos os Direitos Reservados.</h6>
                            </div>
                    </div>
                </div>
                <div class="col l4">
                </div>
            </div>
        </div>
    </form>

    
</body>
</html>
