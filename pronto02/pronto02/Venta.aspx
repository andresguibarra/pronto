<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="pronto02.Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src ="Scripts/Venta.js"></script>
    <p>
        Codigo de Barras Nombre Unidades Precio<br />
        <asp:TextBox ID="txtCodigoBarras" runat="server" ClientIDMode="Static"></asp:TextBox>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtUnidades" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
        <asp:LinkButton ID="btnAgregar" class="btnAgregar" runat="server" ClientIDMode="Static" Text="Agregar" OnClick="Button1_Click" />
        <asp:LinkButton ID="btnBuscar" class="btnBuscar" runat="server" OnClick="btBuscar_Click" style="display:none">Buscar</asp:LinkButton>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" ClientIDMode="Static">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
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
    </p>
    <p>
        Total:<asp:TextBox ID="txtTotal" runat="server" Enabled="False" ClientIDMode="Static"></asp:TextBox>
    </p>
</asp:Content>
