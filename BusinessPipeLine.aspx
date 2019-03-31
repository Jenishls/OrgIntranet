<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BusinessPipeLine.aspx.cs" Inherits="BusinessPipeLine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
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

        .auto-style2 {
            /*font-weight: bold;*/
        text-align: left;
            vertical-align: middle;
            /*padding: 5px;*/
            width: 10%;
            border-bottom: 1px solid #e1e2e2;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>
    <div><p style="color:Maroon;font-weight:bold">Business Pipeline- Loan </p></div>
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <center>
            <div>
            <asp:Panel ID="pnlMsg" runat="server" Visible="false">
            <h3>Data Saved with following Reference No.</h3>
            <table cellpadding="0" cellspacing="0" class="tablecss">
                <tr>
                    <td class="risklefttd">
                        <div style="float:left; font-family:Verdana; font-size:medium; color:blue">Reference No</div>
                        <div style="float: right">:</div>
                    </td>
                    <td class="riskrighttd" style="margin-right: 250px">
                        <%--<asp:TextBox ID="txtFRefNo" runat="server" BorderColor="SkyBlue" CssClass="textboxcss" ReadOnly="True"></asp:TextBox>--%>
                        <asp:Label ID="lblRefNo" runat="server" CssClass="textboxcss" Width="100px" Font-Size="Large" ForeColor="Black" BorderColor="White" Text=""></asp:Label>

                    </td>

                </tr>
            </table>
            <div style="margin-left: 250px;">
                <asp:Button ID="btnMsg" runat="server" CssClass="btnMain btnGreen" Text="Back To Page" OnClick="btnMsg_Click" />
            </div>
        </asp:Panel>
                </div>
                </center>
            <div style="font-family:Verdana; font-size:small; font-weight:bold">
            <asp:Panel ID="Loan" runat="server" Width="500px">
                <table cellpadding="0" cellspacing="0" class="tablecss">
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left;">
                                Branch Code
                            </div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:DropDownList ID="ddlBranchCode" runat="server" Width="150%" BorderColor="SkyBlue" ForeColor="Blue" CssClass="dropboxcss">
                            </asp:DropDownList></td>
                        <td class="riskrighttd">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch"
                                ForeColor="Red" SetFocusOnError="true" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Customer Name</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:TextBox ID="txtName" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" Width="135%" CssClass="textboxcss"></asp:TextBox>

                        </td>

                        <td class="riskrighttd">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Name Required" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a">*</asp:RequiredFieldValidator>

                        </td>
                       
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Business Type</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:DropDownList ID="ddlType" runat="server" BorderColor="SkyBlue" ForeColor="Blue" CssClass="dropboxcss">
                                <asp:ListItem>SME</asp:ListItem>
                                <asp:ListItem>Corporate</asp:ListItem>
                                <asp:ListItem>Retail</asp:ListItem>
                                <asp:ListItem>Deprived Sector</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td class="riskrighttd">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlType"
                                ErrorMessage="Choose Business" ForeColor="Red" SetFocusOnError="true" InitialValue="Choose Type" ValidationGroup="a">*</asp:RequiredFieldValidator>

                        </td>
                        
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Visited Date</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:TextBox ID="txtVDate" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" Placeholder="mm/dd/yyyy" CssClass="textboxcss"></asp:TextBox></td>
                        <td class="riskrighttd">
                            <asp:RegularExpressionValidator ID="dateValRegex" runat="server" ControlToValidate="txtVDate" ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)" 
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtVDate"
                                ErrorMessage="Visit Date Missing" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                        
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float: left">Visited By</div>
                            <div style="float: right">:</div>
                        </td>
                        <td class="riskrighttd">
                            <asp:TextBox ID="txtVisitBy" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss"></asp:TextBox></td>
                        <td class="riskrighttd">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtVisitBy"
                                ErrorMessage="Visited By Missing" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                    </tr>

                </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="a" />
            </asp:Panel>
                </div>
            <hr />
            <div id="BDetail" runat="server" style="font-size: large; font-style: italic; font-weight: bold; background-color:white; width:7.5em; color: maroon; margin-left: 20px;">
                Business Details:
            </div>
            
            <div style="margin-left:10px; font-family:Verdana; font-size:.8em; font-weight:600; background-color:white; width:55em;">
                <asp:Panel ID="pnlDetails1" runat="server" BorderStyle="Groove" Width="700px" BorderColor="Maroon">
                    <table style="padding-left:1em;padding-bottom:.5em">
                        <tr>
                            <td class="risklefttd">Product Type:
                            </td>
                            <td class="risklefttd" style="margin-left: 300px;">Business Nature/Purpose:
                            </td>
                            <td class="risklefttd">Expected Amount:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlLoanType" runat="server" BorderColor="SkyBlue" CssClass="dropboxcss" ForeColor="Blue" Width="85%">

                                    <asp:ListItem>Business Overdraft</asp:ListItem>
                                    <asp:ListItem>Personal Overdraft</asp:ListItem>
                                    <asp:ListItem>Cash Credit</asp:ListItem>
                                    <asp:ListItem>Term Loan</asp:ListItem>
                                    <asp:ListItem>Export Loan</asp:ListItem>
                                    <asp:ListItem>Trust Receipt Loan</asp:ListItem>
                                    <asp:ListItem>Demand Loan/STL</asp:ListItem>
                                    <asp:ListItem>Consortium Loan</asp:ListItem>
                                    <asp:ListItem>Deprived Sector-Inst.</asp:ListItem>
                                    <asp:ListItem>Deprived Sector-Other</asp:ListItem>
                                    <asp:ListItem>Loan Against Govt. Bonds</asp:ListItem>
                                    <asp:ListItem>Loan Against FDR</asp:ListItem>
                                    <asp:ListItem>Loan Against Shares</asp:ListItem>
                                    <asp:ListItem>Personal Loan/Others</asp:ListItem>
                                    <asp:ListItem>Home Loan- Upto 5 Yrs.</asp:ListItem>
                                    <asp:ListItem>Home Loan- 5 Yrs. to 10 Yrs.</asp:ListItem>
                                    <asp:ListItem>Home Loan- Above 10 Yrs.</asp:ListItem>
                                    <asp:ListItem>Comm. HP Loan</asp:ListItem>
                                    <asp:ListItem>Vehicle Loan</asp:ListItem>
                                    <asp:ListItem>Education Loan</asp:ListItem>
                                    <asp:ListItem>Professional Loan</asp:ListItem>
                                    <asp:ListItem>K & L Uddyami Karja</asp:ListItem>
                                    <asp:ListItem>Saral Karja</asp:ListItem>
                                    <asp:ListItem>Foreign Emp. Loan</asp:ListItem>
                                    <asp:ListItem>Small Agr. Loan</asp:ListItem>
                                    <asp:ListItem>Small Business Loan</asp:ListItem>
                                    <asp:ListItem>Loan Against Loan</asp:ListItem>
                                    <asp:ListItem>Non- Funded</asp:ListItem>
                                </asp:DropDownList>
                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlLoanType"
                                ErrorMessage="Choose Product Type" ForeColor="Red" SetFocusOnError="true" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNature" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss" Width="75%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAmount" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="0.00" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtAmount"
                                ErrorMessage="Please enter only amount like 100 or 100.00" SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Realization Date:
                            </td>
                            <td class="risklefttd">Expected Interest Rate %:
                            </td>
                            <td class="risklefttd">Expected Service Charge %:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtExpDate" BorderColor="SkyBlue" AutoCompleteType="Disabled" runat="server" Placeholder="mm/dd/yyyy" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtExpDate" ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)" 
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtExpDate"
                                ErrorMessage="Exp.Realization Date Missing" SetFocusOnError="true" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRate" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="x.xx" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtRate"
                                ErrorMessage="Please enter only numbers like 1 or 1.00" SetFocusOnError="true" ValidationExpression="^(100(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,2})?)$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCharge" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="x.xx" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtCharge"
                                ErrorMessage="Please enter only numbers like 1 or 1.00" SetFocusOnError="true" ValidationExpression="^(100(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,2})?)$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Commission:
                            </td>
                            <td class="risklefttd">Currently Banking With:
                            </td>
                            <td class="risklefttd">Realization Probability %:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtCommission" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="0.00" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtCommission"
                                ErrorMessage="Please enter only amount like 100 or 100.00" SetFocusOnError="true" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBank" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss" Width="75%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtProbability" placeholder="x" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtProbability"
                                ErrorMessage="Please enter only numbers between 1 and 100" SetFocusOnError="true" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtExpDate"
                                ErrorMessage="Probability is required" InitialValue=" " SetFocusOnError="true" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                            </td>
                        </tr>

                    </table>
                </asp:Panel>
            </div>
            <div style="margin-left: 10px">
                <asp:Button ID="btnAdd" CssClass="btnMain btnGreen" runat="server" Text="+ Add" OnClick="btnAdd_Click" />
                <asp:Button ID="btnRemove" CssClass="btnMain btnRed" runat="server" Text="- Remove" OnClick="btnRemove_Click" />
            </div>
            <div style="margin-left:10px; font-family:Verdana; font-size:.8em; font-weight:600; background-color:white; width:55em;">
                <asp:Panel ID="pnlDetails2" runat="server" Visible="false" Width="700px" BorderStyle="Groove" BorderColor="Maroon">
                    <table style="padding-left:1em;padding-bottom:.5em">
                        <tr>
                            <td class="risklefttd">Product Type:
                            </td>
                            <td class="risklefttd">Business Nature/Purpose:
                            </td>
                            <td class="risklefttd">Expected Amount:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlLoanType1" runat="server" BorderColor="SkyBlue" CssClass="dropboxcss" ForeColor="Blue" Width="85%">

                                    <asp:ListItem>Business Overdraft</asp:ListItem>
                                    <asp:ListItem>Personal Overdraft</asp:ListItem>
                                    <asp:ListItem>Cash Credit</asp:ListItem>
                                    <asp:ListItem>Term Loan</asp:ListItem>
                                    <asp:ListItem>Export Loan</asp:ListItem>
                                    <asp:ListItem>Trust Receipt Loan</asp:ListItem>
                                    <asp:ListItem>Demand Loan/STL</asp:ListItem>
                                    <asp:ListItem>Consortium Loan</asp:ListItem>
                                    <asp:ListItem>Deprived Sector-Inst.</asp:ListItem>
                                    <asp:ListItem>Deprived Sector-Other</asp:ListItem>
                                    <asp:ListItem>Loan Against Govt. Bonds</asp:ListItem>
                                    <asp:ListItem>Loan Against FDR</asp:ListItem>
                                    <asp:ListItem>Loan Against Shares</asp:ListItem>
                                    <asp:ListItem>Personal Loan/Others</asp:ListItem>
                                    <asp:ListItem>Home Loan- Upto 5 Yrs.</asp:ListItem>
                                    <asp:ListItem>Home Loan- 5 Yrs. to 10 Yrs.</asp:ListItem>
                                    <asp:ListItem>Home Loan- Above 10 Yrs.</asp:ListItem>
                                    <asp:ListItem>Comm. HP Loan</asp:ListItem>
                                    <asp:ListItem>Vehicle Loan</asp:ListItem>
                                    <asp:ListItem>Education Loan</asp:ListItem>
                                    <asp:ListItem>Professional Loan</asp:ListItem>
                                    <asp:ListItem>K & L Uddyami Karja</asp:ListItem>
                                    <asp:ListItem>Saral Karja</asp:ListItem>
                                    <asp:ListItem>Foreign Emp. Loan</asp:ListItem>
                                    <asp:ListItem>Small Agr. Loan</asp:ListItem>
                                    <asp:ListItem>Small Business Loan</asp:ListItem>
                                    <asp:ListItem>Loan Against Loan</asp:ListItem>
                                    <asp:ListItem>Non- Funded</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNature1" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss" Width="75%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAmount1" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="txtAmount1"
                                ErrorMessage="Please enter only amount like 100 or 100.00" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Realization Date:
                            </td>
                            <td class="risklefttd">Expected Interest Rate %:
                            </td>
                            <td class="risklefttd">Expected Service Charge %:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtExpDate1"  runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" Placeholder="mm/dd/yyyy" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtExpDate1" ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)" 
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRate1" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="x.xx" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtRate1"
                                ErrorMessage="Please enter only numbers like 1 or 1.00" SetFocusOnError="true" ValidationExpression="^(100(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,2})?)$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCharge1" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="x.xx" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtCharge1"
                                ErrorMessage="Please enter only numbers like 1 or 1.00" SetFocusOnError="true" ValidationExpression="^(100(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,2})?)$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">Expected Commission:
                            </td>
                            <td class="risklefttd">Currently Banking With:
                            </td>
                            <td class="risklefttd">Realization Probability %:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtCommission1" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="0.00" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtCommission1"
                                ErrorMessage="Please enter only amount like 100 or 100.00" SetFocusOnError="true" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBank1" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss" Width="75%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtProbability1" BorderColor="SkyBlue" AutoCompleteType="Disabled" placeholder="x" runat="server" CssClass="textboxcss" Width="75%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtProbability1"
                                ErrorMessage="Please enter only numbers between 1 and 100" SetFocusOnError="true" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="a">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>

                    </table>
                </asp:Panel>
            </div>
            <hr class="ajs-header" />
            
            <div style="margin-left: 10px">
                <asp:Panel ID="pnlRemarks" runat="server">
                    <table cellpadding="0" cellspacing="0" class="tablecss">

                        <tr>
                            <td style="text-align:left;vertical-align:middle;width:10%">
                                <div>Remarks:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtRemarks" TextMode="MultiLine" runat="server" BorderColor="SkyBlue" AutoCompleteType="Disabled" CssClass="textboxcss"></asp:TextBox>

                            </td>
                        </tr>
                    </table>
                </asp:Panel>

            </div>
            <hr />
            <div style="margin-left: 320px">
                <asp:Button ID="btnSave" CssClass="btnMain btnGreen" runat="server" Text="Save" ValidationGroup="a" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel"  OnClick="btnCancel_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

