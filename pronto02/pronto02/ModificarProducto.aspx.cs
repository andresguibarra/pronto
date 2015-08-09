using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class ModificarProducto : System.Web.UI.Page
    {
        #region Propiedades
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
        int ID = 0;
        string Cod = null;
        PRODUCTO p
        {
            get
            {
                if (HttpContext.Current.Session["p"] == null)
                {
                    HttpContext.Current.Session["p"] = new PRONTODBEntities();
                }
                return (PRODUCTO)HttpContext.Current.Session["p"];
            }
            set
            {
                HttpContext.Current.Session["p"] = value;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                try
                {
                    cargarProducto();
                }
                catch (ArgumentNullException)
                {
                    string message = "Faltan argumentos de entrada para acceder a esta pagina.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + message + "');", true);
                    btnEliminar.Visible = false;
                    btnModificar.Visible = false;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + ex.Message + "');", true);
                    btnEliminar.Visible = false;
                    btnModificar.Visible = false;
                }
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string confirm_value = Request.Form["confirm_value"];
            if (confirm_value == "Modificar")
            {
                p.Nombre = txtNombre.Text;
                p.Precio_costo = decimal.Parse(txtCosto.Text);
                p.Precio_venta = decimal.Parse(txtVenta.Text);
                p.Precio_Mayor = decimal.Parse(txtMayor.Text);
                db.SaveChanges();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string confirm_value = Request.Form["confirm_value"];
            if (confirm_value == "Borrar")
            {
                db.PRODUCTO.Remove(p);
                db.SaveChanges();
                p = null;
                vaciarCampos();
            }
        }

        private void cargarProducto()
        {
            var consulta = from p in db.PRODUCTO select p;
            if (Request.QueryString["CodBarras"] != null)
            {
                Cod = Request.QueryString["CodBarras"];
                if (Request.QueryString["ID"] != null)
                {
                    ID = int.Parse(Request.QueryString["ID"]);
                    consulta = from p in db.PRODUCTO
                               where p.Id == ID || p.cod_barras.Equals(Cod)
                               select p;
                }
                else
                {
                    consulta = from p in db.PRODUCTO
                               where p.cod_barras.Equals(Cod)
                               select p;
                }
            }
            else if (Request.QueryString["ID"] != null)
            {
                ID = int.Parse(Request.QueryString["ID"]);
                consulta = from p in db.PRODUCTO
                           where p.Id == ID
                           select p;
            }
            if (consulta.ToList().Count == 1)
            {
                p = consulta.First();
                txtID.Text = p.Id.ToString();
                txtCodigoBarras.Text = p.cod_barras.ToString();
                txtStock.Text = p.Stock.ToString();
                txtNombre.Text = p.Nombre;
                txtCosto.Text = p.Precio_costo.ToString();
                txtVenta.Text = p.Precio_venta.ToString();
                txtMayor.Text = p.Precio_Mayor.ToString();
            }
            else
            {
                string message = "Valores incorrectos. No se devolvio ningun resultado o hay mas de un resultado posible.";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + message + "');", true);
                btnEliminar.Visible = false;
                btnModificar.Visible = false;
            }
        }

        private void vaciarCampos()
        {
            txtID.Text = null;
            txtCodigoBarras.Text = null;
            txtStock.Text = null;
            txtNombre.Text = null;
            txtCosto.Text = null;
            txtVenta.Text = null;
            txtMayor.Text = null;
        }
    }
}