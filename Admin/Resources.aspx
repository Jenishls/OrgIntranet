<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Resources.aspx.cs" Inherits="Admin_Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div style="font-family:Verdana;font-size:.8em; border-style:none">
        <asp:GridView ID="gvFiles" CellPadding="4" runat="server" Width="850px" AutoGenerateColumns="False" OnSelectedIndexChanged="gvFiles_SelectedIndexChanged" DataKeyNames="Name" ForeColor="#333333" GridLines="None">

            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <%--<asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="Name" SortExpression="Name" HeaderText="Materials" />
                <%--<asp:BoundField DataField="CreationTime" HeaderText="Date" />--%>


                <asp:CommandField HeaderText="" ShowHeader="True" ControlStyle-ForeColor="Blue" ShowSelectButton="True" SelectText="View">
                    <ControlStyle ForeColor="Blue"></ControlStyle>
                </asp:CommandField>

            </Columns>

            <EditRowStyle BackColor="#7C6F57" />

            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />

            <%--<HeaderStyle BackColor="#003399" Font-Bold="true" ForeColor="#CCCCFF" />--%>

            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />

            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />

            <RowStyle BackColor="#E3EAEB" />

            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

            <SortedAscendingCellStyle BackColor="#F8FAFA" />

            <SortedAscendingHeaderStyle BackColor="#246B61" />

            <SortedDescendingCellStyle BackColor="#D4DFE1" />

            <SortedDescendingHeaderStyle BackColor="#15524A" />

        </asp:GridView>

    </div>
</asp:Content>

