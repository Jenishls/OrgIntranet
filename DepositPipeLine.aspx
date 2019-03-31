<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="DepositPipeLine.aspx.cs" Inherits="DepositPipeLine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Name" runat="server"><p style="color:Maroon;font-weight:bold">Business Pipeline- Deposit </p></asp:Panel>
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <h2>Data Saved with following Reference No.</h2>
        <table cellpadding="0" cellspacing="0" class="tablecss">
            <tr>
                <td class="risklefttd">
                    <div style="float: left">ReferenceNo</div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd" style="margin-right: 300px">
                    <asp:TextBox ID="txtFRefNo" runat="server" CssClass="textboxcss" BorderColor="Window" ForeColor="Purple" ReadOnly="True"></asp:TextBox>

                </td>

            </tr>
        </table>
        <div style="margin-left: 250px;">
            <asp:Button ID="btnMsg" runat="server" CssClass="btn" Text="Back To Page" OnClick="btnMsg_Click" />
        </div>
    </asp:Panel>
    <asp:Panel ID="Deposit" runat="server" Width="500px">
        <table cellpadding="2" cellspacing="4" class="tablecss">
            <tr>
                <td class="risklefttd">
                    <div style="float: left;">
                        Branch Code
                    </div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:DropDownList ID="ddlBranchCode" runat="server" Width="150%" ForeColor="Purple" BorderColor="SkyBlue" CssClass="dropboxcss">
                    </asp:DropDownList></td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch"
                        ForeColor="Red" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left">Customer Name</div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtName" runat="server" ForeColor="Purple" BorderColor="SkyBlue" Width="150%" CssClass="textboxcss"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left">Deposit Type</div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:DropDownList ID="ddlType" runat="server" ForeColor="Purple" BorderColor="SkyBlue" CssClass="dropboxcss">
                        <asp:ListItem>Current</asp:ListItem>
                        <asp:ListItem>Call</asp:ListItem>
                        <asp:ListItem>Saving</asp:ListItem>
                        <asp:ListItem>Fixed</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlType"
                        ErrorMessage="Choose Business" ForeColor="Red" InitialValue="Choose Business" ValidationGroup="a">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left">Visited Date</div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtVDate" runat="server" TextMode="Date" ForeColor="Purple" BorderColor="SkyBlue" CssClass="textboxcss"></asp:TextBox></td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtVDate"
                        ErrorMessage="Visit Date Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left">Visited By</div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtVisitBy" runat="server" ForeColor="Purple" BorderColor="SkyBlue" CssClass="textboxcss"></asp:TextBox></td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtVisitBy"
                        ErrorMessage="Visited By Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
            </tr>

        </table>
    </asp:Panel>
    <div id="BDetail" runat="server" style="font-size: large; font-style: italic; font-weight: bold; color: maroon; margin-left: 20px;">
        Business Details:
    </div>
    <br />
    <div style="margin-left: 20px">
        <asp:Panel ID="pnlDetails1" runat="server" BorderStyle="Groove" Width="700px" BorderColor="Maroon">
            <table>
                <tr>
                    
                    <td class="risklefttd">Expected Amount:
                    </td>
                    <td class="risklefttd">Expected Realization Date:
                    </td>
                    <td class="risklefttd">Expected Interest Rate %:
                    </td>
                    </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtAmount" runat="server" ForeColor="Purple" BorderColor="SkyBlue" placeholder="0.00" CssClass="textboxcss" Width="75%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtExpDate" TextMode="Date" runat="server" BorderColor="SkyBlue" ForeColor="Purple" CssClass="textboxcss" Width="75%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRate" runat="server" ForeColor="Purple" BorderColor="SkyBlue" placeholder="x.xx%" CssClass="textboxcss" Width="75%"></asp:TextBox>
                    </td>

                </tr>
                
                <tr>
                    <td class="risklefttd">Received Amount(Rs.):
                    </td>
                    <td class="risklefttd">Currently Banking With:
                    </td>
                    <td class="risklefttd">Realization Probability %:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtReceived" runat="server" ForeColor="Purple" BorderColor="SkyBlue" placeholder="Amount In Rs." CssClass="textboxcss" Width="75%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBank" runat="server" ForeColor="Purple" BorderColor="SkyBlue" CssClass="textboxcss" Width="75%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProbability" placeholder="x.xx%" runat="server" BorderColor="SkyBlue" ForeColor="Purple" CssClass="textboxcss" Width="75%"></asp:TextBox>
                    </td>
                </tr>

            </table>
        </asp:Panel>
    </div>
    <asp:Panel ID="pnlResolution" runat="server" Width="500px">
        <table cellpadding="0" cellspacing="0" class="tablecss">

            <tr>
                <td class="risklefttd">
                    <div style="float: left">Resolution Status: </div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtStatus" runat="server" BorderColor="SkyBlue" CssClass="textboxcss"></asp:TextBox>

                </td>

            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left">Executed Amount: </div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtExeAmount" runat="server" BorderColor="SkyBlue" CssClass="textboxcss"></asp:TextBox>

                </td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlType"
                        ErrorMessage="Choose Business" ForeColor="Red" InitialValue="Choose Business" ValidationGroup="a">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left">Executed Date: </div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtExeDate" runat="server" BorderColor="SkyBlue" TextMode="Date" CssClass="textboxcss"></asp:TextBox></td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtVDate"
                        ErrorMessage="Visit Date Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="risklefttd">
                    <div style="float: left;">
                        BranchCode
                    </div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <asp:DropDownList ID="ddlBranch" runat="server" BorderColor="SkyBlue" CssClass="dropboxcss">
                    </asp:DropDownList></td>
                <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlBranch" ErrorMessage="Select Branch"
                        ForeColor="Red" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                </td>
            </tr>


        </table>
    </asp:Panel>
    <div style="margin-left: 20px">
        <asp:Panel ID="pnlRemarks" runat="server" Width="500px">
            <table cellpadding="0" cellspacing="0" class="tablecss">

                <tr>
                    <td class="risklefttd">
                        <div style="float: left">Remarks</div>
                        <div style="float: right">:</div>
                    </td>
                    <td class="riskrighttd">
                        <asp:TextBox ID="txtRemarks" TextMode="MultiLine" BorderColor="SkyBlue" runat="server" CssClass="textboxcss"></asp:TextBox>

                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div style="margin-left: 320px">
        <asp:Button ID="btnSave" CssClass="btn" runat="server" Text="Save" OnClick="btnSave_Click" />
    </div>
</asp:Content>

