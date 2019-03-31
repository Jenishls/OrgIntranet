<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #FF3300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1 class="auto-style2"> &nbsp; </h1>
    <h1 class="auto-style2"> Congratulation !!! Data Inserted Successfully.</h1>
    <asp:Button ID="btnback" class="btn1" runat="server" Text="Back To Page" OnClick="btnback_Click" />
</asp:Content>

