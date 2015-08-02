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

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarProveedores();
        }

        private void CargarProveedores()
        {

            using (PRONTODBEntities dbo = new PRONTODBEntities())
            {
                List<Proveedor> lista = dbo.Proveedor.ToList();
                foreach (Proveedor p in lista)
                {
                    CrearPanel(p.Nombre, p.Direccion, p.Telefono);
                }
            }

        }

        private void CrearPanel(String nombre, String direccion, String telefono)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl div_content = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl div_panel = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl div_heading = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl h3 = new System.Web.UI.HtmlControls.HtmlGenericControl("h3");
            System.Web.UI.HtmlControls.HtmlGenericControl label_nombre = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl div_body = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl label_tel = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl label_dir = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl boton_borrar = new System.Web.UI.HtmlControls.HtmlGenericControl("button");
            System.Web.UI.HtmlControls.HtmlGenericControl span_icon_tel = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl span_icon_dir = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            System.Web.UI.HtmlControls.HtmlGenericControl div_row1 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl div_row2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl div_content1 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            System.Web.UI.HtmlControls.HtmlGenericControl div_content2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            boton_borrar.Attributes.Add("ID", "btnBorrar");
            boton_borrar.InnerText = "Eliminar";
            boton_borrar.Visible = false;

            label_nombre.Attributes.Add("ID", "lblnombre");
            label_nombre.InnerText = nombre;

            h3.Attributes.Add("Class", "panel-title");
            h3.Controls.Add(label_nombre);

            div_heading.Attributes.Add("Class", "panel-heading");
            div_heading.Controls.Add(h3);

            label_tel.Attributes.Add("ID", "lblTelefono");
            span_icon_tel.Attributes.Add("class", " glyphicon glyphicon-earphone");

            label_tel.InnerText = telefono;

            label_dir.Attributes.Add("ID", "lblDireccion");
            span_icon_dir.Attributes.Add("class", " glyphicon glyphicon-home");
            label_dir.InnerText = direccion;
            
            
            div_body.Attributes.Add("Class", "panel-body");

            div_row1.Attributes.Add("class", "row");
            div_content1.Attributes.Add("class", "col-md-12");
            div_content1.Controls.Add(span_icon_tel);
            div_content1.Controls.Add(label_tel);


            div_row1.Controls.Add(div_content1);

            div_row2.Attributes.Add("class", "row");
            div_content2.Attributes.Add("class", "col-md-12");
            div_content2.Controls.Add(span_icon_dir);
            div_content2.Controls.Add(label_dir);
            div_row2.Controls.Add(div_content2);

            div_body.Controls.Add(div_row2);
            div_body.Controls.Add(div_row1);

            div_panel.Attributes.Add("Class", "panel panel-default panel-contacto");
            div_panel.Controls.Add(div_heading);
            div_panel.Controls.Add(div_body);
            div_panel.Controls.Add(boton_borrar);


            div_content.Attributes.Add("class", "col-md-4");
            div_content.Controls.Add(div_panel);
            contenedorpaneles.Controls.Add(div_content);
        }

        protected void btAgregar_Click(object sender, EventArgs e)
        {
            using (PRONTODBEntities dbo = new PRONTODBEntities())
            {
                Proveedor p = new Proveedor();
                p.Nombre = txtNombre.Text;
                p.Direccion = txtDireccion.Text;
                p.Telefono = txtTelefono.Text;
                p.CUIT = String.Empty;
                p.Razon_Social = String.Empty;

                dbo.Proveedor.Add(p);
                dbo.SaveChanges();
            }

            Response.Redirect(Request.Url.AbsoluteUri);
        }


    }
}