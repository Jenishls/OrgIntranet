<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table  cellpadding="0" cellspacing="0" style="vertical-align: top"  >
            <tr>
                <td class="contenthead"><asp:Label ID="lblNewsHeading" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td  class="contentdiv"><div style="margin-left:10px; margin-right:10px;margin-bottom:10px"> <asp:Label ID="lblNewsDate" runat="server" ></asp:Label></div>
     <div style="margin-left:10px"><asp:Label ID="lblNewsContent" runat="server" ></asp:Label></div>
</td>
            </tr>
        </table>
    
    
</asp:Content>

