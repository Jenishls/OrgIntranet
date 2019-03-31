<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AdminTracefile.aspx.cs" Inherits="AdminTracefile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="TextBox1" CssClass="textboxcss" Width="25%" runat="server"></asp:TextBox>
    <asp:Button ID="btnDelte" CssClass="btn" runat="server" Text="Delete" OnClick="btnDelete_Click" />
    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
</asp:Content>

