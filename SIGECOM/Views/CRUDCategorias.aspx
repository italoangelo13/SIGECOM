<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDCategorias.aspx.cs" Inherits="SIGECOM.Views.CRUDCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Categoria de Produtos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../assets/img/favicon.ico" type="image/x-icon">--%>

    <!--Estilos-->
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/fontello.css" />
    <link rel="stylesheet" type="text/css" href="../assets/fontello/css/animation.css" />
    <link href="../assets/local/sigecomStyle.css" rel="stylesheet" />


    <%-- Scripts --%>
    <script src="../assets/local/jquery-3.3.1.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/local/Format.js"></script>
    <script>
        $(document).ready(function () {

        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row bg-teal">
                <div class="col-lg-12 ">
                    <h5 class="text-white"><strong>Categoria de Produtos</strong></h5>
                </div>
                <div class="col-lg-12">
                    <h6 class="text-warning">Mantenha os Registros de Categorias do seus produtos, Cadastre, Pesquise, Atualize e exclua registros de Categoria de Produtos Por esta Tela.</h6>
                </div>
            </div>
            <asp:Panel runat="server" ID="_pnlGridCategoria">
                <div class="row" style="background-color: gainsboro; padding: 5px;">
                    <div class="col-lg-12">
                        <asp:LinkButton ID="_lkNovo" CssClass="btn btn-lg btn-primary" runat="server"><i class="icone-plus"></i> Novo</asp:LinkButton>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12" style="margin-top: 10px;">
                        <fieldset style="border: 2px #808080 solid; border-radius: 5px; padding: 10px; background-color: whitesmoke">
                            <div class="form-row">
                                <div class="form-group col-lg-8">
                                    <label>Perquisar Por</label>
                                    <div class="form-row">
                                        <div class="form-group col-lg-3">
                                            <asp:DropDownList ID="_ddlPesquisar" class="form-control" runat="server">
                                                <asp:ListItem Value="CAT_CODIGOID">Código</asp:ListItem>
                                                <asp:ListItem Value="CAT_DESCRICAO">Categoria</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-lg-8">
                                            <asp:TextBox ID="_edPesquisa" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-1">
                                            <asp:LinkButton ID="_lkPesquisar" runat="server" CssClass="btn btn-success"><i class="icone-search-4"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="_rblOrdernar">Ordenar Por</label>
                                    <div class="form-group col-lg-12">
                                        <asp:RadioButtonList ID="_rblOrdenar" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Value="CAT_CODIGOID" Selected="True">Código</asp:ListItem>
                                            <asp:ListItem Value="CAT_DESCRICAO">Categoria</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView ID="_gridCategorias" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-bordered text-uppercase" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" EmptyDataText="NÃO HA CATEGORIAS REGISTRADAS." OnSelectedIndexChanged="_gridCategorias_SelectedIndexChanged" OnPageIndexChanging="_gridCategorias_PageIndexChanging" OnRowDeleting="_gridCategorias_RowDeleting">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="CODIGO" SortExpression="CODIGO" />
                                <asp:BoundField HeaderText="CATEGORIA" DataField="CATEGORIA" SortExpression="CATEGORIA" />
                                <asp:CommandField HeaderText="EDITAR" ShowSelectButton="True" SelectText="&lt;i class=&quot;btn btn-success icone-pencil&quot;&gt;&lt;/i&gt;" />
                                <asp:CommandField HeaderText="EXCLUIR" ShowDeleteButton="True" DeleteText="&lt;i class=&quot;btn btn-danger icone-trash&quot;&gt;&lt;/i&gt;" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataRowStyle CssClass="alert alert-danger text-uppercase text-center" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>

            <%-- Painel de Edição --%>
            <asp:Panel runat="server" ID="_pnlDetCategoria">
                <div class="row" style="background-color: whitesmoke; margin-top:10px;">
                    <div class="col-lg-12">
                        <asp:LinkButton runat="server" ID="_lkSalvarCat" CssClass="btn btn-success"><i class="icone-floppy-1"></i> Salvar</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="_lkCancelarCat" CssClass="btn btn-primary"><i class="icone-cancel-3"></i> Cancelar</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="_lkConcluirCat" CssClass="btn btn-dark"><i class="icone-check"></i> Concluir</asp:LinkButton>
                    </div>
                </div>
                <div class="row" style="background-color: gainsboro; margin-top:5px;">
                    <div class="col-lg-12 text-center">
                        <h5 class="text-muted">Informações da Categoria</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-row">
                            <div class="form-group col-lg-1">
                                <label for="_edCodigoCat">Id</label>
                                <asp:TextBox ID="_edCodigoCat" runat="server" CssClass="form-control" Enabled="false" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="form-group col-lg-5">
                                <label for="_edCodigoCat">Categoria</label>
                                <asp:TextBox ID="_edCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
