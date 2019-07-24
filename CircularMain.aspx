<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CircularMain.aspx.cs" Inherits="CircualarMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="auto-style2">Add Circular</h3>
  <table class="tablecss">
    <tr>
        <td class="risklefttd">
            <div style="float: left">Year</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="lbYear" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator1" runat="server" controltovalidate="lbYear" errormessage="Enter year" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">Circular Type</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:dropdownlist id="drpCircularType" runat="server" cssclass="dropboxcss" >
                <asp:ListItem>Choose Type</asp:ListItem>
                <asp:ListItem Value="A"> Adminstration Circular</asp:ListItem>
                <asp:ListItem Value="O">Office Instruction Memo</asp:ListItem>
            </asp:dropdownlist>
        </td>
        <td class="riskrighttd">
            <asp:requiredfieldvalidator id="requiredfieldvalidator2" runat="server" controltovalidate="drpCircularType" errormessage="select circular type" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">Circular No.</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="lbCircularNo" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator3" runat="server" controltovalidate="lbCircularNo" errormessage="Enter circular no " forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">Subject</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
         
            <asp:Textbox id="lbSubject" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator4" runat="server" controltovalidate="lbSubject" errormessage="enter subject" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">File</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator5" runat="server" controltovalidate="FileUpload1" errormessage="select file" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
  </table>
<asp:Button ID="CircularSave" runat="server" Text="Upload"
    OnClick="CircularSave_Click" CssClass="btnMain btnGreen" />
<br />
<br />
   

    <a href="http://192.168.103.77/HRD/2007%20circular/HRD%20TOPIC.htm" target="_blank"><u><h3>Old Circulars</h3></u></a>
    

    <h3><u> New Circulars</u></h3>
<asp:GridView ID="CircularMainGridView" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="10" AllowSorting="True" >
            <Columns>
                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandName = '<%#Eval("SType") %>'
                    CommandArgument='<%#Eval("Year") %>'
                    Text=' <%#Eval("Type") %> '
                    OnCommand="CircularMainClick" 
                    >
                    </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <%--<asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <a href="CircularDisplay.aspx?link=<%#Eval("Type") %>">  <%#Eval("Type") %>  <%#Eval("Year") %>  </a>
                        </ItemTemplate>
                </asp:TemplateField>--%>
                <%--<asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />--%>
            </Columns>
    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" 
        ForeColor="#FFFFCC" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
        HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#330099" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" 
        ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>

</asp:Content>

