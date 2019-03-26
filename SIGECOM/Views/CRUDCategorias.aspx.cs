using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIGECOM.Views
{
    public partial class CRUDCategorias : System.Web.UI.Page
    {
        Log log = new Log();
        string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Session["usuario"].ToString().ToUpper();
            if (!IsPostBack)
            {
                
                atualizaGridCategoria();
            }
            
        }

        private void showToast(string msg)
        {
            string g = Guid.NewGuid().ToString("N");
            if (!ClientScript.IsStartupScriptRegistered(g))
                ClientScript.RegisterStartupScript(typeof(string), g, "<script>alert('" + msg + "')</script>");
        }

        protected void atualizaGridCategoria()
        {
            BancoDados b = new BancoDados();
            string query = @"SELECT cat_codigoid  AS CODIGO, 
                                   cat_descricao AS CATEGORIA 
                            FROM   categorias where 1=1 ";

            if(!String.IsNullOrEmpty(_edPesquisa.Text)){
                if (_ddlPesquisar.SelectedIndex == 0)
                {
                    query += " and cat_codigoid = " + _edPesquisa;
                }
                else
                {
                    query += " and cat_descricao like '%" + _edPesquisa + "%'";
                }
            }

            query += " order by " + _rblOrdenar.SelectedValue + " asc";

            b.Query(query);
            try
            {
                _gridCategorias.DataSource = b.ExecutarDataTable();
                _gridCategorias.DataBind();
                _gridCategorias.Visible = true;
                log.GravaLog("CRUDCategorias.aspx", "atualizaGridCategoria", 3, usuario, query, 1);
            }
            catch(Exception ex)
            {
                _gridCategorias.Visible = false;
                log.GravaLog("CRUDCategorias.aspx", "atualizaGridCategoria", 3, usuario, query, 2);
                log.GravaCritica("CRUDCategorias.aspx", "atualizaGridCategoria", ex, usuario);
                showToast("Não foi possivel Carregar os dados da tabela. <br> Consulte o Relatório de Criticas.");
                return;
            }
            

        }

        protected void _gridCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            _pnlGridCategoria.Visible = false;
            _pnlDetCategoria.Visible = true;
            _edCodigoCat.Text = Server.HtmlDecode(_gridCategorias.SelectedRow.Cells[0].Text);
            BancoDados b = new BancoDados();
           string query = @"SELECT cat_codigoid  AS CODIGO, 
                                   cat_descricao AS CATEGORIA 
                            FROM   categorias where cat_codigoid = ?cat_codigoid";
           b.Query(query);
            b.SetParametro("?cat_codigoid", _edCodigoCat.Text);
            try
            {
                DataTable dt = b.ExecutarDataTable();
                if (dt.Rows.Count > 0)
                {
                    _edCategoria.Text = dt.Rows[0]["CATEGORIA"].ToString().ToUpper();
                }
                log.GravaLog("CRUDCategorias.aspx", "_gridCategorias_SelectedIndexChanged", 3, usuario, query, 1);
            }
            catch (Exception ex)
            {
                log.GravaLog("CRUDCategorias.aspx", "_gridCategorias_SelectedIndexChanged", 3, usuario, query, 2);
                log.GravaCritica("CRUDCategorias.aspx", "_gridCategorias_SelectedIndexChanged", ex, usuario);
            }
            
        }

        protected void _gridCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            atualizaGridCategoria();
            if (e.NewPageIndex >= 0)
            {
                _gridCategorias.PageIndex = e.NewPageIndex;
                _gridCategorias.DataBind();
            }
        }

       

        protected void _gridCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int linha = e.RowIndex;
            string id = _gridCategorias.Rows[linha].Cells[0].Text;
            BancoDados b = new BancoDados();
            string query = @"DELETE FROM CATEGORIAS where cat_codigoid = ?cat_codigoid";
            b.Query(query);
            b.SetParametro("?cat_codigoid", id);
            try
            {
                b.Executar();
                atualizaGridCategoria();
                showToast("Registro Excluido com Sucesso.");
                log.GravaLog("CRUDCategorias.aspx", "_gridCategorias_RowDeleting", 4, usuario, query, 1);
            }
            catch (Exception ex)
            {
                showToast("Não é Possivel excluir este registro pois já esta sendo usado.");
                log.GravaLog("CRUDCategorias.aspx", "_gridCategorias_RowDeleting", 4, usuario, query, 2);
                log.GravaCritica("CRUDCategorias.aspx", "_gridCategorias_RowDeleting", ex, usuario);
            }
        }

    }
}