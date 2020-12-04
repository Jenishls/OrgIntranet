<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master"  CodeFile="VendorManagement.aspx.cs" Inherits="VendorManagement" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:Panel ID="Panel2" runat="server">
        <h3>
            <asp:Table ID="Table1" runat="server">

            </asp:Table>
            Vendor Management
            <a href ="AddVendor.aspx">
                <asp:Button ID="Button1" runat="server" Text="+ Add Vendor" CssClass="btn ajs-modal" style="float: right;" />
            </a>
        </h3>
        
            <asp:GridView ID="VendorList" runat="server">
            </asp:GridView>
        

    </asp:Panel>

    <script src="js/modal.js"></script>
    </asp:Content>
