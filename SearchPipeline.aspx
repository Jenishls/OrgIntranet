<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchPipeline.aspx.cs" Inherits="SearchPipeline" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        UserView<br />
        <br />
        <asp:Label ID="Label1" runat="server" 
            style="z-index: 1; left: 96px; top: 58px; position: absolute" 
            Text="EnterUserName"></asp:Label>
    
    </div>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" 
            
            style="z-index: 1; left: 258px; top: 55px; position: absolute; height: 27px"> 
            </asp:TextBox>
    </p>
    <asp:Button ID="Button1" runat="server" 
        style="z-index: 1; left: 256px; top: 108px; position: absolute" 
        Text="Submit" onclick="Button1_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ReferenceNo"  
        EnableModelValidation="True" 
        style="z-index: 1; left: 71px; top: 303px; position: absolute; height: 42px; width: 7px">
        <Columns>
            <asp:BoundField DataField="ReferenceNo" HeaderText="Reference No" ReadOnly="True" 
                SortExpression="ReferenceNo" />
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="BusinessType" HeaderText="Business Type" 
                SortExpression="BusinessType" />
            <asp:BoundField DataField="VisitDate" HeaderText="Date" SortExpression="Visit Date" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myconnection %>" 
        SelectCommand="SELECT * FROM [PipeLineLoan]"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" 
        style="z-index: 1; left: 448px; top: 209px; position: absolute; height: 137px; width: 48px; margin-top: 0px">
    </asp:GridView>
    </form>
</body>
</html>