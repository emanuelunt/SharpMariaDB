using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;

namespace ProcesoGrud.Datos
{
    public class D_Productos
    {
        public DataTable listado_pro(string ctexto)
        {
            MySqlDataReader resultado;
            DataTable tabla = new DataTable();
            MySqlConnection sqlCon = new MySqlConnection();
            try
            {
                sqlCon = (Conexion.getInstacia()).crearConexion();
                MySqlCommand comando = new MySqlCommand("", sqlCon);


            }
            catch (Exception error)
            {
                  throw error
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                    sqlCon.Close();
            }
        }
    }
}
