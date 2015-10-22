<%@ Page Title="Faltantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Faltantes.aspx.cs" Inherits="pronto02.Faltantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenedor">
          <h1>
            <asp:Label ID="Label1" class="titulo" runat="server" Text="Stock"></asp:Label>
          </h1>
         <select id="basic" runat="server" class="selectpicker show-tick form-control" data-live-search="true"></select>
        <asp:LinkButton ID="btnBuscar" ClientIDMode="Static" runat="server" CssClass="btn btn-default btnBuscar" OnClick="ItemSelected_Changed">Buscar</asp:LinkButton>
        <asp:GridView ID="gvPrioridades" runat="server"  CssClass="table table-hover table-striped" Width="100%" AutoGenerateColumns="False">
            <%--DataKeyNames="Codigo_Barras, Producto, Stock, Estado"--%>
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="link_update" CssClass="grid-link" runat="server"><span class="glyphicon glyphicon-floppy-save"></span></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CodigoBarras">
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("cod_barras") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stock">
                    <ItemTemplate>
                        <asp:Label ID="lblStock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="Nombre"  />--%>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
