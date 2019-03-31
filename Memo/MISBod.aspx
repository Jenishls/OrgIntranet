<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MISBod.aspx.cs" Inherits="Memo_MISBod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="">
    <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" runat="server">
        <asp:ListItem>Weekly</asp:ListItem>
        <asp:ListItem>Fortnight</asp:ListItem>
        <asp:ListItem>Monthly</asp:ListItem>
        <asp:ListItem>Quarterly</asp:ListItem>
    </asp:RadioButtonList>
        </div>
    <div>
        <asp:Panel ID="Panel1" runat="server">
            <table class="tablecss">
                <tr>
                    <td>

                    </td>
                    <td>

                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

