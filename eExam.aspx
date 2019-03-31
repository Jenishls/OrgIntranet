<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="eExam.aspx.cs" Inherits="eExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <style>
        .alertify .ajs-dialog {
    top: 50%;
    transform: translateY(-50%);
    margin: auto;
    
}

        .question{
            width:'80%' ;
            /*font-size:medium;*/ 
            color:red;
           /* border:solid 1px #177b90;*/
           background-color:#CC0000;
           padding:2px;
            margin-right:500px;
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
    font-size: .8rem;
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
    <div style="font-family:Verdana; font-size:.8em">
    <asp:Panel ID="pnlExam" runat="server" BackColor="#9ee5d5">
    
    <div style="padding-left:20px; font-family:Verdana; font-size:medium;background-color:coral;">
    <b><asp:Label ID="lblName" ForeColor="WhiteSmoke" Font-Italic="true" Font-Bold="true" runat="server"></asp:Label></b>
    </div>
    <hr class="h_divider" />
    <table style="padding-left:10px; margin-left:10px; ">
        <tr>
            <td style="color:Maroon;">Corporate Position :</td>
            <td>
                <asp:Label ID="lblposition" runat="server" CssClass="textboxcss"  Text="" Width="175px"></asp:Label>
            </td>
           </tr>
        
        <tr>
            <td style="color:Maroon;">Select Department :</td>
            <td>
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropboxcss" Width="200px">
                
            </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlDepartment" ErrorMessage="Choose Department" 
                    ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td style="color:Maroon;">Select Subject :</td>
            <td style="margin-left:10px;">
                <asp:DropDownList ID="ddlSubjects" CssClass="dropboxcss" runat="server"  Width="200px">
                </asp:DropDownList>  
            </td>
                <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlSubjects" ErrorMessage="Choose Subject" 
                    ForeColor="Red" InitialValue="" ValidationGroup="a">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="a" />
        <hr class="h_divider" />
        <div class="Set">
    <div class="question" runat="server" id="questionNote">Please read "Important Note" carefully before start</div></div>
    <div style="padding-left:25px;">
        <asp:Button ID="btnStart" CssClass="btnMain btnGreen" runat="server" Text="Start Exam" OnClick="btnStart_Click" ValidationGroup="a" />
    </div>
    <hr class="h_divider" />
    <div style="padding-left:25px;color:blue;text-underline-position:below;">
        <b style="text-decoration:underline">Important Note:</b>
    <ul>
    <li style="margin:5px;color:brown;" >Each exam contains 40 questions and 45 minutes is available to complete the test. Test shall be considered withheld if all questions are not completed and submitted within allocated 45 minutes period. It shall be considered as use of 1 attempt out of 4 available attempts for a unique Test.</li>
        <li style="margin:5px;color:brown;">Only four attempts and four weeks will be available to complete the given test.</li>
        <li style="margin:5px;color:brown;">You have to reappear for the test unless you secure “Good” or “Excellent” grade in the given test.</li>
        <li style="margin:5px;color:brown;">Use “Next” and "Previous" button to navigate between questions.</li>
        <li style="margin:5px;color:brown;">You can escape question and answer next one, however, you have to attempt all questions before finishing the test.</li>
        <li style="margin:5px;color:brown;">Result will be displayed after attempting all questions.</li>
        <li style="margin:5px;color:brown;">You can view your answer and correct answer of all questions after finishing the test.</li>
        <li style="margin:5px;color:brown;">You can print your certificate after finishing the test in “Good” or “Excellent” grade.</li>
        <li style="margin:5px;color:brown;">Intentionally avoiding examination and provoking others to avoid examination, intentional power failure, use of internet or any other resources while answering etc. are considered as Act of Misconduct.</li>
    </ul>
    </div>
    
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IntranetConnectionString %>"
        SelectCommand="SELECT sid, sname FROM OTsubjects WHERE (sid IN (SELECT DISTINCT sid FROM OTquestions))"></asp:SqlDataSource>--%>
        </asp:Panel>
        </div>
    <asp:Label ID="lblMsg" CssClass="auto-style2" Font-Bold="true" Font-Size="XX-Large" runat="server"></asp:Label>
</asp:Content>

