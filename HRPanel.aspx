<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="HRPanel.aspx.cs" Inherits="HRPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/alertify.min.js"></script>
    <link href="css/alertify.min.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        /*li::before {
            content: "•"; 
            color: red;
            display: inline-block; 
            width: 1em;
            margin-left: -1em}*/

        .auto-style2 {
            text-decoration: underline;
            color: #951818;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Panel ID="Test" runat="server">
     <div style="margin-left:1px;">
        <table>
            <tr>
                <td style="width:330px; padding:10px;">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/Image/add question.png"  PostBackUrl="~/AddQuestion.aspx" AlternateText="Add Question" runat="server" /><br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Add Question"></asp:Label>
                </td>
                <td style="width:330px; padding:10px;">
                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/Image/circulars.jpg" Height="10em" Width="15em" PostBackUrl="" AlternateText="Upload Circulars" runat="server" />
                </td>
                <%--<td>
                    <asp:ImageButton ID="ImageButton3" ImageUrl="" CssClass="btn btn-primary" BorderStyle="Groove" PostBackUrl="" AlternateText="Other" runat="server" />
                </td>--%>
            </tr>
            </table>
        </asp:Panel>
</asp:Content>

