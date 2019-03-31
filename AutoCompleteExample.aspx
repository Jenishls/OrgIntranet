<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutoCompleteExample.aspx.cs" Inherits="AutoCompleteExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

<title>ASP.NET ValidationSummary Control With ShowMessageBox="true" Example</title>
</head>
<body>
<form id="Form" runat="server">
<div>
<asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Medium" 
    Font-Underline="True" Text="ASP.NET ValidationSummary Control With 
	ShowMessageBox='true' Example"></asp:Label>
<br />
<br />
<table cellpadding="4" cellspacing="2" border="0" width="450">
<tr><td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" 
runat="server" DisplayMode="BulletList" 
HeaderText="Errors : " ShowMessageBox="true" ShowSummary="false" ForeColor="Red" /> </td></tr>
<tr><td><asp:Label ID="lblFirstName" runat="server" Text="First Name:  "></asp:Label></td>
<td><asp:TextBox ID="TextBox1" runat="server" Width="174px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="TextBox1" Display="None" 
    ErrorMessage="First Name is required field, can not be blank."></asp:RequiredFieldValidator></td></tr>
<tr><td><asp:Label ID="lblLastName" runat="server" Text="Last Name:  "></asp:Label></td>
<td><asp:TextBox ID="TextBox2" runat="server" Width="174px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="TextBox2" Display="None" 
    ErrorMessage="Last Name is required field, can not be blank."></asp:RequiredFieldValidator></td></tr>
<tr><td> </td><td><asp:Button ID="btnSubmit" runat="server" Font-Bold="True" 
    Font-Size="Small" Text="Submit" />  </td></tr>
</table> 
</div>   
</form>
</body>  
</html>




 