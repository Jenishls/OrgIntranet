<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddVendor.aspx.cs" Inherits="AddVendor" MasterPageFile="~/Main.master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div style="padding: 16px">
        <h3 class="auto-style2" style="margin-top: 16px">Add Vendor</h3>
        <table class="tablecss" >


          <tr>
        <td class="risklefttd">
            <div style="float: left">Name</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="txtName" runat="server" cssclass="textboxcss" text="" ></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator1" runat="server" controltovalidate="lbYear" errormessage="Enter year" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">Address</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="txtAddress" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
    </tr>
          <tr>
        <td class="risklefttd">
            <div style="float: left">PAN</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="txtPAN" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
    </tr>
          <tr>
        <td class="risklefttd">
            <div style="float: left">Type</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="txtType" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
    </tr>
      </table>
    <br/>
    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn" onClick="Button1_Click"/>
        </div>
</asp:Content>
