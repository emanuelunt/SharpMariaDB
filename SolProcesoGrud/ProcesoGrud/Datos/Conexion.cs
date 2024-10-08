﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoGrud.Datos
{
    internal class Conexion
    {
        private string basedeDatos;
        private string servidor;
        private string puerto;
        private string usuario;
        private string password;
        private static Conexion con = null;

        private Conexion() 
        {
            this.basedeDatos = "bd_crud";
            this.servidor = "127.0.0.1";
            this.puerto = "3306";
            this.usuario = "root";
            this.password = "";
        }

        public MySqlConnection crearConexion()
        {
            MySqlConnection cadena = new MySqlConnection();

            try
            {
                //cadena.ConnectionString = "datasource=" + this.servidor + ";port=" + this.puerto + ";username="+this.usuario+
                //    ";password=" + this.clave + ";Database=" + this.basedeDatos;
                cadena.ConnectionString = "Database=" + basedeDatos + "; Data Source=" + servidor + "; User Id=" + usuario + "; Password=" + password + "";

            }
            catch (Exception error)
            {
                cadena = null;                
            }

            return cadena;
        }

        public static Conexion getInstacia()
        {
            if (con == null)
            {
                con = new Conexion();
            }
            return con;
        }
    }
}
