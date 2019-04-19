<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="css/bootstrap.css" rel="stylesheet" />--%>
   <style>
        .protected {
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
}
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <%--<span id="Review" class="protected">
    <p class="contenthead">Interest Rate </p>--%>
    
    <%--<table>
        <tr>
            <td style="color:blue; margin-left:300px">
                Interest Rate On Deposit
            </td>
            <td style="color:blue; float:right; margin-right:255px">
                Interest Rate On Loan
            </td>
        </tr>
        <tr>
            <td style="margin-left:300px; ">
                <a style="float:left" id="imageLink" href="~\InterestRate\depositrate2.png" title="Int Rate On Deposit" runat="server" >
                <asp:Image ID="Image2" BorderColor="Maroon" BorderStyle="Double" Height="400px" Width="400px" ImageUrl="~\InterestRate\depositrate2.png" runat="server" />
                </a>
            </td>
            <td style="margin-left:300px;">
                <a style="margin-left:50px;" id="A1" href="~\InterestRate\loanrate2.png" title="Int Rate On Deposit" rel="lightbox[Brussels]" runat="server" >
                <asp:Image ID="Image1" BorderColor="Maroon" BorderStyle="Double" Height="400px" Width="400px" ImageUrl="~\InterestRate\loanrate2.png" runat="server" />
                </a>         
            </td>
        </tr>
    </table>--%>
        <div style="display:flex; justify-content:center">
            <img src="InterestRate\depositrate2.png" />
        </div>
    
    <%--</span>--%>
     
  
</asp:Content>

