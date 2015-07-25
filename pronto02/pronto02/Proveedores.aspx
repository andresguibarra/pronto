<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="pronto02.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div ID="contenedorpaneles" runat="server"></div>
    <div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Nombre: <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox></h3>
    </div>
    <div class="panel-body">
        Direccion: <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
        Telefono: <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
    </div>
    <asp:LinkButton ID="btAgregar" runat="server" OnClick="btAgregar_Click">Agregar</asp:LinkButton>
  </div>
</asp:Content>
