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
        private enum Restriccion
        {
            LONGITUD_MINIMA_CODIGO_BARRAS=3,
            LONGITUD_MINIMA_NOMBRE = 2
        }
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
            basic.Items.Add("Todas");
            listaCategorias = db.CATEGORIA.ToList();
            foreach (CATEGORIA c in listaCategorias)
            {
                this.basic.Items.Add(new ListItem(c.nombre));
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            filtrarProductos();
        }


        private void filtrarProductos()
        {
            if (!string.IsNullOrEmpty(txtCodBarras.Text))
            {
                decimal aux = decimal.Parse(txtCodBarras.Text);

                //GridView1.DataSource = db.PRODUCTO.Where(x => x.cod_barras ==  aux).ToList();
               // GridView1.DataSource = db.PRODUCTO.Where(x => x.cod_barras.ToString().Contains(txtCodBarras.Text)).ToList();
                 //GridView1.DataSource = 
                var consulta = from p in db.PRODUCTO
                               where  p.cod_barras.Trim().Contains(txtCodBarras.Text)
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

        protected void txtCodBarras_TextChanged(object sender, EventArgs e)
        {
            if (txtCodBarras.Text.Length>=(int) Restriccion.LONGITUD_MINIMA_CODIGO_BARRAS)
            {
                filtrarProductos();
            }
        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            if (txtNombre.Text.Length>=(int) Restriccion.LONGITUD_MINIMA_NOMBRE)
            {
                filtrarProductos();
            }
        }

    }
}