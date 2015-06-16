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
            decimal codigo_Barras = decimal.Parse(this.txtCodigoDeBarras.Text);
            string nombreProducto = this.txtNombreProducto.Text;
            //Categoria categoria = this.basic.SelectedIndex;
            decimal precioCosto = decimal.Parse(this.txtPrecioCosto.Text);
            decimal precioVenta = decimal.Parse(this.txtPrecioVenta.Text);
            Producto producto = new Producto(codigo_Barras,nombreProducto,new Categoria(1,"Ejemplo"),precioCosto,precioVenta,decimal.MinValue);
            ABMProducto.DarAlta(producto);
        }
        private void cargarComboCategoria()
        {
            List<Categoria> listaCategorias = new List<Categoria>();
            
            foreach (Categoria categoria in listaCategorias)
            {
                this.basic.Items.Add(new ListItem(categoria.Nombre, categoria.ID.ToString()));
            }
        }
    }
}