using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class ActualizarStock : System.Web.UI.Page
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            filtrarProductos();
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
        int GetColumnIndexByName(GridViewRow row, string columnName)
        {
            int columnIndex = 0;
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.ContainingField is BoundField)
                    if (((BoundField)cell.ContainingField).DataField.Equals(columnName))
                        break;
                columnIndex++; // keep adding 1 while we don't have the correct name
            }
            return columnIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (e.NewValues[0] != null)
            {
                using (var db = new PRONTODBEntities())
                {
                    decimal id = Convert.ToInt32(e.Keys[e.Keys.Count - 1]);
                    PRODUCTO producto = db.PRODUCTO.SingleOrDefault(u => u.Id == id);
                    if (this.txtOculto.Text=="btnArriba")
                    {
                        producto.Stock = decimal.Parse(e.NewValues[0].ToString()) + 1;

                    }
                    else 
                    {
                        producto.Stock = decimal.Parse(e.NewValues[0].ToString()) - 1;
                    }
                    db.SaveChanges();
                    GridView1.DataBind();
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }

        protected void btnArriba_Click(object sender, EventArgs e)
        {

            this.txtOculto.Text = "btnArriba";
        }

        protected void btnAbajo_Click(object sender, EventArgs e)
        {
            this.txtOculto.Text = "btnAbajo";
        }
    }
}