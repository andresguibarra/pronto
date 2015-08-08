<%@ Page Title="Venta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="pronto02.Venta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/Venta.js"></script>
    <link href="Estilos/venta.css" rel="stylesheet" />
    <div class="contenedor-venta">
        <div class="row">
            <div class="col-md-3">
                <asp:TextBox ID="txtCodigoBarras" AutoComplete="off" CssClass="form-control" placeholder="Código de Barras" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtNombre" AutoComplete="off" CssClass="form-control" placeholder="Nombre de Producto" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-1">
                <span class="subtitulo">Unidades</span>
                <asp:TextBox ID="txtUnidades" AutoComplete="off" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-1">
                <span class="subtitulo">Precio </span>
                <asp:TextBox ID="txtPrecio" AutoComplete="off" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-1">
                <asp:LinkButton ID="btnAgregar" class="btnAgregar btn btn-default" runat="server" ClientIDMode="Static" Text="Agregar" OnClick="btnAgregar_Click" />
            </div>
            <asp:LinkButton ID="btnBuscar" class="btnBuscar" runat="server" OnClick="btBuscar_Click" Style="display: none">Buscar</asp:LinkButton>
        </div>
        <div class="row">
            <div class="col-md-9">
                <asp:GridView ID="GridView1" CssClass="table table-hover table-striped grilla" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" ClientIDMode="Static">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:LinkButton ID="link_edit" runat="server" CssClass="btnEliminar" CausesValidation="False" CommandName="Delete"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombre_producto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Unidades">
                            <ItemTemplate>
                                <asp:Label ID="lblUnidades" runat="server" Text='<%# Bind("unidades") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <ItemTemplate>
                                <asp:Label ID="lblPrecio" runat="server" Text='<%# Bind("precio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subtotal">
                            <ItemTemplate>
                                <asp:Label ID="lblSubtotal" runat="server" Text='<%# Bind("subtotal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-6">
                <span style="position: absolute; transform:translateY(30%); font-weight:700">Total</span>
                <asp:TextBox ID="txtTotal" CssClass="form-control" Style="margin-left: 5em;" runat="server" Enabled="False" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>
