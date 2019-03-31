<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/template.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:Table ID="Table1" runat="server" Font-Bold="True" Target="_blank" Font-Size="Large" Font-Italic="True" ForeColor="Maroon" GridLines="Both">
        <asp:TableHeaderRow CssClass="tablecss">
            <asp:TableHeaderCell Height="20px" HorizontalAlign="Center">
                NCC Manuals
            </asp:TableHeaderCell>
            
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="ListBox1" CssClass="textboxcss" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged1"
                    Width="900px" Height="500px" Font-Italic="true" ForeColor="Blue" Font-Size="Medium" AutoPostBack="true" runat="server">
                    
                </asp:ListBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
    </asp:Table>
    
</asp:Content>

