<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Resolution.aspx.cs" Inherits="Resolution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>
    <script type="text/javascript" language="javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
 </script>
    <style type="text/css">
        .auto-style2 {
            /*font-weight: bold;*/
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 21%;
            border-bottom: 1px solid #e1e2e2;
        }
         

        .auto-style4 {
            /*font-weight: bold;*/
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 17%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style5 {
            /*font-weight: bold;*/
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 164px;
            border-bottom: 1px solid #e1e2e2;
        }
        .btnMain {
    display: inline-block;
    font-weight: 300;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: .75rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    color:white;
    padding-left:20px;
}
        .btnGreen{
            background-color:#0db42f;
            padding-left:10px;
        }
        .btnGreen:hover{
            background-color:#50b765;
        }
        .btnRed{
            background-color:red;
        }

        .btnRed:hover{
            background-color:#eb5454;
        }
         

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>

    <panel><p style="color:Maroon;font-weight:bold">Business Pipeline- Loan </p></panel>
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <center>
            <div>
            <asp:Panel ID="pnlMsg" runat="server" Visible="false">
            <div>
                <asp:Label ID="lblMsg" runat="server" Font-Size="Large" ForeColor="Salmon" Text=""></asp:Label>
            </div>
            <div style="padding:2em">
                <asp:Button ID="btnMsg" runat="server" CssClass="btnMain btnGreen" Text="Back To Page" OnClick="btnMsg_Click" />
            </div>
        </asp:Panel>
                </div>
                </center>
            <div id="search" runat="server">
            <table cellpadding="0" cellspacing="0" class="tablecss">
                <tr>
                    <td class="auto-style2">
                        <div style="float: left">Reference No</div>
                        <div style="float: right">:</div>
                    </td>
                    <td class="riskrighttd">

                        <asp:TextBox runat="server" ID="txtSearch" Width="60%" Font-Bold="true" CssClass="textboxcss"></asp:TextBox>

                        <asp:Button ID="btnSearch1" CssClass="btnMain btnGreen" runat="server" OnClick="btnSearch1_Click" Text="Search" />
                        <asp:Button ID="btnSearch" CssClass="btnMain btnGreen" runat="server" OnClick="btnSearch_Click" Text="Submit" />

                    </td>

                </tr>
            </table>
                </div>
            <center>
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" EmptyDataText="Sorry, There is No Record To Display !!!" 
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
                            <div style="float: left">Business Type</div>
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
           <%-- <br />--%>
            <div style="margin-left: 5px">
                <asp:Panel ID="pnlDetails1" runat="server" BorderStyle="Groove" Width="700px" BorderColor="Maroon">
                    <table  class="tablecss">
                        <tr>
                            <td class="risklefttd">Product Type:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtProduct" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtProduct1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtProduct2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Business Nature/Purpose:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtNature" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtNature1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtNature2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Amount:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtExpAmt" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpAmt1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpAmt2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Realization Date:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtExpDate" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpDate1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpDate2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Interest Rate %:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtExpRate" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpRate1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpRate2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Service Charge %:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtExpCharge" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpCharge1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpCharge2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Commission:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtExpComm" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpComm1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtExpComm2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Currently Banking With:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtBank" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtBank1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtBank2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Realization Probability %:
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px;">
                                <asp:TextBox ID="txtProbab" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtProbab1" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td style="padding:5px;">
                                 <asp:TextBox ID="txtProbab2" runat="server" CssClass="textboxcss" Width="90%" BorderColor="SkyBlue" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>

            <div style="margin-left: 10px">
              
            </div>
            <%--</asp:Panel>--%>
            <asp:Panel ID="pnlResolution" runat="server">
                <table cellpadding="0" cellspacing="0" class="tablecss">

                    <tr>
                        <td class="risklefttd"> Resolution Status: 
                           
                        </td>
                        <td class="riskrighttd">
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropboxcss" Width="75%" BorderColor="SkyBlue" ForeColor="Blue" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
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
                        <td class="risklefttd">BranchCode:
                        </td>
                        <td class="riskrighttd">
                            <asp:DropDownList ID="ddlBranch" runat="server" BorderColor="SkyBlue" Width="60%" ForeColor="Blue" CssClass="dropboxcss">
                            </asp:DropDownList></td>

                    </tr>


                </table>
            </asp:Panel>
            <div style="margin-left: 10px">
                <asp:Panel ID="pnlRemarks" runat="server">
                    <table cellpadding="0" cellspacing="0" class="tablecss">

                        <tr>
                            <td class="risklefttd">Remarks:
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblRemark" runat="server" ForeColor="Blue"></asp:Label>

                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>

            <div style="margin-left: 320px">
                <asp:Button ID="btnExe" CssClass="btnMain btnGreen" runat="server" Text="Execute" OnClick="btnExe_Click" />
                <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

