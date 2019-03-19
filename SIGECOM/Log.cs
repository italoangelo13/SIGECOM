using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGECOM
{
    class Log
    {

        internal void GravaCritica(string tela, string metodo, Exception erro, String usuario)
        {
            BancoDados b = new BancoDados();
            b.Query(@"INSERT INTO critica_processamento
            ( 
                        cri_data_hora, 
                        cri_tela, 
                        cri_metodo, 
                        cri_erro, 
                        cri_usuario 
            ) 
            VALUES 
            ( 
                        CURRENT_TIMESTAMP, 
                        ?cri_tela, 
                        ?cri_metodo, 
                        ?cri_erro, 
                        ?cri_usuario 
            )");
            b.SetParametro("?cri_tela", tela);
            b.SetParametro("?cri_metodo", metodo);
            b.SetParametro("?cri_erro", erro.Message);
            b.SetParametro("?cri_usuario", usuario.ToUpper());

            try
            {
                b.Executar();
            }
            catch (Exception ex)
            {
               
            }
        }
    }
}
