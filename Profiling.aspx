<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Profiling.aspx.cs" Inherits="Profiling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .protected {
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
}

        .question{
            width:'100%' ;
            font-size:large; 
            color:blue;
           /* border:solid 1px #177b90;*/
           background-color:#1682a0;
           padding:7px;
            margin-right:10px;
            box-shadow: 10px 10px 5px grey;
            color:white;
            font-weight:normal;
        }
        .Set{
             border-radius:10px;
             background-color:#99d8e9; 
             padding-left:20px;
             padding-top:10px;
             margin:10px;
        }

        .ans{
            margin-top:20px;
        }

        .ans td{
            padding-top:7px;
            padding-bottom:7px;
           
        }
         .ans td:hover{
            color:maroon;
           
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
    <link rel="stylesheet" href="http://www.jacklmoore.com/colorbox/example1/colorbox.css" />
    <link href="css/alertify.min.css" rel="stylesheet" />
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://www.jacklmoore.com/colorbox/jquery.colorbox.js"></script>
    <script src="js/alertify.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="protected">
   
        <div class="Set">
    <div class="question">
   <label runat="server" id="question" ></label> 
    </div>
    
    <table class="ans">
    <tr>
    <td>
    <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label runat="server" for="ContentPlaceHolder1_rbAns1" id="ans1" style="font-size:large"></label>
    </td>
    </tr>
    
    <tr>
    <td>
    <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label runat="server" for="ContentPlaceHolder1_rbAns2" id="ans2" style="font-size:large"></label>
    </td>
    </tr>
    
    <tr>
    <td>
    <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label runat="server" for="ContentPlaceHolder1_rbAns3" id="ans3" style="font-size:large;"></label>
    </td>
    </tr>
    
    <tr>
    <td>
    <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns4" runat="server" id="ans4" style="font-size:large"></label>
    </td>
    </tr>

    <tr>
    <td>
    <asp:RadioButton ID="rbAns5" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns5" runat="server" id="ans5" style="font-size:large"></label>
    </td>
    </tr>

    <tr>
    <td>
    <asp:RadioButton ID="rbAns6" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns6" runat="server" id="ans6" style="font-size:large"></label>
    </td>
    </tr>

    <tr>
    <td>
    <asp:RadioButton ID="rbAns7" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns7" runat="server" id="ans7" style="font-size:large"></label>
    </td>
    </tr>

    <tr>
    <td>
    <asp:RadioButton ID="rbAns8" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns8" runat="server" id="ans8" style="font-size:large"></label>
    </td>
    </tr>

    <tr>
    <td>
    <asp:RadioButton ID="rbAns9" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns9" runat="server" id="ans9" style="font-size:large"></label>
    </td>
    </tr>

    <tr>
    <td>
    <asp:RadioButton ID="rbAns10" runat="server" GroupName="answer" ValidationGroup="a" />
    </td>
    <td >
    <label for="ContentPlaceHolder1_rbAns10" runat="server" id="ans10" style="font-size:large"></label>
    </td>
    </tr>
    <asp:CheckBox runat="server" ID="remaining" Visible="false"/>
    </table>
        
            </div>
        <div class="buttonSection">
        <asp:Button ID="btnPrev" CssClass="btnMain btnGreen" runat="server" Text="Previous" OnClick="btnPrev_Click" />&nbsp;
        <asp:Button ID="btnNext" CssClass="btnMain btnGreen" runat="server" Text="Next" Width="75px" OnClick="btnNext_Click" />
        <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel Exam" OnClick="btnCancel_Click" />
        </div>
        </div>
</asp:Content>

