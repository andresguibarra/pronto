using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pronto02
{
    public partial class Proveedores : System.Web.UI.Page
    {
        PRONTODBEntities dbo = new PRONTODBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarProveedores();
        }

        private void CargarProveedores()
        {
            List<Proveedor> lista = dbo.Proveedor.ToList();
            foreach (Proveedor p in lista)
            {
                CrearPanel(p.Nombre, p.Direccion, p.Telefono);
            }
        }

        private void CrearPanel(String nombre, String direccion, String telefono)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl div_panel = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl div_heading = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl h3 = new System.Web.UI.HtmlControls.HtmlGenericControl("h3");
            System.Web.UI.HtmlControls.HtmlGenericControl label_nombre = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl div_body = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl label_tel = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl label_dir = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl boton_borrar = new System.Web.UI.HtmlControls.HtmlGenericControl("button");

            boton_borrar.Attributes.Add("ID", "btBorrar");
            boton_borrar.InnerText = "Eliminar";
            boton_borrar.Visible = false;

            label_nombre.Attributes.Add("ID", "lblnombre");
            label_nombre.InnerText = nombre;

            h3.Attributes.Add("Class", "panel-title");
            h3.Controls.Add(label_nombre);

            div_heading.Attributes.Add("Class", "panel-heading");
            div_heading.Controls.Add(h3);

            label_tel.Attributes.Add("ID", "lblTelefono");
            label_tel.InnerText = telefono;

            label_dir.Attributes.Add("ID", "lblDireccion");
            label_dir.InnerText = direccion;

            div_body.Attributes.Add("Class", "panel-body");
            div_body.Controls.Add(label_dir);
            div_body.Controls.Add(label_tel);

            div_panel.Attributes.Add("Class", "panel panel-default");
            div_panel.Controls.Add(div_heading);
            div_panel.Controls.Add(div_body);
            div_panel.Controls.Add(boton_borrar);

            contenedorpaneles.Controls.Add(div_panel);
        }

        protected void btAgregar_Click(object sender, EventArgs e)
        {
            Proveedor p = new Proveedor();
            p.Nombre = txtNombre.Text;
            p.Direccion = txtDireccion.Text;
            p.Telefono = txtTelefono.Text;
            p.CUIT = String.Empty;
            p.Razon_Social = String.Empty;

            dbo.Proveedor.Add(p);
            dbo.SaveChanges();
            Response.Redirect(Request.Url.AbsoluteUri);          
        }


    }
}