<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RiskProfile.aspx.cs" Inherits="RiskProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <style>
        .question{
            width:'80%' ;
            font-size:medium; 
            color:red;
           /* border:solid 1px #177b90;*/
           background-color:#951818;
           padding:2px;
            margin-right:520px;
            box-shadow: 10px 10px 5px grey;
            color:white;
            font-weight:normal;
        }
        .Set{
             border-radius:10px;
             /*background-color:#99d8e9;*/ 
             padding-left:20px;
             padding-top:5px;
             margin:5px;
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
    font-size: 1rem;
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
}
         .auto-style2 {
            text-decoration: underline;
            color: #951818;
        }
        .auto-style3 {
            color: #CC0000;
            padding:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="font-family:Verdana; font-size:1em">
        <h3 style="color:green">Branch Details:</h3>
        <table cellpadding="2px" cellspacing="3px" class="tablecss1"  >
                        <tr>
                            <td class="riskrighttd">
                                <div style="float:left">
                                    BranchCode
                                </div>
                            </td>
                            <td class="risklefttd">
                                <asp:DropDownList ID="ddlBranchCode" runat="server" CssClass="dropboxcss">
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch" 
                                    ForeColor="Red" InitialValue="Choose Branch" SetFocusOnError="True" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="riskrighttd">
                                <div style="float:left">
                                    Year
                                </div>
                            </td>
                            <td class="risklefttd">
                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropboxcss" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlYear" ErrorMessage="Select One" 
                                    ForeColor="Red" InitialValue="Choose One" SetFocusOnError="True" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="riskrighttd">
                                <div style="float:left">
                                    Month
                                </div>
                            </td>
                            <td class="risklefttd">
                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropboxcss">
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMonth" ErrorMessage="Select One" 
                                    ForeColor="Red" InitialValue="Choose One" SetFocusOnError="True" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="riskrighttd">
                                <div style="float:left" >
                                    Branch Manager
                                </div>
                            </td>
                            <td class="risklefttd">
                                <asp:Label ID="lblBM" runat="server" CssClass=" textboxcss"></asp:Label>
                            </td>
                        </tr>
                    
                </table>
    </div>
    <div>
        <asp:Button ID="btnStart" CssClass="btnMain btnGreen" runat="server" Text="Start Profiling" OnClick="btnStart_Click" ValidationGroup="a" />
    </div>
</asp:Content>

