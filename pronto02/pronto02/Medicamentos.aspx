<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medicamentos.aspx.cs" Inherits="pronto02.Medicamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/medicamentos.js"></script>
    <link href="Estilos/medicamentos.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtNombre.ClientID%>').bind("input",function (e) { 
                $("#<%=GridView1.ClientID%> tr:has(td)").hide();
                var iCounter = 0;
                var sSearchTerm = $('#<%=txtNombre.ClientID%>').val();
                if (sSearchTerm.length == 0) {
                    $("#<%=GridView1.ClientID%> tr:has(td)").show();
            return false;
        }
                //Iterate through all the td.
                $("#<%=GridView1.ClientID%> tr:has(td)").children().each(function () {
                    var cellText = $(this).text().toLowerCase();
                    //Check if data matches
                    if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) {
                        $(this).parent().show();
                        iCounter++;
                        return true;
                    }
                });
                e.preventDefault();

            })

        })
    </script>
    <div class="contenedor-medicamentos">
        <div class="row">
            <div class="col-md-10">
                <asp:TextBox runat="server" AutoComplete="off" ClientIDMode="Static" ID="txtNombre" CssClass="form-control" placeholder="Nombre Medicamento"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Codigo de Barras" DataField="cod_barras" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Categoria" DataField="Categoria.nombre" />
                        <asp:TemplateField HeaderText="Precio Unidad" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Label ID="lblPrecioVenta" runat="server" Text='<%# Bind("Precio_venta") %>'></asp:Label>
                                <asp:LinkButton runat="server" OnClientClick="SetPrecio(this);" ClientIDMode="Static" CssClass="btn btn-default">
                        <span>
                            Seleccionar
                        </span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio Blister" ItemStyle-Width="100px">
                            <ItemTemplate>

                                <asp:Label ID="lblPrecioMayor" runat="server" Text='<%# Bind("Precio_Mayor") %>'></asp:Label>
                                <asp:LinkButton runat="server" OnClientClick="SetPrecio(this);" ClientIDMode="Static" CssClass="btn btn-default">
                        <span>
                            Seleccionar
                        </span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
