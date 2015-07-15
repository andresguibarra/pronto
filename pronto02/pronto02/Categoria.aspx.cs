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
        List<Vn_Categoria> categorias;
        public List<Vn_Categoria> Categorias
        {
            get
            {
                if (categorias == null)
                {
                    return db.Vn_Categoria.AsNoTracking().ToList();
                }
                return (List<Vn_Categoria>)this.Context.Session["Categorias"];
            }
            set { this.Context.Session["Categorias"] = value; }
        }

        public PRONTODBEntities db
        {
            get
            {
                if (db==null)
                {
                return new PRONTODBEntities();
                   
                }
                return (PRONTODBEntities)this.Context.Session["db"];
            }
            set
            {

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GridView1.DataSource = Categorias;
                GridView1.DataBind();
            }
        }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            using (var db = new PRONTODBEntities())
            {

                //if (!this.IsPostBack)
                //{
                GridView1.DataSource = Categorias;
                GridView1.DataBind();
                //}
            }

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
                using (PRONTODBEntities entities = new PRONTODBEntities())
                {
                    CATEGORIA categoria = entities.CATEGORIA.SingleOrDefault(u => u.id == idCategoria);
                    categoria.nombre = e.NewValues[1].ToString();
                    entities.SaveChanges();
                    GridView1.DataBind();
                }

            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            borrarCategoria(decimal.Parse(e.Keys[0].ToString()));
        }

        private void borrarCategoria(decimal id)
        {

            using (PRONTODBEntities prontoEntities = new PRONTODBEntities())
            {
                CATEGORIA categoria = prontoEntities.CATEGORIA.SingleOrDefault(u => u.id == id);
                prontoEntities.CATEGORIA.Remove(categoria);
                prontoEntities.SaveChanges();
                GridView1.DataBind();
            }
        }
    }
}