<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:DropDownList ID="ddlSubject" CssClass="dropboxcss" runat="server">
            <asp:ListItem Text="AML/CFT/KYC" Value="1"></asp:ListItem>
            <asp:ListItem Text="General Banking" Value="12"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>

    </div>
</asp:Content>

