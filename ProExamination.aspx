<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ProExamination.aspx.cs" Inherits="ProExamination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script lang="JavaScript">
        this.history.forward(-1);
</script>
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
    <asp:Panel ID="Panel1" runat="server">
     
        <div style="">
        <asp:ScriptManager ID="Sp" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Interval="1000" runat="server"></asp:Timer>
        <asp:UpdatePanel ID="Up" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="padding:5px; color:green; border:2px dotted green; width:150px; background-color:azure; margin:10px 0px; font-weight:bold;">
                <asp:Label ID="lblMsg" runat="server" Text="Time Left:"></asp:Label>
                <asp:Label ID="litMsg" runat="server" Text="00:00"></asp:Label>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        
    </div>
        </asp:Panel>
    <table width="100%" style="background-color:#4070e0;border-top-right-radius:20px;border-bottom-left-radius:20px; padding-left:10px;">
    <tr style="vertical-align:central;">
    <td style="color:ghostwhite; font-size:large">
        Subject :
        <asp:Label ID="lblSubject" runat="server" ForeColor="White"></asp:Label></td>
    <td style="color:white; font-size:large; text-underline-position:below;">
        Question :
        <asp:Label ID="lblQno" runat="server" ForeColor="White"></asp:Label></td>
    </tr>
    <tr>
    <td style="padding:5px;">
        <%--Started At :--%>
        <asp:Label ID="lblStime" runat="server" Visible="false" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    <td style="padding:5px;">
        <%--Current Time :--%>
        <asp:Label ID="lblCtime" runat="server" Visible="false" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    </tr>
    </table>
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
    <asp:CheckBox runat="server" ID="remaining" Visible="false"/>
    </table>
        
            </div>
        <div class="buttonSection">
        <asp:Button ID="btnPrev" CssClass="btnMain btnGreen" runat="server" Text="Previous" OnClick="btnPrev_Click" />&nbsp;
        <asp:Button ID="btnNext" CssClass="btnMain btnGreen" runat="server" Text="Next" Width="75px" OnClick="btnNext_Click" />
        <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel Exam" OnClick="btnCancel_Click" />
        </div>
        </div>
    <%--<button onclick="int=window.clearInterval(int)"></button>--%>
</asp:Content>

