<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="pronto02.ModificarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ModificarProducto.js"></script>
    <script src="Scripts/jquery.numeric.js"></script>
    <link href="Estilos/alta.css" rel="stylesheet" />
    <link href="BootstrapSelect/dist/css/bootstrap-select.css" rel="stylesheet" />
    <script src="BootstrapSelect/dist/js/bootstrap-select.js"></script>
    <div id="contenedor">
        <h1><asp:Label ID="lbTitulo" class="Titulo" runat="server" Text="Modificar Producto"></asp:Label></h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbID" runat="server" Text="ID"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtID" ClientIDMode="Static" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbCodigoBarras" runat="server" Text="Codigo de barras"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtCodigoBarras" ClientIDMode="Static" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbStock" runat="server" Text="Stock"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtStock" ClientIDMode="Static" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbNombre" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtNombre" ClientIDMode="Static" class="form-control" runat="server" Enabled="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbCosto" runat="server" Text="Precio de Costo"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtCosto" ClientIDMode="Static" class="form-control" runat="server" Enabled="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbVenta" runat="server" Text="Precio de Venta"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtVenta" ClientIDMode="Static" class="form-control" runat="server" Enabled="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbMayor" runat="server" Text="Precio por Mayor"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtMayor" ClientIDMode="Static" class="form-control" runat="server" Enabled="true"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:LinkButton ID="btnModificar" runat="server" class="btn btn-default btnModificar" OnClientClick="Confirmar_Modificar();" CausesValidation="False" OnClick="btnModificar_Click">
            <span class="glyphicon glyphicon-floppy-save"></span><span style="margin-left:1em">Modificar</span>
        </asp:LinkButton>
        <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-default btnEliminar" OnClientClick="Confirmar_Eliminar();" CausesValidation="False" OnClick="btnEliminar_Click">
            <span class="glyphicon glyphicon-remove"></span><span style="margin-left:1em">Eliminar</span>
        </asp:LinkButton>
    </div>
</asp:Content>
