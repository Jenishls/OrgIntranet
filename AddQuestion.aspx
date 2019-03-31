<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="AddQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FileUpload ID="FileUpload1" BackColor="Maroon" ForeColor="Violet" CssClass="textboxcss" Width="40%" runat="server" />
    <br />
    <asp:Button ID="btnUpload" CssClass="btn ui-buttonset" runat="server" Text="Upload" OnClick="btnUpload_Click" />
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
</asp:Content>

