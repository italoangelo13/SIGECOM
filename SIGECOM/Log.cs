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

        public void GravaLog(string tela, string metodo, int tipo, String usuario, string cmd, int status)
        {
            /*
             * CODIGOS DE LOG - TIPO
             * 1 - INSERT
             * 2 - UPDATE
             * 3 - SELECT
             * 4 - DELETE
             * 
             * CODIGOS DE LOG - STATUS
             * 1 - SUCESSO
             * 2 - ERRO
             * */


            BancoDados b = new BancoDados();
            b.Query(@"INSERT INTO log_sistema 
                                    (log_tela, 
                                     log_metodo, 
                                     log_tipo, 
                                     log_comando, 
                                     log_status, 
                                     log_data_cadastro, 
                                     log_usuario) 
                        VALUES     ( ?log_tela, 
                                     ?log_metodo, 
                                     ?log_tipo, 
                                     ?log_comando, 
                                     ?log_status, 
                                     CURRENT_TIMESTAMP, 
                                     ?log_usuario) ");
            b.SetParametro("?log_tela", tela);
            b.SetParametro("?log_metodo", metodo);
            b.SetParametro("?log_tipo", tipo);
            b.SetParametro("?log_comando", cmd);
            b.SetParametro("?log_status", status);
            b.SetParametro("?log_usuario", usuario.ToUpper());

            try
            {
                b.Executar();
            }
            catch (Exception ex)
            {
                GravaCritica("Logs.cs", "GravaLog", ex, "Admin");
            }
        }
    }
}
