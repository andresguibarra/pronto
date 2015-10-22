using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pronto02
{
    public class Comercial
    {
       
        public static void AgregarAVenta(decimal id)
        {
            AgregarAVenta(new PRONTODBEntities(), id);
        }
        public static void AgregarAVenta(PRONTODBEntities db, decimal id) 
        {

             PRODUCTO producto = db.PRODUCTO.SingleOrDefault(x => x.Id == id);

             Linea_Venta lineaVenta = new Linea_Venta();
             lineaVenta.Nombre_Producto = producto.Nombre;
             lineaVenta.Precio = (float) producto.Precio_venta;
             lineaVenta.Unidades = 1; //Agrego una unidad;
             Venta.listaVentas.Add(lineaVenta);
        }
    }
}