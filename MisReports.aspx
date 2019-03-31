<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MisReports.aspx.cs" Inherits="MisReports" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .auto-style2 {
            font-size: xx-small;
        }
    </style>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <strong><asp:Label ID="lblrpt" runat="server" Text="Select Report"></asp:Label></strong>
    <asp:DropDownList ID="ddlrpt" CssClass="dropboxcss" runat="server" OnSelectedIndexChanged="ddlrpt_SelectedIndexChanged" AutoPostBack="true" Width="25%">
        <asp:ListItem>Approved/Pending All</asp:ListItem>
        <asp:ListItem>Pending-Department Wise</asp:ListItem>
    </asp:DropDownList>
    <asp:Panel ID="pnlALL" runat="server">
    
    
     <strong>BranchCode</strong>
    <asp:TextBox ID="TextBox1" CssClass="textboxcss" runat="server" Width="20%"></asp:TextBox> (Type 'ALL' for all branch's record )
        <br />
        <br />
     <strong>Start Date</strong>
     <asp:TextBox ID="TextBox2" TextMode="Date" CssClass="textboxcss" runat="server" Width="25%"></asp:TextBox>
     <strong>End Date</strong>
     <asp:TextBox ID="TextBox3" TextMode="Date" CssClass="textboxcss" runat="server" Width="25%"></asp:TextBox>
     <br />
<asp:Button ID="GetFile" CssClass="btn1" runat="server" Text="Approved List" OnClick="GetFile_Click" />
    <asp:Button ID="GetPending" CssClass="btn1" runat="server" Text="Pending List" OnClick="GetPending_Click" />
    <asp:Button ID="btnExportToExcel" CssClass="btn" runat="server" Text="Export to excel" OnClick="btnExportToExcel_Click" />
    <asp:Button ID="btnBack" CssClass="btn" runat="server" Text="Back To Page" OnClick="btnBack_Click" />
        
<br /><br />
<asp:GridView ID="GridView1"  runat="server" Width="50%" BackColor="#DEBA84" 
    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
    CellPadding="3" CellSpacing="2">
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" 
        ForeColor="White" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" 
        ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FFF1D4" />
    <SortedAscendingHeaderStyle BackColor="#B95C30" />
    <SortedDescendingCellStyle BackColor="#F1E5CE" />
    <SortedDescendingHeaderStyle BackColor="#93451F" /> 
    <PagerSettings NextPageText=">" />
</asp:GridView>
          </asp:Panel>
    <asp:Panel ID="pnlDeptPending" runat="server">
        <asp:DropDownList ID="ddldept" CssClass="dropboxcss" runat="server" OnSelectedIndexChanged="ddldept_SelectedIndexChanged" AutoPostBack="true" Width="25%"></asp:DropDownList>
    <br />
        <asp:Button ID="btnExcel" CssClass="btn" runat="server" Text="Export to excel" OnClick="btnExcel_Click" />
        <asp:GridView ID="GridView2"  runat="server" Width="50%" BackColor="#DEBA84" 
    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" GridLines="Both"
    CellPadding="3" CellSpacing="2">
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" 
        ForeColor="White" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" 
        ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FFF1D4" />
    <SortedAscendingHeaderStyle BackColor="#B95C30" />
    <SortedDescendingCellStyle BackColor="#F1E5CE" />
    <SortedDescendingHeaderStyle BackColor="#93451F" /> 
    <PagerSettings NextPageText=">" />
</asp:GridView>
    </asp:Panel>       
</asp:Content>