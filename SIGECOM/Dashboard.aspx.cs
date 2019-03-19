using System;
using System.Collections.Generic;
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
                _lblUsuario.Text = Session["usuario"].ToString();
            }
        }

        private void VerificaAutenticacao()
        {
            if(String.IsNullOrEmpty(Session["usuario"].ToString())){
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
    }
}