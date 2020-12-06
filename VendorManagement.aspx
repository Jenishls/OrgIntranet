<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master"  CodeFile="VendorManagement.aspx.cs" Inherits="VendorManagement" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:Panel ID="Panel2" runat="server">
        <h3>
            
            Vendor Management
            
                <asp:Button ID="Button1" runat="server" Text="+ Add Vendor" CssClass="btn ajs-modal" OnClick="Button1_Click" style="float: right;" />
            
        </h3>
        
            <asp:GridView ID="VendorList" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="10" AllowSorting="True" 
                ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red"
                OnSelectedIndexChanged="VendorList_SelectedIndexChanged" DataKeyNames="Id" OnDataBinding="VendorList_DataBinding"
    OnRowEditing="VendorList_RowEditing" OnRowUpdating="VendorList_RowUpdating"
                >
                <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
               
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:CommandField ShowEditButton="true"/>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowSelectButton="True"  SelectText="View" />
               
            </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" 
        ForeColor="#FFFFCC" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
        HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#330099" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" 
        ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        

    </asp:Panel>

    <script src="js/modal.js"></script>
    </asp:Content>
