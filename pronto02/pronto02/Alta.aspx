﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="pronto02.Alta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script src="Scripts/alta.js"></script>
    <link href="Estilos/alta.css" rel="stylesheet" />
    <link href="BootstrapSelect/dist/css/bootstrap-select.css" rel="stylesheet" />
    <script src="BootstrapSelect/dist/js/bootstrap-select.js"></script>
    <div id="contenedor">
        <h1>
            <asp:Label ID="Label1" class="label label-primary" runat="server" Text="Alta"></asp:Label></h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Codigo de barras"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtCodigoDeBarras" class="form-control" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblCodigoBarraWarning" class="label label-danger" runat="server" Text="Debe ingresar solo numeros"></asp:Label>
                </td>
            </tr>



            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Nombre Producto"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombreProducto" class="form-control" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label8" class="label label-danger" runat="server" Text="Debe ingresar numeros (0-9) o letras (a-z)"></asp:Label>
                </td>
            </tr>


            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Categoria"></asp:Label>
                </td>
                <td>
                    <select id="basic" runat="server" class="selectpicker show-tick form-control" data-live-search="true">
                        <option>Gaseosas</option>
                        <option>Cigarrillos</option>
                        <option>Bebidas Alcoholicas</option>
                        <option>Artículos de limpieza</option>
                        <option>Librería</option>
                        <option>Golosinas</option>
                        <option>Perfumería</option>
                        <%--<option data-subtext="option subtext">bull</option>
                        <option class="get-class" disabled>ox</option>
                        <optgroup label="test" data-subtext="optgroup subtext">
                            <option>ASD</option>
                            <option selected>Bla</option>
                            <option>Ble</option>
                        </optgroup>--%>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Precio Costo"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ClientIDMode="Static" ID="txtPrecioCosto" class="form-control" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblPrecioCostoWarning" ClientIDMode="Static" class="label label-danger" runat="server" Text="Debe ingresarse numeros"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Precio Venta"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPrecioVenta" class="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblPrecioVentaWarning" class="label label-danger" runat="server" Text="Debe ingresarse numeros"></asp:Label>

                </td>
            </tr>


        </table>
        <asp:Button ID="btnAlta" class="btn btn-default" OnClick="btnAlta_Click" runat="server" Text="Dar Alta" />


        <div class="col-lg-6">
            <div class="input-group">
                <asp:TextBox ID="txtPorcentaje" class="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="btnCalcular" class="btn btn-default" ClientIDMode="Static" OnClientClick="calcularPrecio(); return false;" runat="server" Text="Calcular" />
                </span>
            </div>
            <!-- /input-group -->
        </div>
        <!-- /.col-lg-6 -->
    </div>
</asp:Content>