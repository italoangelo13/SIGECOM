using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIGECOM
{
    public partial class Dashboard : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            VerificaAutenticacao();
            if (!IsPostBack)
            {
                VerificaEmpresa();
                _lblUsuario.Text = Session["usuario"].ToString();
            }
        }

        private void showToast(string msg)
        {
            string g = Guid.NewGuid().ToString("N");
            if (!ClientScript.IsStartupScriptRegistered(g))
                ClientScript.RegisterStartupScript(typeof(string), g, "<script>M.toast({html: '" + msg + "'})</script>");
        }

        private void VerificaEmpresa()
        {
            BancoDados b = new BancoDados();
            b.Query("SELECT * FROM empresa");
            DataTable dt = b.ExecutarDataTable();
            if (dt.Rows.Count == 0)
            {
                _pnlmodalCadEmpresa.Visible = true;
            }
            else
            {
                _pnlmodalCadEmpresa.Visible = false;
            }
        }


        private void VerificaAutenticacao()
        {
            try
            {
                if (String.IsNullOrEmpty(Session["usuario"].ToString()))
                {
                    Desconecta();
                }
            }
            catch
            {
                Desconecta();
            }
            
        }

        protected void _lkLogout_Click(object sender, EventArgs e)
        {
           Desconecta();
        }

        private void Desconecta()
        {
            Session.Clear();
            Response.Redirect("index.aspx");
        }

        protected void _btnSalvar_Click(object sender, EventArgs e)
        {
            Log l = new Log();
            if (String.IsNullOrEmpty(_edNomeFantasia.Text))
            {
                showToast("Nome Fantasia é um campo obrigatório.");
                _edNomeFantasia.Focus();
                return;
            }

            if (String.IsNullOrEmpty(_edProprietario.Text))
            {
                showToast("Proprietário é um campo obrigatório.");
                _edProprietario.Focus();
                return;
            }

            DateTime dataAbertura = new DateTime();

            try{
                dataAbertura = DateTime.Parse(_edDataAbertura.Text);
            }
            catch{
            }


            BancoDados b = new BancoDados();
            b.Query(@"INSERT INTO EMPRESA
            ( 
                        emp_nome_fant, 
                        emp_razao_social, 
                        emp_cnpj, 
                        emp_endereco, 
                        emp_tel1, 
                        emp_tel2, 
                        emp_fax, 
                        emp_data_abertura, 
                        emp_nome_prop, 
                        emp_tel_prop, 
                        emp_cpf_prop 
            ) 
            VALUES 
            ( 
                        ?emp_nome_fant, 
                        ?emp_razao_social, 
                        ?emp_cnpj, 
                        ?emp_endereco, 
                        ?emp_tel1, 
                        ?emp_tel2, 
                        ?emp_fax, 
                        ?emp_data_abertura, 
                        ?emp_nome_prop, 
                        ?emp_tel_prop, 
                        ?emp_cpf_prop 
            )");
            b.SetParametro("?emp_nome_fant",_edNomeFantasia.Text);
            b.SetParametro("?emp_razao_social", _edRazaoSocial.Text);
            b.SetParametro("?emp_cnpj", _edcnpj.Text);
            b.SetParametro("?emp_endereco", _edEndereco.Text);
            b.SetParametro("?emp_tel1", _edTel1.Text);
            b.SetParametro("?emp_tel2", _edTel2.Text);
            b.SetParametro("?emp_fax", _edFax.Text);
            b.SetParametro("?emp_data_abertura", dataAbertura);
            b.SetParametro("?emp_nome_prop", _edProprietario.Text);
            b.SetParametro("?emp_tel_prop", _edTelProp.Text);
            b.SetParametro("?emp_cpf_prop", _edCpfProp.Text);

            try
            {
                b.Executar();
                showToast("Dados Empresariais Salvos com sucesso!");
                _pnlmodalCadEmpresa.Visible = false;
            }
            catch (Exception ex)
            {
                l.GravaCritica("Dashboard.aspx","_btnSalvar_Click",ex,Session["usuario"].ToString());
                showToast("Não foi possivel salvar os Dados Empresariais! <br> Consulte o Relatorio de Críticas para saber qual foi o erro.");
                return;
            }

        }
    }
}