using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Consulta : System.Web.UI.Page
    {
        List<CATEGORIA> listaCategorias = new List<CATEGORIA>();
        PRONTODBEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCodBarras.Focus();
            db = new PRONTODBEntities();
            GridView1.DataSource = db.PRODUCTO.ToList();
            GridView1.DataBind();

            if (!this.IsPostBack)
            {
                cargarComboCategoria();

            }
        }
        private void cargarComboCategoria()
        {
            cbCategoria.Items.Add("Todas");
            listaCategorias = db.CATEGORIA.ToList();
            foreach (CATEGORIA c in listaCategorias)
            {
                this.cbCategoria.Items.Add(new ListItem(c.nombre));
            }
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            filtrarProductos();
        }


        private void filtrarProductos()
        {
            if (!string.IsNullOrEmpty(txtCodBarras.Text))
            {
                decimal aux = decimal.Parse(txtCodBarras.Text);
                GridView1.DataSource = db.PRODUCTO.Where(x => x.cod_barras == aux).ToList();
            }
            else if (!string.IsNullOrEmpty(txtNombre.Text))
            {
                if (!cbCategoria.Value.Equals("Todas"))
                    GridView1.DataSource = db.PRODUCTO.Where(x => x.Nombre.Contains(txtNombre.Text) && x.CATEGORIA.nombre.Equals(cbCategoria.Value)).ToList();
                else
                    GridView1.DataSource = db.PRODUCTO.Where(x => x.Nombre.Contains(txtNombre.Text)).ToList();
            }
            else if (!cbCategoria.Value.Equals("Todas"))
                GridView1.DataSource = db.PRODUCTO.Where(x => x.CATEGORIA.nombre.Equals(cbCategoria.Value)).ToList();
            else
                GridView1.DataSource = db.PRODUCTO.ToList();
            GridView1.DataBind();
        }

    }
}