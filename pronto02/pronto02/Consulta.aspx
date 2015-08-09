<%@ Page Title="Consulta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="pronto02.Consulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="BootstrapSelect/dist/css/bootstrap-select.css" rel="stylesheet" />
    <script src="BootstrapSelect/dist/js/bootstrap-select.js"></script>
    <link href="Estilos/consulta.css" rel="stylesheet" />
    <script src="Scripts/consulta.js"></script>
    <div class="contenedor-consulta">

        <div class="row">

            <div class="col-md-4">
                <asp:TextBox ID="txtCodBarras" runat="server" ClientIDMode="Static" placeholder="Buscar por Código de barras" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" placeholder="Buscar por Nombre" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3 ">
                <div style="max-width: 280px;">
                    <select id="basic" runat="server" class="selectpicker show-tick form-control" data-live-search="true"></select>
                </div>
            </div>
            <div class="col-md-2">
                <asp:LinkButton ID="btnBuscar" ClientIDMode="Static" runat="server" CssClass="btn btn-default btnBuscar" OnClick="btnBuscar_Click">Buscar</asp:LinkButton>
            </div>
        </div>
        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Codigo de Barras" DataField="cod_barras" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Categoria" DataField="Categoria.nombre" />
                        <asp:BoundField HeaderText="Costo" DataField="Precio_costo" />
                        <asp:BoundField HeaderText="Precio Venta" DataField="Precio_venta" />
                        <asp:BoundField HeaderText="Ganancia" DataField="Ganancia" />
                        <asp:BoundField HeaderText="Stock" DataField="Stock" />
                        <asp:BoundField HeaderText="Precio por Mayor" DataField="Precio_Mayor" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnModificar" runat="server" Text="Modificar" OnClientClick="modificar(this);"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField ItemStyle-CssClass="id" HeaderStyle-CssClass="id" DataField="Id" />

                    </Columns>
                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnBuscar" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
