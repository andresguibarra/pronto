using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Faltantes : System.Web.UI.Page
    {
        #region Propiedades
        public List<PRIORIDAD> listaPrioridad
        {
            get
            {
                if (HttpContext.Current.Session["prioridades"] == null)
                {
                    HttpContext.Current.Session["prioridades"] = new PRONTODBEntities();
                }
                return (List<PRIORIDAD>)HttpContext.Current.Session["prioridades"];
            }
            set
            {
                HttpContext.Current.Session["prioridades"] = value;
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
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
                cargarPrioridades();
        }

        private void cargarPrioridades()
        {
            listaPrioridad = db.PRIORIDAD.ToList();
            foreach (PRIORIDAD pri in listaPrioridad)
            {
                this.basic.Items.Add(pri.Nombre);
            }
        }

        private void mostrarPrioridades()
        {
            PRIORIDAD seleccionada = listaPrioridad.Find(x => x.Nombre == basic.Value);
            List<PRODUCTO> listaProductos = db.PRODUCTO.Where(x => x.IdPrioridad == seleccionada.Id).ToList();
            List<EstadoProducto> listaEstados = new List<EstadoProducto>();
            foreach (PRODUCTO p in listaProductos)
            {
                EstadoProducto ep = new EstadoProducto(p.Nombre, Convert.ToInt32(p.Stock),Convert.ToInt32(p.cod_barras), seleccionada.cantidad_minima, seleccionada.cantidad_media);
                listaEstados.Add(ep);
            }
            gvPrioridades.DataSource = listaEstados;
            gvPrioridades.DataBind();
        }

        protected void ItemSelected_Changed(object sender, EventArgs e)
        {
            mostrarPrioridades();
        }
    }
}