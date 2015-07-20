<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActualizarStock.aspx.cs" Inherits="pronto02.ActualizarStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="false">

     <Columns>
         <asp:ButtonField ButtonType="Button" Text="Botón" />

         <asp:ButtonField ButtonType="Button" Text="Botón" />
         <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
         <asp:BoundField HeaderText="Codigo de Barras" DataField="cod_barras" />
       <%--  <asp:BoundField HeaderText="Categoria" DataField="Categoria" /> --%>
         
     </Columns>
    </asp:GridView>
</asp:Content>
