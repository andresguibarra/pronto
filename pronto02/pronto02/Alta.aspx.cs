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
        List<CATEGORIA> listaCategorias = new List<CATEGORIA>();
        PRONTODBEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new PRONTODBEntities();
            cargarComboCategoria();
        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            try
            {
                decimal codigo_Barras = decimal.Parse(this.txtCodigoDeBarras.Text);
                string nombreProducto = this.txtNombreProducto.Text;
                CATEGORIA categoria = listaCategorias.Find(x => x.nombre.Equals(this.basic.Value));
                decimal precioCosto;
                decimal ganancia;
                decimal precioVenta = decimal.Parse(this.txtPrecioVenta.Text);
                if (String.IsNullOrEmpty(this.txtPrecioCosto.Text))
                {
                    precioCosto = 0;
                    ganancia = 0;
                }
                else
                {
                    precioCosto = decimal.Parse(this.txtPrecioCosto.Text);
                    ganancia = precioVenta - precioCosto;
                }        
                var producto = new PRODUCTO { cod_barras = codigo_Barras, Nombre = nombreProducto, Stock = 1M, Precio_venta = precioVenta, Precio_costo = precioCosto, CATEGORIA = categoria, Ganancia = ganancia };
                db.PRODUCTO.Add(producto);
                db.SaveChanges();
                this.txtCodigoDeBarras.Text = string.Empty;
                this.txtNombreProducto.Text = string.Empty;
                this.txtPrecioCosto.Text = string.Empty;
                this.txtPrecioVenta.Text = string.Empty;
            }
            catch (Exception ex)
            {
                //("alert('"+ex.Message+"');");
                throw;
            }
            
        }
        private void cargarComboCategoria()
        {
            listaCategorias = db.CATEGORIA.ToList();
            foreach (CATEGORIA c in listaCategorias)
            {
                this.basic.Items.Add(new ListItem(c.nombre));
            }
        }
    }
}