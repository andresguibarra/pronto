using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Medicamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new PRONTODBEntities())
            {
                GridView1.DataSource = db.PRODUCTO.Where(m => m.CATEGORIA.nombre.ToLower().Contains("medicamentos") || m.CATEGORIA.nombre.ToLower().Contains("medicamento")).ToList();
                GridView1.DataBind();
            }
        }
    }
}