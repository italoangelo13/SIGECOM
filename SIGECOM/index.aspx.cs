using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIGECOM
{
    public partial class index : System.Web.UI.Page
    {
        
        private void Toast(string msg)
        {
            string g = Guid.NewGuid().ToString("N");
            if (!ClientScript.IsStartupScriptRegistered(g))
                ClientScript.RegisterStartupScript(typeof(string), g, "<script>M.toast({html: '"+ msg +"'})</script>");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _edSenha.Attributes.Add("onKeyPress", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('_btnAcessar').click();return false;}} else {return true}; ");
            }
        }

        protected void _btnAcessar_Click(object sender, EventArgs e)
        {
            var usuario = _edUsuario.Text.ToString();
            var senha = _edSenha.Text.ToString();

            if (String.IsNullOrEmpty(usuario))
            {
                Toast("Favor Informar o Usuario.");
                _edUsuario.Focus();
                return;
            }

            if (String.IsNullOrEmpty(senha))
            {
                Toast("Favor Informar Senha.");
                _edSenha.Focus();
                return;
            }


            if (usuario.ToUpper().Equals("ADMIN") && senha.Equals("sigecom*2019"))
            {
                Session["usuario"] = "ADMIN";
                Session["codUsuario"] = 0;
                Server.Transfer("Dashboard.aspx");
            }
            else
            {

                BancoDados b = new BancoDados();
                b.Query(@"SELECT *
                            FROM   USUARIO where USU_USUARIO = ?USU_USUARIO and USU_SENHA = ?USU_SENHA");
                b.SetParametro("?USU_USUARIO", usuario);
                b.SetParametro("?USU_SENHA", FormsAuthentication.HashPasswordForStoringInConfigFile(senha, "md5"));
                DataTable dt = b.ExecutarDataTable();
                if (dt.Rows.Count > 0)
                {
                    Session["usuario"] = dt.Rows[0]["USU_USUARIO"].ToString().ToUpper();
                    Session["codUsuario"] = int.Parse(dt.Rows[0]["USU_CODIGOID"].ToString().ToUpper());
                    Server.Transfer("Dashboard.aspx");
                }
                else
                {
                    
                    Toast("Usuario Invalido. <br> Tente Novamente!");
                    _edUsuario.Focus();
                    return;
                }
            }
        }
    }
}