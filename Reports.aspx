<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <asp:Repeater ID="myRepeater" OnItemDataBound="myRepeater_OnItemDataBound" runat="server">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li>
             <asp:LinkButton runat="server" ID="FileName" CommandName="GOTO" OnClick="FileName_Click"> </asp:LinkButton></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul></FooterTemplate>
</asp:Repeater>

</asp:Content>

