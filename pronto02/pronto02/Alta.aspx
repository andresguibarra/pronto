<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="Alta.aspx.cs"  %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  


        <h1><asp:Label ID="Label1" class="label label-primary" runat="server" Text="Alta"></asp:Label></h1>
        <div>
            <table>


                <tr>
                    <td>
                        <asp:Label ID="Label2"  runat="server" Text="Codigo de barras"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label7" class="label label-danger" runat="server" Text="Debe ingresar solo numeros"></asp:Label>
                    </td>
                </tr>



                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Nombre Producto"></asp:Label>
                    </td>
                    <td>&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;<asp:Label ID="Label8" class="label label-danger" runat="server" Text="Debe ingresar numeros (0-9) o letras (a-z)"></asp:Label>
                    </td>
                </tr>


                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Categoria"></asp:Label>
                    </td>
                    <td>&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                    </td>
                </tr>



                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Precio Costo"></asp:Label>
                    </td>
                    <td>&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label13" class="label label-danger" runat="server" Text="Debe ingresarse numeros"></asp:Label>
                        &nbsp;
                    </td>
                </tr>

                
                    <td></td>
                
                <td>
                
                    </td>

                    </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Precio Venta"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label11" class="label label-danger" runat="server" Text="Debe ingresarse numeros"></asp:Label>

                    </td>
                </tr>


            </table>
            <%--<asp:Button />--%>
            <asp:Button  ID="Button1" class="btn btn-default" runat="server" Text="Dar Alta"  />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Calcular" />
        </div>
    </div>
    </asp:Content>

