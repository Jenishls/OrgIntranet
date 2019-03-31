<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ExamResult.aspx.cs" Inherits="ExamResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>

    <link href="css/alertify.min.css" rel="stylesheet" />
         <script src="js/alertify.min.js"></script>
    <style type="text/css">
        .alertify .ajs-dialog {
    top: 50%;
    transform: translateY(-50%);
    margin: auto;
}
        .auto-style2 {
            color: #990000;
            text-decoration: underline;
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
    font-weight: 200;
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
}
        .btnGreen{
            background-color:#0db42f;
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
        .buttonSection{
            padding-left:12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="buttonSection">
    <asp:Button ID="btnShow" runat="server" CssClass="btnMain btnGreen" Text="Show Certificate" OnClick="btnShow_Click" />
    <asp:Button ID="btnBack" runat="server" CssClass="btnMain btnGreen" Text="Go To Home Page" OnClick="btnBack_Click1" />
        </div> 
   <%--<div style="font-family:Verdana; font-size:1em; padding:1em;">
       <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
   </div>--%>
    <div style="padding-left:1em;">
    <h4 class="auto-style2">
        <strong>NCC-KEEP Result</strong></h4>
    </div>
    <div style="padding-left:1em;">
    <table class="tablecss" style="padding:15px" border="1">
        <tr>
            <td style="width:60%">
                Name:
            </td>
            <td style="width:200%">
                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr class="table">
            <td>
                Branch Code:
            </td>
            <td>
                <asp:Label ID="lblBranchCode" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr class="table">
            <td>
                Branch Name:
            </td>
            <td>
                <asp:Label ID="lblBranch" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <%--<tr>
            <td>
                Department:
            </td>
            <td>
                <asp:Label ID="lblDept" runat="server" Text="Label"></asp:Label></td>
        </tr>--%>
        <tr class="table">
            <td>
                Subject:
            </td>
            <td>
                <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr class="table">
            <td>
                Start Time :
            </td>
            <td>
                <asp:Label ID="lblStime" runat="server" Text="Label"></asp:Label></td>
        </tr>
         <tr class="table">
            <td>
                End Time :
            </td>
            <td>
                <asp:Label ID="lblEtime" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
        <tr class="table">
            <td>
                Time Taken In Minutes : 
            </td>
            <td>
                <asp:Label ID="lblMin" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
                <tr class="table">
            <td>
               No. of Questions :
            </td>
            <td>
                <asp:Label ID="lblNquestions" runat="server"></asp:Label></td>
        </tr>
        
                <tr class="table">
            <td>
                No. of correct answers :
            </td>
            <td>
                <asp:Label ID="lblNcans" runat="server" Text="Label"></asp:Label></td>
        </tr>

        <tr class="table">
            <td>
                Grade : 
            </td>
            <td>
                <asp:Label ID="lblGrade" runat="server" Text="Label"></asp:Label></td>
        </tr>
    </table>
        </div>
    
    
    <%--<a  href="ReviewQuestion.aspx" style="color:blue; font-size:large;">Review Questions</a>
   <div class="buttonSection">
    <asp:Button ID="btnBack" CssClass="btnMain btnGreen" runat="server" OnClick="btnBack_Click" Text="Back" />
       </div>--%>
    <hr />
    <div style="padding-left:1em;">
    <b>Grade*</b>
    <ul>
    <li style="margin:5px; color:red" > >=35 : Excellent</li>
        <li style="margin:5px; color:red"> >=30 : Good</li>
        <li style="margin:5px; color:red"> <30 : Poor</li>
        
    </ul>
        </div>
</asp:Content>

