<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Circular.aspx.cs" Inherits="Circular" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
           .btnMain {
            display: inline-block;
            font-weight: 300;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            padding: .375rem .75rem;
            font-size: .75rem;
            line-height: 1.5;
            border-radius: .25rem;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            color: white;
            padding-left: 20px;
        }

        .btnGreen {
            background-color: #0db42f;
            padding-left: 10px;
        }

            .btnGreen:hover {
                background-color: #50b765;
            }

            .mt10{
                margin-top: 10px;
            } 
            
            .auto-style2 {
            text-decoration: underline;
            color: #951818;
            margin-bottom:20px
             }

    </style>
    <asp:Label id="lbOne" runat="server"></asp:Label>
    <div style="font-family:Arial">
        <h3><asp:Label ID="lbtest" runat="server"></asp:Label></h3>
        <%--<h3 class="auto-style2" id="headingC" runat="server">Circulars</h3>--%>
        <%--<table class="tablecss">
            <tr>
        <td class="risklefttd">
            <div style="float: left">Year</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="lbYear" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
        <td class="riskrighttd">
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
          
        </td>
    </tr>
        </table>--%>
<%--<asp:Button ID="CircularSave" runat="server" Text="Upload"
    OnClick="CircularSave_Click" CssClass="btnMain btnGreen" />
<br />--%>
      
<%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    OnRowCommand="GridView1_RowCommand" BackColor="White" 
    BorderColor="#CC9966" BorderStyle="None" 
    BorderWidth="1px" CellPadding="10" AllowSorting="True" OnSorting="GridView1_Sorting">
    <Columns>
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:TemplateField HeaderText="File" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandArgument='<%# Eval("File") %>'
                    Text='<%# Eval("File") %>'
                    OnClick="CircularClick" 
                    >
                    </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:BoundField DataField="Type" HeaderText="File Type" />
    </Columns>
    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" 
        ForeColor="#FFFFCC" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
        HorizontalAlign="Center"/>
    <RowStyle BackColor="White" ForeColor="#330099" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />
</asp:GridView>--%>

<asp:GridView ID="CircularGridView" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting"
    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="10" AllowSorting="True" DataKeyNames="Id" OnDataBinding="GridView1_DataBinding">
            <Columns>
                <asp:BoundField DataField="CirNo" HeaderText="No" SortExpression="CirNo" />
                <asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <a href="CircularDisplay.aspx?link=<%#Eval("filename") %>"> <%#Eval("Subject") %> </a>
                            <%--<asp:LinkButton ID="circularLink" runat="server" CausesValidation="False" Text="<%#Eval("Subject") %>"></asp:LinkButton>--%>
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Created_at" HeaderText="Date" SortExpression="Created_at" />
                <%--<asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />--%>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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

</div>

    <script>
        jQuery(document).ready(function ($) {
            $("#ContentPlaceHolder1_CircularGridView a").on('click', function (e) {
                e.preventDefault();
                console.log($(this).attr('href'))
                localStorage.setItem('CirNo', $(this).parent().parent().children().first().text())
                location.href = $(this).attr('href')
            })
        });
    </script>
</asp:Content>

