using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.Sql;
using System.Data.SqlClient;

namespace pronto02
{
    public static class ABMProducto
    {
        private static void test()
        {
            Producto p1 = new Producto(100, "Manaos", new Categoria(2, "Gaseosa"), 3.50m, 4.00m, 100m);
            Producto p2 = new Producto(101, "Pitusas", new Categoria(3, "Galletitas"), 1.00m, 5.50m, 50m);
            Producto p3 = new Producto(102, "Coca-Cola", new Categoria(2, "Gaseosa"), 3.75m, 6.00m, 75m);
            //DarBaja(p1);
            //DarAlta(p2);
            Modificar(p3, p1);
        }

        public static void main()
        {
            test();
        }
        private static SqlConnection AbrirDB()
        {
            SqlConnection conex = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conex.Open();
            return conex;
        }
        public static int DarAlta(Producto p)
        {
            SqlConnection conex = AbrirDB();
            String sentencia = "INSERT INTO PRODUCTO VALUES (" + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.CodigoDeBarras) + ", '" + p.Nombre + "', " + p.Categoria.ID + ", " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Precio_Costo) + ", " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Precio_Venta) + ", " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Ganancia) + ", " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Stock) + ")";
            SqlCommand comando = new SqlCommand(sentencia, conex);
            return comando.ExecuteNonQuery();
        }

        public static int DarBaja(Producto p)
        {
            SqlConnection conex = AbrirDB();
            String sentencia = "DELETE FROM PRODUCTO WHERE cod_barras = " + p.CodigoDeBarras;
            SqlCommand comando = new SqlCommand(sentencia, conex);
            return comando.ExecuteNonQuery();
        }

        public static int Modificar(Producto viejo, Producto p)
        {
            SqlConnection conex = AbrirDB();
            String sentencia = "UPDATE PRODUCTO SET cod_barras = " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.CodigoDeBarras) + ", nombre = '" + p.Nombre + "', categoria = " + p.Categoria.ID + ", precio_costo = " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Precio_Costo) + ", precio_venta = " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Precio_Venta) + ", ganancia = " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Ganancia) + ", stock = " + string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.0}", p.Stock) + " WHERE cod_barras = " + viejo.CodigoDeBarras;
            SqlCommand comando = new SqlCommand(sentencia, conex);
            return comando.ExecuteNonQuery();
        }
    }
}