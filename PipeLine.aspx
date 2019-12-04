<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PipeLine.aspx.cs" Inherits="PipeLine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <%-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    <script type="text/javascript">
        $(function () {
            BlockUI("dvReport");
            $.blockUI.defaults.css = {};
        });
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({
                    message: '<div align = "center">' + '<img src="images/loadingAnim.gif"/></div>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        };
</script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="font-family:Verdana;font-size:.9em;color:maroon">Business Pipeline</div>
    
    <table class="tablecss" border="0">
        <tr>
            <td>
                <div id="Head" runat="server" style="width: 400px; float: left; font-family:Verdana;">
                    <div style="padding-bottom:.5em;color:SaddleBrown">
                    Reports:
                    </div>
                <div style="padding-bottom:.5em;float:left; padding-right:.3em">
                    <asp:TextBox ID="txtBranch" runat="server" CssClass="textboxcss" Placeholder="BranchCode" Width="7em"></asp:TextBox>
                    </div>
                <div style="padding-bottom:.5em">
                    <asp:DropDownList ID="ddlRpt" runat="server" Height="2.5em" CssClass="dropboxcss" AutoPostBack="true" ForeColor="Blue" Width="11em">
                        <asp:ListItem>ALL</asp:ListItem>
                        <asp:ListItem>Branch Wise</asp:ListItem>
                        <asp:ListItem>Province Wise</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <%--<div style="padding-bottom:.5em;float:left; padding-right:.3em">
                    <asp:TextBox ID="txtSDate" runat="server" CssClass="textboxcss" placeholder="From Date" Width="7em"></asp:TextBox>
                    </div>
                <div style="padding-bottom:.5em">
                    <asp:TextBox ID="txtEDate" runat="server" CssClass="textboxcss" placeholder="To Date" Width="7em"></asp:TextBox>
                    </div>--%>
                <div style="padding-bottom:.5em">
                    <asp:Button ID="btnSearch" CssClass="btn" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnExportToExcel" CssClass="btn" runat="server" Text="Export to excel" OnClick="btnExportToExcel_Click" />
                </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="dvReport" style="align-content: center; width: 100%; font-family: Verdana; font-size: .8em;">
                            <asp:GridView ID="gvReportALL" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                <div id="Branch" runat="server" style="width: 300px; font-family:Verdana;">
                    <div style="padding-bottom:.5em;color:PaleVioletRed">
                    Select Type:
                    </div>
                    <div style="padding-bottom:.5em">
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="dropboxcss" ForeColor="Blue" Width="60%">
                        <asp:ListItem>Deposit</asp:ListItem>
                        <asp:ListItem>Loan</asp:ListItem>
                        <asp:ListItem>Resolution-Deposit</asp:ListItem>
                        <asp:ListItem>Resolution-Loan</asp:ListItem>

                    </asp:DropDownList>
                    </div>
                    <div style="padding-bottom:.5em">
                    <asp:Button ID="btnGo" CssClass="btn" runat="server" Text="Continue.." OnClick="btnGo_Click" />
                        </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>



