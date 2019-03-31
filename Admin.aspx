<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:1px;">
        <table>
            <tr>
                <td style="width:200px; padding:10px;">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/Image/user-management.jpg" Height="5em" Width="10em" BorderStyle="Groove" 
                        PostBackUrl="~/UserRelated.aspx" AlternateText="User Management" runat="server" /> <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="User Management"></asp:Label>
                </td>
                <td style="width:330px; padding:5px;">
                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/Image/exam.jpg" Height="5em" Width="10em" BorderStyle="Groove" 
                        PostBackUrl="~/Admin/ExamAdmin.aspx" AlternateText="Exam Related" runat="server" /><br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="KEEP Management"></asp:Label>
                </td>
                <td style="width:200px; padding:2px;">
                    <asp:ImageButton ID="ImageButton3" ImageUrl="~/Image/Qofday.png" Height="5em" Width="10em" BorderStyle="Groove" 
                        PostBackUrl="~/Admin/QOfDay.aspx" AlternateText="Question Of The Day" runat="server" /><br />
                    <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="Question Of The Day"></asp:Label>
                </td>
            </tr>
            </table>
        <hr />
        <div>  
    <p>No. of Online Users:<asp:Label ID="Label3" runat="server" Text="" ForeColor="#CC0000"></asp:Label></p>  
    </div> 
        <%--<div>Database:<asp:Label ID="Label5" runat="server" Text="" ForeColor="#CC0000"></asp:Label></div>--%>
        
    </div>
    
</asp:Content>

