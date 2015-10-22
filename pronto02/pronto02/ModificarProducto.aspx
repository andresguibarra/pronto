<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="pronto02.ModificarProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/actualizarStock.css" rel="stylesheet" />
    <link href="Estilos/modificarProducto.css" rel="stylesheet" />
    <link href="BootstrapSelect/dist/css/bootstrap-select.css" rel="stylesheet" />
    <link href="Estilos/bootstrap-switch.css" rel="stylesheet" />
    <script src="Scripts/ModificarProducto.js"></script>
    <script src="Scripts/jquery.numeric.js"></script>
    <script src="BootstrapSelect/dist/js/bootstrap-select.js"></script>
    <script src="Scripts/bootstrap-switch.js"></script>
    <div id="contenedor">
        <h1>
            <asp:Label ID="lbTitulo" class="Titulo" runat="server" Text="Modificar Producto"></asp:Label></h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbID" runat="server" Text="ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtID" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbCodigoBarras" runat="server" Text="Codigo de barras"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCodigoBarras" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbStock" runat="server" Text="Stock"></asp:Label>
                </td>
                <td>

                    <asp:LinkButton ID="btnArriba" CssClass="btn btn-default" OnClientClick="incrementarStock(); return false;" ClientIDMode="Static" runat="server"><span class="glyphicon glyphicon-arrow-up"></span></asp:LinkButton>
                    <asp:TextBox ID="txtStock" CssClass="form-control txtStock" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="btnAbajo" CssClass="btn btn-default" OnClientClick="disminuirStock(); return false;" ClientIDMode="Static" runat="server"><span class="glyphicon glyphicon-arrow-down"></span></asp:LinkButton>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbModificarCampos" runat="server" Text="Modificar Campos"></asp:Label>
                </td>
                <td>
                    <input type="checkbox" name="my-checkbox" checked>
                    <%--<label class="radio-inline">
                        <input id="modificarSi" type="radio" name="mod">Si</label>
                    <label class="radio-inline">
                        <input id="modificarNo" type="radio" name="mod">No</label>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbNombre" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbCosto" runat="server" Text="Precio de Costo"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCosto" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbVenta" runat="server" Text="Precio de Venta"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtVenta" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbMayor" runat="server" Text="Precio por Mayor"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMayor" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="btnModificar" runat="server" class="btn btn-default btnModificar" OnClientClick="Confirmar_Modificar();" CausesValidation="False" OnClick="btnModificar_Click">
            <span class="glyphicon glyphicon-floppy-save"></span><span style="margin-left:1em">Modificar</span>
                    </asp:LinkButton>

                </td>
                <td>
                    <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-default btnEliminar" OnClientClick="Confirmar_Eliminar();" CausesValidation="False" OnClick="btnEliminar_Click">
            <span class="glyphicon glyphicon-remove"></span><span style="margin-left:1em">Eliminar</span>
                    </asp:LinkButton>

                </td>
            </tr>
        </table>


    </div>
</asp:Content>
