<%@ Page Title="Actualizar Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActualizarStock.aspx.cs" Inherits="pronto02.ActualizarStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/actualizarStock.css" rel="stylesheet" />
    <script src="Scripts/actualizarStock.js"></script>
    <link href="Estilos/General.css" rel="stylesheet" />
     <link href="BootstrapSelect/dist/css/bootstrap-select.css" rel="stylesheet" />
    <script src="BootstrapSelect/dist/js/bootstrap-select.js"></script>
    <div class="contenedor-actualizar">
        <div class="row">
            <div class="col-md-3">
                <asp:TextBox ID="txtCodBarras" ClientIDMode="Static" placeholder="Código de Barras" CssClass="form-control" runat="server"></asp:TextBox>
            </div>  
            <div class="col-md-3">
                <asp:TextBox ID="txtNombre" ClientIDMode="Static" placeholder="Nombre del producto" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2 ">
                <div style="max-width: 280px;">
                    <select id="basic" runat="server" class="selectpicker show-tick form-control" data-live-search="true"></select>
                </div>
            </div>
            <div class="col-md-1">
                <asp:LinkButton ID="btnBuscar" OnClick="btnBuscar_Click" CssClass="btn btn-default btnBuscar" ClientIDMode="Static" runat="server"><span>Buscar </span></asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9">
                <asp:GridView ID="GridView1" DataKeyNames="Id" runat="server" CssClass="table table-hover table-striped"
                    OnRowUpdating="GridView1_RowUpdating" AutoGenerateColumns="false">

                    <Columns>
                        <asp:TemplateField ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnArriba" CssClass="btn btn-default" OnClick="btnArriba_Click" CommandName="Update" ClientIDMode="Static" runat="server"><span class="glyphicon glyphicon-arrow-up"></span></asp:LinkButton>
                                <asp:TextBox ID="txtStock" CssClass="form-control txtStock" Text='<%# Bind("Stock") %>' runat="server"></asp:TextBox>
                                <asp:LinkButton ID="btnAbajo" OnClick="btnAbajo_Click" CssClass="btn btn-default" CommandName="Update" ClientIDMode="Static" runat="server"><span class="glyphicon glyphicon-arrow-down"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Id" ControlStyle-CssClass="id" DataField="Id" />
                        <asp:BoundField HeaderText="Codigo de Barras" DataField="cod_barras" />
                    </Columns>
                </asp:GridView>
                <asp:TextBox runat="server" ID="txtOculto" Style="display: none;"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>
