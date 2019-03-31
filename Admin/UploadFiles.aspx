<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="UploadFiles.aspx.cs" Inherits="Admin_UploadFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <link href="../css/buttons.bootstrap4.css" rel="stylesheet" />
    <script lang="javascript">
        function ConfirmSave() {
            var Ok = confirm('Are you sure want to upload?');
            if (Ok)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h4 class="contenthead">Upload: Manuals/Policies/Product Paper/Guidelines</h4>
    <hr class="h_divider" />
    <div>
        
        <div style="margin-left:5px">
    <asp:DropDownList ID="ddlType" runat="server" CssClass="dropboxcss" ForeColor="Maroon" Width="20%" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
        <asp:ListItem>Manuals</asp:ListItem>
        <asp:ListItem>Policies</asp:ListItem>
        <asp:ListItem>ProductPaper</asp:ListItem>
        <asp:ListItem>Guidelines</asp:ListItem>
    </asp:DropDownList>
            </div>
        </div>
    <hr class="h_divider" />
    
    <asp:FileUpload ID="FileUpload1" BackColor="Blue" ForeColor="Violet" CssClass="textboxcss" Width="40%" runat="server" />
    <br />
    <asp:Button ID="btnUpload" CssClass="btn btn-primary" runat="server" Text="Upload" OnClick="btnUpload_Click" />
    <asp:Label ID="lblMsg" runat="server" ForeColor="Green" Font-Size="Large" Text=""></asp:Label>
    <hr class="h_divider" />
    <div>
<asp:GridView ID="gvFiles" CellPadding="3" runat="server" CssClass="tablecss" Width="850px" AutoGenerateColumns="False" OnSelectedIndexChanged="gvFiles_SelectedIndexChanged" DataKeyNames="Name"

 BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" EmptyDataText="There is no record to show" OnRowDeleting="gvFiles_RowDeleting" OnRowDeleted="gvFiles_RowDeleted"> 

<Columns>
    <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> 

                    </ItemTemplate></asp:TemplateField>
<asp:BoundField DataField="Name" HeaderText="Particulars" />
<asp:BoundField DataField="CreationTime" HeaderText="Date" />

    <asp:CommandField HeaderText="Action" ShowHeader="True" ControlStyle-ForeColor="Blue" ShowDeleteButton="True" DeleteText="Delete" />
    
</Columns>

    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

    <HeaderStyle BackColor="#A55129" Font-Bold="true" ForeColor="White" />

    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />

    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />

    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />

    <SortedAscendingCellStyle BackColor="#FFF1D4" />

    <SortedAscendingHeaderStyle BackColor="#B95C30" />

    <SortedDescendingCellStyle BackColor="#F1E5CE" />

    <SortedDescendingHeaderStyle BackColor="#93451F" />

</asp:GridView>

</div>
</asp:Content>

