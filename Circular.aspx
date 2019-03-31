<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Circular.aspx.cs" Inherits="Circular" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="font-family:Arial">
<asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button ID="Button1" runat="server" Text="Upload"
    OnClick="Button1_Click" />
<br />
<br />
        <div> Circulars </div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    OnRowCommand="GridView1_RowCommand" BackColor="White" 
    BorderColor="#CC9966" BorderStyle="None" 
    BorderWidth="1px" CellPadding="10" AllowSorting="True" OnSorting="GridView1_Sorting">
    <Columns>
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:TemplateField HeaderText="File" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandArgument='<%# Eval("File") %>'
                    CommandName="Download" Text='<%# Eval("File") %>'>
                    </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:BoundField DataField="Type" HeaderText="File Type" />
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
</div>
</asp:Content>

