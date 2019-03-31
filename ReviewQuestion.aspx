<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ReviewQuestion.aspx.cs" Inherits="ReviewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <style>
        .protected {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
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
            .btnGreen:hover {
                background-color: #50b765;
            }
            .buttonSection{
            padding-left:0px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="buttonSection">
    <asp:Button ID="btnShow" runat="server" CssClass="btnMain btnGreen" Text="Show Certificate" OnClick="btnShow_Click" />
    <asp:Button ID="btnBack" runat="server" CssClass="btnMain btnGreen" Text="Go To Home Page" OnClick="btnBack_Click" />
        </div>
    <span class="protected">
        <asp:DataList ID="DataList1" runat="server">
            <HeaderTemplate>
                
                <h3>Review Questions</h3>
                <hr style="color: red" />
                </hr>
            </HeaderTemplate>

            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <img style="border:none; float:left;" src="<%# DataBinder.Eval( Container.DataItem,"Scope") %>" height="20" width="30" />
                            <label style="color: blue; background-color: #eeeeee; font-size:medium;"><%# DataBinder.Eval( Container.DataItem,"QuestionText")%></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="color: maroon; background-color: #eeeeee;">1.<%# DataBinder.Eval( Container.DataItem,"Answer1") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="color: maroon; background-color: #eeeeee;">2.<%# DataBinder.Eval( Container.DataItem,"Answer2") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="color: maroon; background-color: #eeeeee;">3.<%# DataBinder.Eval( Container.DataItem,"Answer3") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="color: maroon; background-color: #eeeeee;">4.<%# DataBinder.Eval( Container.DataItem,"Answer4") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="color: green; background-color:#eeeeee;">Correct Answer :<%# DataBinder.Eval( Container.DataItem,"CorrectAnswer") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="background-color: #eeeeee;">Your Answer :<%# DataBinder.Eval( Container.DataItem,"YourAnswer") %></label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

            <SeparatorTemplate>
                <hr style="color: Red" />
            </SeparatorTemplate>

        </asp:DataList>
    </span>
</asp:Content>

