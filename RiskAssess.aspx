<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RiskAssess.aspx.cs" Inherits="RiskAssess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #FFFFFF;
            font-style: italic;
            background-color: #3333CC;
        }
        .auto-style3 {
            font-size: xx-large;
            color:white;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contentdiv">
    <div style="background-image:url(/Background/OpRiskAssess.jpg); height:500px;  border-radius: 15px;">
    <h3 class="auto-style2"> &nbsp;&nbsp;&nbsp; Matrix on the determination of Operation Risk Profile of the Branch </h3>
    <table cellpadding="5px" cellspacing="20px">
        <tr>
            <td>
    <a href="RiskOp.aspx"> 
    <asp:Label ID="lblCreate" runat="server" Text="Create Operation Risk Profile of the Branch" CssClass="auto-style3"></asp:Label>
    </a>
                </td>
    </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
    <a href="OpRiskApp.aspx"> 
    <asp:Label ID="lblApprove" runat="server" Text="Pending/Approve Operation Risk Profile of the Branch" CssClass="auto-style3"></asp:Label>
    </a>
                </td>
            </tr>
    </table>
        </div>
        </div>
</asp:Content>

