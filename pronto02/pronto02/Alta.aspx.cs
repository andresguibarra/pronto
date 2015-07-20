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
        #region Propiedades
        public List<CATEGORIA> listaCategorias
        {
            get
            {

                if (HttpContext.Current.Session["listaCategorias"] == null)
                    HttpContext.Current.Session["listaCategorias"] = new List<CATEGORIA>();
                return (List<CATEGORIA>)HttpContext.Current.Session["listaCategorias"];
            }
            set
            {
                HttpContext.Current.Session["listaCategorias"] = value;
            }
        }

        public PRONTODBEntities db
        {
            get
            {
                if (HttpContext.Current.Session["db"] == null)
                {
                    HttpContext.Current.Session["db"] = new PRONTODBEntities();
                }
                return (PRONTODBEntities)HttpContext.Current.Session["db"];
            }
            set
            {
                HttpContext.Current.Session["db"] = value;
            }

        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                cargarComboCategoria();

            }
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
                var producto = new PRODUCTO { cod_barras = codigo_Barras, Nombre = nombreProducto, Stock = 1, Precio_venta = precioVenta, Precio_costo = precioCosto, CATEGORIA = categoria, Ganancia = ganancia };
                db.PRODUCTO.Add(producto);
                db.SaveChanges();
                this.txtCodigoDeBarras.Text = string.Empty;
                this.txtNombreProducto.Text = string.Empty;
                this.txtPrecioCosto.Text = string.Empty;
                this.txtPrecioVenta.Text = string.Empty;
            }
            catch (FormatException)
            {
                string message = "No se han completado todos los campos correctamente.";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + message + "');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + ex.Message + "');", true);

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
        protected void Page_UnLoad(object sender, EventArgs e)
        {
            db.Database.Connection.Close();
        }
    }
}