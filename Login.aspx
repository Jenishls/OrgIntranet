<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>
    <link href="Style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 51%;
        }
        .auto-style2 {
            width: 235px;
        }
    </style>
</head>
<body style="background-color: flavor">
    
    <form id="form1" runat="server">
        
        <center>
          <div class="logincenter">
    <fieldset style="background-color:skyblue; font-size:large">
        <legend style="color:brown">NCC Intranet Login</legend>
  
   <div>
        <table  class="auto-style2">
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtUserName" CssClass="textboxcss" placeholder="Enter User Id" runat="server"  Width="200px"></asp:TextBox>
                </td>
                    
            </tr>
            <tr>
                <td class="riskrighttd">
                    <asp:TextBox CssClass="textboxcss" ID="txtPassword" placeholder="Enter Password" runat="server" TextMode="Password" Width="200px" ></asp:TextBox>
                </td>
                    
            </tr>
            <tr>
                <td >
                    <div>
                        <center>
                     <asp:Button ID="btnLogin" CssClass="btn" runat="server" Width="230px" Height="40px" BackColor="LightGreen" Font-Bold="true" Font-Size="Medium" Text="Login" OnClick="btnLogin_Click" />
                            </center>
                  </div>
                <%--<br />--%>
                   <div>
                        <center>
                <asp:Button ID="btnResetPasswordL" CssClass="btn" runat="server" Text="Reset Password"  ForeColor="White" OnClick="btnResetPasswordL_Click" Width="230px" />
                    </center>
                  </div>
                </td>
            </tr>
           
        </table>
   
        
        </div>
    
        </fieldset>
              </div>
            </center>
    </form>
</body>
</html>
