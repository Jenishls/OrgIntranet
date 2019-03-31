<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="HRCircular.aspx.cs" Inherits="HRCircular" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<asp:Button ID="btnGetFiles" CssClass="btn" Text="View Circular" runat="server" onclick="GetFiles" />
<asp:GridView ID="gvFiles" CellPadding="3" runat="server" AutoGenerateColumns="False"
 BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
    <AlternatingRowStyle BackColor="#DCDCDC" />
<Columns>
    <asp:TemplateField HeaderText="S.No"> <ItemTemplate>
        <%# Container.DataItemIndex+1 %>
                                          </ItemTemplate>

    </asp:TemplateField>
    
<asp:BoundField DataField="Text"  HeaderText= "Circulars" />
     
</Columns>

    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
<HeaderStyle BackColor="#000084" Font-Bold="true" ForeColor="White" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#0000A9" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>
</div>
</asp:Content>

