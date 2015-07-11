<%@ Page Title="Modificacion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modificacion.aspx.cs" Inherits="pronto02.Modificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container-fluid">

                <div id="contenedor">
                    <h1>
                        <asp:Label ID="Label1" class="titulo" runat="server" Text="Modificacion"></asp:Label></h1>
                    <div style="overflow-y: scroll">
                        <asp:GridView ID="gv_productos" runat="server" CssClass="table table-hover table-striped"  DataSourceID="sql_productos" AutoGenerateColumns="False">
                            <Columns>

                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:SqlDataSource ID="sql_productos" runat="server"></asp:SqlDataSource>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


