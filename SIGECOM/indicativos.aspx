<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indicativos.aspx.cs" Inherits="SIGECOM.indicativos" %>

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
    <link href="assets/local/sigecomStyle.css" rel="stylesheet" />
    <style>
        .indCard {
            border: 2px solid #fff;
            border-radius: 2px;
            color: #fff;
            font-weight: 700;
            margin: 2px;
        }

        .bg-green{
            background-color:#2e7d32;
        }

        .bg-teal{
            background-color:#00796b;
        }

        .bg-red{
            background-color:#c62828;
        }

        .bg-yellow{
            background-color:#f9a825;
        }

        .bg-blue{
            background-color:#1565c0;
        }

        .icon-card {
            color: rgba(255,255,255,0.1);
            float: right;
            font-size: 50pt;
        }

        .texto-card {
            position: absolute;
        }
    </style>

    <%-- Scripts --%>
    <script src="assets/local/jquery-3.3.1.min.js"></script>
    <script src="assets/materialize/js/materialize.min.js"></script>
</head>
<body style="background: url('assets/img/bg-dashboard.jpg') center;">
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding:10px">
            <div class="row">
                <div class="col l12">
                    <h3>Indicativos</h3>
                </div>
            </div>
            <div class="row">
                <div class="col l3 center-align indCard bg-blue">
                    <div class="texto-card">
                        <p>Pedidos Abertos</p>
                        <p>
                            <asp:Label ID="Label1" runat="server" Style="font-size: 20pt">0</asp:Label>
                        </p>
                    </div>

                    <i class="icone-clock icon-card"></i>
                </div>


                <div class="col l3 center-align indCard bg-red">
                    <div class="texto-card">
                        <p>Clientes</p>
                        <p>
                            <asp:Label ID="Label2" runat="server" Style="font-size: 20pt">0</asp:Label>
                        </p>
                    </div>

                    <i class="icone-check icon-card"></i>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
