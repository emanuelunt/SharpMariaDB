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
                MySqlCommand comando = new MySqlCommand("usp_listado_pr", sqlCon);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("cTexto", MySqlDbType.VarChar).Value=ctexto;
                sqlCon.Open();
                resultado = comando.ExecuteReader();
                tabla.Load(resultado);
                return tabla;
            }
            catch (Exception error)
            {
                throw error;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                    sqlCon.Close();
            }
        }

        public DataTable listado_me()
        {
            MySqlDataReader resultado;
            DataTable tabla = new DataTable();
            MySqlConnection sqlCon = new MySqlConnection();
            try
            {
                sqlCon = (Conexion.getInstacia()).crearConexion();
                MySqlCommand comando = new MySqlCommand("usp_listado_me", sqlCon);
                comando.CommandType = CommandType.StoredProcedure;                
                sqlCon.Open();
                resultado = comando.ExecuteReader();
                tabla.Load(resultado);
                return tabla;
            }
            catch (Exception error)
            {
                throw error;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                    sqlCon.Close();
            }
        }

        public DataTable listado_ca()
        {
            MySqlDataReader resultado;
            DataTable tabla = new DataTable();
            MySqlConnection sqlCon = new MySqlConnection();
            try
            {
                sqlCon = (Conexion.getInstacia()).crearConexion();
                MySqlCommand comando = new MySqlCommand("usp_listado_ca", sqlCon);
                comando.CommandType = CommandType.StoredProcedure;
                sqlCon.Open();
                resultado = comando.ExecuteReader();
                tabla.Load(resultado);
                return tabla;
            }
            catch (Exception error)
            {
                throw error;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                    sqlCon.Close();
            }
        }
    }
}
