<%@ Page Language="C#" MasterPageFile="~/Main.master"  AutoEventWireup="true" CodeFile="ViewVendor.aspx.cs" Inherits="ViewVendor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:Panel ID="Panel2" runat="server">
        <h3>
            Vendor Name
        </h3>
        </asp:Panel>

    <asp:GridView ID="BillsView" runat="server"
        AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="10" AllowSorting="True" 
                ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red"
                OnSelectedIndexChanged="BillsView_SelectedIndexChanged" DataKeyNames="Id" OnDataBinding="BillsView_DataBinding"
    OnRowEditing="BillsView_RowEditing1" OnRowUpdating="BillsView_RowUpdating"
        >
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="Bill" HeaderText="Bill" />
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

    </asp:Content>
