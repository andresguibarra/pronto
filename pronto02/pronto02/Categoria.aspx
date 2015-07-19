<%@ Page Title="Categoria" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="pronto02.Categoria1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/categoria.js"></script>
    <div class="contenedor">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Categoria, Nombre, Cantidad" CssClass="table table-hover table-striped" Width="100%"
            OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" EnableViewState="false"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating"
            AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="link_update" CssClass="grid-link" runat="server" CausesValidation="True" CommandName="Update"><span class="glyphicon glyphicon-floppy-save"></span></asp:LinkButton>
                        <asp:LinkButton ID="link_cancel" runat="server" CssClass="grid-link" CausesValidation="False" CommandName="Cancel"><span class="glyphicon glyphicon-floppy-remove"></span></asp:LinkButton>
                        <asp:LinkButton ID="link_delete" runat="server" CssClass="grid-link" OnClientClick="Confirm();" CausesValidation="False" CommandName="Delete"><span class="glyphicon glyphicon-trash" style="color:red"></span></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="link_edit" runat="server" CssClass="grid-link" CausesValidation="False" CommandName="Edit"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id">

                    <ItemTemplate>
                        <asp:Label ID="txtId" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre de Categoria">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="Nombre"  />--%>
            </Columns>
        </asp:GridView>
            
            <div class="input-group campoCalcular">
                <span class="input-group-btn">
                <asp:LinkButton ID="Agregar" CssClass="btn btn-default" OnClick="Agregar_Click" runat="server">Agregar</asp:LinkButton>
                </span>
                <asp:TextBox ID="txtNombreAgregar" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    </div>

</asp:Content>
