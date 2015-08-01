<%@ Page Title="Faltantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Faltantes.aspx.cs" Inherits="pronto02.Faltantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="contenedor">
        <asp:GridView ID="gvPrioridades" runat="server" DataKeyNames="Id" CssClass="table table-hover table-striped" Width="100%"
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
                        <asp:Label ID="txtId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
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

                <asp:TemplateField HeaderText="Cantidad Minima">
                    <ItemTemplate>
                        <asp:Label ID="lblCantidadMinima" runat="server" Text='<%# Bind("Cantidad_Minima") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad Media">
                    <ItemTemplate>
                        <asp:Label ID="lblCantidadMedia" runat="server" Text='<%# Bind("Cantidad_Media") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="Nombre"  />--%>
            </Columns>
        </asp:GridView>



        <div class="">

             <asp:GridView ID="gvFaltantes" runat="server" DataKeyNames="Id" CssClass="table table-hover table-striped" Width="100%"
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
                        <asp:Label ID="txtId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
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

                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </div>
</asp:Content>
