<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ResolutionDeposit.aspx.cs" Inherits="ResolutionDeposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>
    <style type="text/css">
        .auto-style2 {
            /*font-weight: bold;*/
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 21%;
            border-bottom: 1px solid #e1e2e2;
        }
         

        .auto-style3 {
            /*font-weight: bold;*/
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 12%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style4 {
            /*font-weight: bold;*/
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 13%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style5 {
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 41%;
            border-bottom: 1px solid #e1e2e2;
        }
         

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>

    <panel><p style="color:Maroon;font-weight:bold">Business Pipeline- Deposit </p></panel>
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" class="tablecss">
                <tr>
                    <td class="auto-style2">
                        <div style="float: left">Reference No</div>
                        <div style="float: right">:</div>
                    </td>
                    <td class="riskrighttd">

                        <asp:TextBox runat="server" ID="txtSearch" Width="60%" Font-Bold="true" CssClass="textboxcss"></asp:TextBox>

                        <asp:Button ID="btnSearch1" CssClass="btn btn-primary" runat="server" OnClick="btnSearch1_Click" Text="Search" />
                        <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" OnClick="btnSearch_Click" Text="Submit" />

                    </td>

                </tr>
            </table>
            <center>
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  BackColor="White" EmptyDataText="Sorry, There is No Record To Display !!!" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="10" Cellspacing="5">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Click Here">
                <ControlStyle ForeColor="Blue"></ControlStyle>
            </asp:CommandField>
        </Columns>
       
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
       
    </asp:GridView>
    </center>
            <asp:Panel ID="pnlLoan" runat="server" Width="500px">
                <table cellpadding="0" cellspacing="0" class="tablecss">
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left;">
                                Branch Code
                            </div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:Label ID="lblBranchCode" runat="server" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Customer Name</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:Label ID="lblCName" runat="server" ForeColor="Blue"></asp:Label>

                        </td>

                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Deposit Type</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:Label ID="lblType" runat="server" ForeColor="Blue"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Visited Date</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:Label ID="lblVDate" runat="server" ForeColor="Blue"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Visited By</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:Label ID="lblVBy" runat="server" ForeColor="Blue"></asp:Label>

                        </td>
                    </tr>

                </table>
            </asp:Panel>
            <div id="BDetail" runat="server" style="font-size: large; font-style: italic; font-weight: bold; color: maroon; margin-left: 20px;">
                Business Details: <br />
                <div style="font-size:medium; color:red; font-style:normal;">
                    <asp:CheckBox ID="chkEdit" runat="server" Text="Edit" OnCheckedChanged="chkEdit_CheckedChanged" AutoPostBack="true" />
                </div>
            </div>
           
            <div style="margin-left: 5px">
                <asp:Panel ID="pnlDetails1" runat="server" BorderStyle="Groove" Width="500px" BorderColor="Maroon">
                    <table  class="tablecss">
                        <tr>
                            <td class="risklefttd">Expected Amount:
                            </td>
                       
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtExpAmt" runat="server" CssClass="textboxcss" Width="60%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                           
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Realization Date:
                            </td>
                        
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtExpDate" runat="server" CssClass="textboxcss" Width="60%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                           
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Interest Rate %:
                            </td>
                        
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtExpRate" runat="server" CssClass="textboxcss" Width="60%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            
                        </tr>
                        
                        <tr>
                            <td class="risklefttd">Currently Banking With:
                            </td>
                       
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtBank" runat="server" CssClass="textboxcss" Width="60%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="risklefttd">Realization Probability %:
                            </td>
                        
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtProbab" runat="server" CssClass="textboxcss" Width="60%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                           
                        </tr>
                    </table>
                </asp:Panel>
            </div>

            <div style="margin-left: 10px">
              
            </div>
            
            <asp:Panel ID="pnlResolution" runat="server">
                <table cellpadding="0" cellspacing="0" class="tablecss">

                    <tr>
                        <td class="risklefttd"> Resolution Status: 
                            
                        </td>
                        <td class="riskrighttd">
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropboxcss" Width="50%" BorderColor="SkyBlue" ForeColor="Blue" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>Choose One</asp:ListItem>
                                <asp:ListItem>Referred to Another Branch</asp:ListItem>
                                <asp:ListItem>Executed</asp:ListItem>
                                <asp:ListItem>Canceled</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:TextBox ID="txtStatus" runat="server" BorderColor="SkyBlue" CssClass="textboxcss"></asp:TextBox>--%>

                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlExec" runat="server" Visible="false">
                <table cellpadding="0" cellspacing="0" class="tablecss">
                    <tr>
                        <td class="risklefttd">Executed Amount: 
                            
                        </td>
                        <td class="riskrighttd">
                            <asp:TextBox ID="txtExeAmount" runat="server" Width="70%" BorderColor="SkyBlue" CssClass="textboxcss"></asp:TextBox>

                        </td>

                    </tr>
                    <tr>
                        <td class="risklefttd">Executed Date:
                           
                        </td>
                        <td class="riskrighttd">
                            <asp:TextBox ID="txtExeDate" runat="server" Width="70%" BorderColor="SkyBlue" TextMode="Date" CssClass="textboxcss"></asp:TextBox></td>

                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlBranch" runat="server" Visible="false">
                <table cellpadding="0" cellspacing="0" class="tablecss">
                    <tr>
                        <td class="auto-style3">BranchCode:
                        </td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="ddlBranch" runat="server" Width="40%" BorderColor="SkyBlue" ForeColor="Blue" CssClass="dropboxcss">
                            </asp:DropDownList></td>

                    </tr>

                </table>
            </asp:Panel>
            <div style="margin-left: 10px">
                <asp:Panel ID="pnlRemarks" runat="server">
                    <table cellpadding="0" cellspacing="0" class="tablecss">

                        <tr>
                            <td class="auto-style4">Remarks:
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblRemark" runat="server" ForeColor="Blue"></asp:Label>

                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>

            <div style="margin-left: 320px">
                <asp:Button ID="btnExe" CssClass="btn" runat="server" Text="Execute" OnClick="btnExe_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

