<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="contenthead">NCC Bank Manuals</h2>
    <hr class="h_divider" />
    <div>
        <asp:GridView ID="gvFiles" CellPadding="4" runat="server" Width="850px" AutoGenerateColumns="False" OnSelectedIndexChanged="gvFiles_SelectedIndexChanged" DataKeyNames="Name"
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">

            <Columns>
                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Particulars" />
                <asp:BoundField DataField="CreationTime" HeaderText="Date" />
                <asp:CommandField HeaderText="" ShowHeader="True" ControlStyle-ForeColor="Blue" ShowSelectButton="True" SelectText="View">
                    <ControlStyle ForeColor="Blue"></ControlStyle>
                </asp:CommandField>

            </Columns>

            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />

            <HeaderStyle BackColor="#003399" Font-Bold="true" ForeColor="#CCCCFF" />

            <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />

            <RowStyle BackColor="White" ForeColor="#003399" />

            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />

            <SortedAscendingCellStyle BackColor="#EDF6F6" />

            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />

            <SortedDescendingCellStyle BackColor="#D6DFDF" />

            <SortedDescendingHeaderStyle BackColor="#002876" />

        </asp:GridView>

    </div>
</asp:Content>

