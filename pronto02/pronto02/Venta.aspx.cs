using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Venta : System.Web.UI.Page
    {
        PRONTODBEntities db = new PRONTODBEntities();
        public List<Linea_Venta> listaVentas
        {
            get
            {
               if(HttpContext.Current.Session["listaVentas"] == null)
               {
                   HttpContext.Current.Session["listaVentas"] = new List<Linea_Venta>();
               }
               return (List<Linea_Venta>)HttpContext.Current.Session["listaVentas"];
            }
            set
            {
                HttpContext.Current.Session["listaVentas"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = listaVentas;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            int unidades;
            float precio;
            if (int.TryParse(txtUnidades.Text, out unidades) && float.TryParse(txtPrecio.Text.Replace(',','.'), out precio))
            {
                Linea_Venta lv = new Linea_Venta(nombre, unidades, precio);
                listaVentas.Add(lv);
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                listaVentas.RemoveAt(e.RowIndex);
                Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            var consulta = from p in db.PRODUCTO
                           where p.cod_barras == txtCodigoBarras.Text
                           select p;
            if (consulta.ToList().Count > 0)
            {
                PRODUCTO pr = consulta.First();
                txtNombre.Text = pr.Nombre;
                txtPrecio.Text = pr.Precio_venta.ToString();
                if(String.IsNullOrEmpty(txtUnidades.Text))
                    txtUnidades.Text = "1";
                Button1_Click(this, e);
            }
        }
    }
}