<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="FTPSite.aspx.cs" Inherits="FTPSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
            background-color: #222222;
            color:white;
            border-radius:10px;
            font-family:Arial;
            text-align:center;
            padding:20px;
            /*background-image: url('Background/00608.jpg');*/
        }
        .auto-style3 {
            width: 235px;
            text-align:left;
        }
        .auto-style4 {
            width: 211px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h3>Trouble Ticket</h3>
    </div>
    <table class="auto-style2" cellspacing="10px">
        <tr>
            <td class="auto-style3">BranchCode</td>
            <td>Realated To</td>
            <td class="auto-style4">Aspect Solution From</td>
            <td>Priority</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:DropDownList ID="ddlBranch" CssClass="dropboxcss" Width="80%" runat="server">
                   <asp:ListItem>Main Branch</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="ddlRelated" CssClass="dropboxcss" runat="server">
                    <asp:ListItem>IT Department</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="ddlSolution" CssClass="dropboxcss" runat="server">
                    <asp:ListItem>Network</asp:ListItem>
                    <asp:ListItem>Hardware</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="ddlPriority" CssClass="dropboxcss" runat="server">
                    <asp:ListItem>High</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <%--<tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>--%>
        <tr>
            <td class="auto-style3">Full Description of Problem</td>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:TextBox ID="txtDesc" CssClass="textboxcss" runat="server" TextMode="MultiLine" MaxLength="500" Width="231px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>

