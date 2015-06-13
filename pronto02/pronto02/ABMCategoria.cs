using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.Sql;

namespace pronto02
{
    public static class ABMCategoria
    {
        private static void test()
        {
            Categoria c1 = new Categoria(1, "Galletitas");
            Categoria c2 = new Categoria(2, "Gaseosa");
            Categoria c3 = new Categoria(3, "Chocolate");
            //DarAlta(c1);
            //DarAlta(c2);
            //DarAlta(c3);
            //DarBaja(c1);
            Modificar(c3, c1);
            //DarAlta(c3);
        }

        public static void main(){
            test();
        }
        private static SqlConnection AbrirDB()
        {
            SqlConnection conex = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conex.Open();
            return conex;
        }

        public static int DarAlta(Categoria c)
        {
            SqlConnection conex = AbrirDB();
            String sentencia = "INSERT INTO CATEGORIA VALUES ('" + c.Nombre + "')";
            SqlCommand comando = new SqlCommand(sentencia, conex);
            return comando.ExecuteNonQuery();
        }

        public static int DarBaja(Categoria c)
        {
            SqlConnection conex = AbrirDB();
            String sentencia = "DELETE FROM CATEGORIA WHERE id =" + c.ID;
            SqlCommand comando = new SqlCommand(sentencia, conex);
            return comando.ExecuteNonQuery();
        }

        public static int Modificar(Categoria vieja, Categoria c)
        {
            SqlConnection conex = AbrirDB();
            String sentencia = "UPDATE CATEGORIA SET nombre = '" + c.Nombre + "' WHERE id =" + vieja.ID;
            SqlCommand comando = new SqlCommand(sentencia, conex);
            return comando.ExecuteNonQuery();
        }
    }
}