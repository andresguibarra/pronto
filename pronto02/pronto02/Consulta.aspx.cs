using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Consulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (PRONTODBEntities db = new PRONTODBEntities())
            {
                GridView1.DataSource = db.PRODUCTO.ToList();
                GridView1.DataBind();

            }

            if (!this.IsPostBack)
            {
                cargarComboCategoria();

            }
        }
        private void cargarComboCategoria()
        {
            using (PRONTODBEntities db = new PRONTODBEntities())
            {
                basic.Items.Add("Todas");
                foreach (CATEGORIA c in db.CATEGORIA.ToList())
                {
                    this.basic.Items.Add(new ListItem(c.nombre));
                }
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            filtrarProductos();
        }


        private void filtrarProductos()
        {
            using (PRONTODBEntities db = new PRONTODBEntities())
            {

                if (!string.IsNullOrEmpty(txtCodBarras.Text))
                {
                    var consulta = from p in db.PRODUCTO
                                   where p.cod_barras.Trim().Contains(txtCodBarras.Text)
                                   select p;
                    GridView1.DataSource = consulta.ToList();
                }
                else if (!string.IsNullOrEmpty(txtNombre.Text))
                {
                    if (!basic.Value.Equals("Todas"))
                        GridView1.DataSource = db.PRODUCTO.Where(x => x.Nombre.Contains(txtNombre.Text) && x.CATEGORIA.nombre.Equals(basic.Value)).ToList();
                    else
                        GridView1.DataSource = db.PRODUCTO.Where(x => x.Nombre.Contains(txtNombre.Text)).ToList();
                }
                else if (!basic.Value.Equals("Todas"))
                    GridView1.DataSource = db.PRODUCTO.Where(x => x.CATEGORIA.nombre.Equals(basic.Value)).ToList();
                else
                    GridView1.DataSource = db.PRODUCTO.ToList();
                GridView1.DataBind();
            }
        }



    }
}