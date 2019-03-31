<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="EmiCalculator.aspx.cs" Inherits="EmiCalculator" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 35%;
        }
        .auto-style4 {
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 35%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style5 {
            padding: 10px;
            vertical-align: middle;
            background-color: #FFFFFF;
            width: 430px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
    <table cellpadding="0" cellspacing="0" class="auto-style5">
        
        <tr>
            <td class="auto-style4">Loan Amount:</td>
            <td>
                <asp:TextBox ID="txtLoan" class="riskrighttd" runat="server" Width="60%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Interest Rate:</td>
            <td>
                <asp:TextBox ID="txtRate" class="riskrighttd" runat="server" Width="25%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Time (In Year):</td>
            <td>
                <asp:TextBox ID="txtTime" class="riskrighttd" runat="server" Width="25%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btncalculate" cssclass="btn" runat="server" OnClick="btncalculate_Click" Text="Calculate" />
                <asp:Button ID="btnreset" cssclass="btn" runat="server" OnClick="btnreset_Click" Text="Reset" OnLoad="Page_Load" />
            </td>
       
           
           <%-- <td>
                <asp:Button ID="btnreset" cssclass="btn" runat="server" OnClick="btnreset_Click" Text="Reset" />
            </td>--%>
        </tr>
        <tr>
           <td class="auto-style4">Monthly Payment:</td>
            <td>
                <asp:Label ID="lblMonthlyPayment" runat="server" ForeColor="DarkOliveGreen"></asp:Label>
            </td>
        </tr>
        
    </table>
        
       
</asp:Content>