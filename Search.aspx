<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" CssClass="branchheader" runat="server" Text="BranchCode"></asp:Label>
    <asp:TextBox ID="TextBox1" CssClass="textboxcss" runat="server" Width="5%"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="Type 'ALL' for all branch's record "></asp:Label>
    <br /><br />
<asp:Button ID="GetFile" CssClass="btn1" runat="server" Text="Search Files" OnClick="GetFile_Click" />
    <asp:Button ID="btnBack" CssClass="btn" runat="server" Text="Back To Page" OnClick="btnBack_Click" />
<br /><br />
<asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" Width="50%">
</asp:GridView>
                     
              
</asp:Content>

