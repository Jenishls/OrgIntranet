<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>404 Error</title>
    <style type="text/css">
        .auto-style1 {
            color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" style="background-color:aqua" runat="server">
       
    <div style="margin-top:5px;height:600px; width:500px; padding-left:20em;">
    <asp:Image ID="Image1" ImageUrl="~/Image/error image.jpg" BorderStyle="None" BorderColor="White" runat="server"></asp:Image>
           
               <%--<asp:Button ID="btnBack" runat="server" BackColor="Blue" Width="100px" Height="30px" ForeColor="White" OnClick="btnBack_Click" Text="Back To Page"></asp:Button>--%>
            <div style="padding-left:17em;">
            <asp:Button ID="btnBack" runat="server" BackColor="Blue" Height="30px" ForeColor="White" OnClick="btnBack_Click" Text="Back To Page"></asp:Button>
        </div>
            </div>
        
        
    </form>
</body>
</html>
