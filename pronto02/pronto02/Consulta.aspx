<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="pronto02.Consulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btBuscar">
    <p>
        <asp:TextBox ID="txtCodBarras" runat="server" Width="230px"></asp:TextBox>
        <asp:TextBox ID="txtNombre" runat="server" Width="173px"></asp:TextBox>
        <select id="cbCategoria" runat="server" class="selectpicker show-tick form-control" data-live-search="true"></select>
        <asp:Button ID="btBuscar" runat="server" Text="Buscar" OnClick="btBuscar_Click" />
   </p>        
    </asp:Panel>
        <p>
   </p>
   <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="false" Width="499px" >
            <Columns>
                <asp:BoundField HeaderText ="Codigo de Barras" DataField ="cod_barras" />
                <asp:BoundField HeaderText ="Nombre" DataField ="Nombre" />
                <asp:BoundField HeaderText ="Categoria" DataField ="Categoria.nombre" />
                <asp:BoundField HeaderText ="Costo" DataField ="Precio_costo" />
                <asp:BoundField HeaderText ="Venta" DataField ="Precio_venta" />
                <asp:BoundField HeaderText ="Ganancia" DataField ="Ganancia" />
                <asp:BoundField HeaderText ="Stock" DataField ="Stock" />               
               
            </Columns>
        </asp:GridView>
   </p>
</asp:Content>
