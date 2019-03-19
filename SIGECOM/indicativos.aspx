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
    <style>
        .indCard-prdidos {
            border: 2px solid #3289f3;
            border-radius: 10px;
            background: #0d47a1;
            color: #fff;
            font-weight: 700;
        }

        .icon-card {
            color: rgba(255,255,255,0.1);
            float: right;
            font-size: 50pt;
        }

        .texto-card{
            position: absolute;
        }
    </style>

    <%-- Scripts --%>
    <script src="assets/local/jquery-3.3.1.min.js"></script>
    <script src="assets/materialize/js/materialize.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col l6">
                    <h5>Pedidos</h5>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col l3 center-align indCard-prdidos">
                                <div class="texto-card">
                                    <p>Em Aprovação</p>
                                    <p>
                                        <asp:Label ID="_lblIndAprovacao" runat="server" Style="font-size: 20pt">0</asp:Label>
                                    </p>
                                </div>

                                <i class="icone-clock icon-card"></i>
                            </div>


                            <div class="col l3 center-align indCard-prdidos">
                                <div class="texto-card">
                                    <p>Concluidos</p>
                                    <p>
                                        <asp:Label ID="_lblIndConcluidos" runat="server" Style="font-size: 20pt">0</asp:Label>
                                    </p>
                                </div>

                                <i class="icone-check icon-card"></i>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
