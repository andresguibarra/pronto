using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Categoria1 : System.Web.UI.Page
    {
        public List<Vn_Categoria> listaCategorias
        {
            get
            {
                return db.Vn_Categoria.ToList();
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

        //PRONTODBEntities db = new PRONTODBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = listaCategorias;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (e.NewValues[1] != null)
            {
                decimal idCategoria = Convert.ToInt32(e.Keys[0]);
                CATEGORIA categoria = db.CATEGORIA.SingleOrDefault(u => u.id == idCategoria);
                categoria.nombre = e.NewValues[1].ToString();
                db.SaveChanges();
                GridView1.DataBind();
                Response.Redirect(Request.Url.AbsoluteUri);
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Borrar")
            {

                string id = e.Keys[0].ToString();
                borrarCategoria(decimal.Parse(id));
            }
        }

        private void borrarCategoria(decimal id)
        {
            CATEGORIA categoria = db.CATEGORIA.SingleOrDefault(u => u.id == id);
            db.CATEGORIA.Remove(categoria);
            db.SaveChanges();
            GridView1.DataBind();
            //hacer un alert
            Response.Redirect(Request.Url.AbsoluteUri);

        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {
            db.Database.Connection.Close();
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            CATEGORIA categoria = new CATEGORIA();
            categoria.nombre = txtNombreAgregar.Text;

            db.CATEGORIA.Add(categoria);
            db.SaveChanges();
            GridView1.DataBind();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}