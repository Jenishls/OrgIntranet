<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ExamAdmin.aspx.cs" Inherits="Admin_ExamAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
     <style>
         .alertify .ajs-dialog {
    top: 50%;
    transform: translateY(-50%);
    margin: auto;
    
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
            color: white;
            padding-left: 20px;
        }

        .btnGreen {
            background-color: #0db42f;
            padding-left: 10px;
        }

            .btnGreen:hover {
                background-color: #50b765;
            }

        .btnRed {
            background-color: red;
        }

            .btnRed:hover {
                background-color: #eb5454;
            }

        .buttonSection {
            padding-left: 5px;
            padding-top: .5em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table style="padding-left:10px; margin-left:10px; ">
            <tr>
            <td class="risklefttd" style="color:Maroon;">User Id :</td>
            <td class="riskrighttd">
                <asp:TextBox ID="txtUserId" CssClass="textboxcss" runat="server" Width="100px" OnTextChanged="txtUserId_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
                <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserId" ErrorMessage="User Id Required" 
                    ForeColor="Red" InitialValue=" " ValidationGroup="a">*</asp:RequiredFieldValidator>
            </td>
           </tr>
            <%--<tr>
                <td>
                    class="risklefttd" style="color:Maroon;">Exam Id:
                </td>
                <td class="riskrighttd">

                </td>
            </tr>--%>
            <tr>
                <td class="risklefttd" style="color:Maroon;">Exam Status:</td>
                <td class="riskrighttd">
                    <asp:Label ID="lblStatus" runat="server" BackColor="White"></asp:Label>
                </td>
            </tr>
        <tr>
            <td class="risklefttd" style="color:Maroon;">Action:</td>
            <td class="riskrighttd">
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropboxcss" Width="127px">
                    <asp:ListItem Text="UnBlock" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Block" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Choose Status" 
                    ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
            </td>
           </tr>
           
    </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="a" />
        <div class="buttonSection" style="padding-left:25px;padding-bottom:2em;">
        <asp:Button ID="btnUpdate" CssClass="btnMain btnGreen" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="a" />
        <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel" OnClick="btnCancel_Click"  />
    </div>
        <div style="padding-left:25px;">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        </div>

    </div>
</asp:Content>

