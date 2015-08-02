<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="pronto02.Proveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/proveedores.css" rel="stylesheet" />
    <div class="contenedor-proveedores">
    <div id="contenedorpaneles" class="row" runat="server"></div>
    <%--Acá se agregaran los nuevos contactos--%>

    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default panel-agregar">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-2">
                            <span class="icono glyphicon glyphicon-user"></span>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox ID="txtNombre" placeholder="Nombre Contacto" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <span class=" icono glyphicon glyphicon-home"></span>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox ID="txtDireccion" placeholder="Direccion" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <span class="icono glyphicon glyphicon-earphone"></span>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox ID="txtTelefono" placeholder="Teléfono" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-md-offset-3">
                            <asp:LinkButton ID="btAgregar" CssClass="btn btn-default" runat="server" OnClick="btAgregar_Click">
                    <span class="glyphicon glyphicon-floppy-saved"></span><span style="margin-left:1em">Guardar</span></asp:LinkButton>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
        </div>
</asp:Content>
