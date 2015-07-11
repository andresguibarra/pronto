using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //cargarComboCategoria();
        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            try
            {
                decimal codigo_Barras = decimal.Parse(this.txtCodigoDeBarras.Text);
                string nombreProducto = this.txtNombreProducto.Text;
                //Categoria categoria = this.basic.SelectedIndex;
                decimal precioCosto = decimal.Parse(this.txtPrecioCosto.Text);
                decimal precioVenta = decimal.Parse(this.txtPrecioVenta.Text);
                using (var db = new PRONTODBEntities())
                {
                    CATEGORIA categoria = new CATEGORIA { nombre= "Gaseosa", id = 2, };
                    var producto = new PRODUCTO {cod_barras= 1023213,Nombre= "AndresHola", Stock= 1M, Precio_venta = 10M, Precio_costo= 20M, CATEGORIA = categoria, Ganancia = 10M};
                    db.PRODUCTO.Add(producto);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                //("alert('"+ex.Message+"');");
                throw;
            }
            
        }
        private void cargarComboCategoria()
        {
            //List<Categoria> listaCategorias = new List<Categoria>();
            //
            //foreach (Categoria categoria in listaCategorias)
            //{
            //    this.basic.Items.Add(new ListItem(categoria.Nombre, categoria.ID.ToString()));
            //}
        }
    }
}