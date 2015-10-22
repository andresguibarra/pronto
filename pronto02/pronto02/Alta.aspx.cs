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
        //public List<CATEGORIA> listaCategorias
        //{
        //    get
        //    {

        //        if (HttpContext.Current.Session["listaCategorias"] == null)
        //            HttpContext.Current.Session["listaCategorias"] = new List<CATEGORIA>();
        //        return (List<CATEGORIA>)HttpContext.Current.Session["listaCategorias"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["listaCategorias"] = value;
        //    }
        //}

        //public PRONTODBEntities db
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session["db"] == null)
        //        {
        //            HttpContext.Current.Session["db"] = new PRONTODBEntities();
        //        }
        //        return (PRONTODBEntities)HttpContext.Current.Session["db"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["db"] = value;
        //    }

        //}
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
                using (var db = new PRONTODBEntities())
                {
                    string nombreProducto = this.txtNombreProducto.Text;
                    CATEGORIA categoria = db.CATEGORIA.SingleOrDefault(x => x.nombre.Equals(this.basic.Value));
                    decimal precioCosto;
                    decimal ganancia;
                    decimal precioVenta = decimal.Parse(this.txtPrecioVenta.Text);
                    decimal precioMayor;
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
                    if (String.IsNullOrEmpty(this.txtPrecioMayor.Text))
                    {
                        precioMayor = 0M;
                    }
                    else
                    {
                        precioMayor = decimal.Parse(this.txtPrecioMayor.Text);
                    }
                    var producto = new PRODUCTO { cod_barras = this.txtCodigoDeBarras.Text, Nombre = nombreProducto, Stock = 1, Precio_venta = precioVenta, Precio_costo = precioCosto, CATEGORIA = categoria, Ganancia = ganancia, Precio_Mayor = precioMayor };
                    db.PRODUCTO.Add(producto);
                    db.SaveChanges();
                }
                vaciarCampos();
            }
            catch (FormatException)
            {
                string message = "No se han completado todos los campos correctamente.";
                Utilidades.Alert(this, message);
            }
            catch (Exception ex)
            {
                Utilidades.Alert(this, ex.Message);

            }

        }
        private void vaciarCampos()
        {

            this.txtCodigoDeBarras.Text = string.Empty;
            this.txtNombreProducto.Text = string.Empty;
            this.txtPrecioCosto.Text = string.Empty;
            this.txtPrecioVenta.Text = string.Empty;
            this.txtPrecioMayor.Text = string.Empty;
        }
        private void cargarComboCategoria()
        {
            using (var db = new PRONTODBEntities())
            {
                //listaCategorias = db.CATEGORIA.ToList();
                foreach (CATEGORIA c in db.CATEGORIA.ToList())
                {
                    this.basic.Items.Add(new ListItem(c.nombre));
                }
            }
        }
        
    }
}