<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PEP.aspx.cs" Inherits="PEP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        function printpage() {

            var getpanel = document.getElementById("<%= Pep.ClientID%>");
             var MainWindow = window.open('', '', 'height=600,width=800');
             MainWindow.document.write('<html><head><title>Ncc Bank Ltd - Pep Search </title>');
             MainWindow.document.write('</head><body>');
             MainWindow.document.write(getpanel.innerHTML);
             MainWindow.document.write('</body></html>');
             MainWindow.document.close();
             setTimeout(function () {
                 MainWindow.print();
             }, 500);
             return false;

         }
    </script>



    <div id="Pep" runat="server">
        <h3>NCC Pep Search:</h3>
        <table>
            <tr>
                <td class="risklefttd">
                    <div style="float: left; font-weight: 700; color: #0000FF; font-size: large;">Search Name</div>
                    <div style="float: right">:</div>
                </td>
                <td class="riskrighttd">
                    <script src="js/jquery.min.js" type="text/javascript"></script>
                    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
                    <link href="js/jquery-ui.css" rel="Stylesheet" type="text/css" />
                    <script type="text/javascript">
                        $(function () {
                            $("[id$=txtForwardTo]").autocomplete({
                                source:
                                function (request, response) {
                                    $.ajax({
                                        url: '<%=ResolveUrl("~/WebServicePep.asmx/GetPepList")%>',
                                                                data: "{ 'prefix': '" + request.term + "'}",
                                                                dataType: "json",
                                                                type: "POST",
                                                                contentType: "application/json; charset=utf-8",
                                                                success: function (data) {
                                                                    response($.map(data.d, function (item) {
                                                                        return {
                                                                            label: item.split('-')[0],
                                                                            val: item.split('-')[1]
                                                                        }
                                                                    }))
                                                                },
                                                                error: function (response) {
                                                                    alert(response.responseText);
                                                                },
                                                                failure: function (response) {
                                                                    alert(response.responseText);
                                                                }
                                                            });
                                                        },
                                                        select: function (e, i) {
                                                            $("[id$=hfUserId]").val(i.item.val);
                                                        },
                                                        minLength: 1
                                                    });
                                                });
                    </script>
                    <asp:TextBox ID="txtForwardTo" runat="server" CssClass="textboxcss"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtForwardTo" ErrorMessage="Name Required" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    <asp:HiddenField ID="hfUserId" runat="server" />
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="a" />
        <asp:Button ID="SearchByTagButton" CssClass="btnMain btnGreen" runat="server" Text="SEARCH"
            OnClick="SearchByTagButton_Click" ValidationGroup="a"  /><br />
        <br />
        <asp:Label ID="lblMsg" runat="server" Visible="false" Text=""></asp:Label>
        <br />
        <asp:Panel ID="pnlTable" runat="server">
        <table>
            <tr>
                <td style="width:200px">Name of PEP
                </td>
                <td>   </td>
                <td>
                    <asp:Label ID="lblPName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Org/Polt AFF
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblORG" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Designation
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblDesignation" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Dob
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblDOB" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Temporary Address
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblTAddress" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Permanent Address
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblPAddress" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Id Type 
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Id Number 
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblIdNumber" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Grand Father 
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblGFather" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Father
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblFather" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Mother
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblMother" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Son
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblSon" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Daughter
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblDaughter" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Spouse
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblSpouse" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
           
            </asp:Panel>
        <%--<center>   
 <asp:GridView ID="gvPeps" runat="server" EmptyDataText="Sorry, There is No Record To Display !!!" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="3px" CellPadding="3" CellSpacing="2" >
     <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
     <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
     <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
     <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
     <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
     <SortedAscendingCellStyle BackColor="#FFF1D4" />
     <SortedAscendingHeaderStyle BackColor="#B95C30" />
     <SortedDescendingCellStyle BackColor="#F1E5CE" />
     <SortedDescendingHeaderStyle BackColor="#93451F" />
 </asp:GridView> </center>--%>
        <br />
        <asp:Panel ID="pnl1" runat="server">
            <span class="auto-style2"><strong>Searched By:</strong></span>
            <asp:Label ID="lblName" runat="server" Text="" Style="font-weight: 700; background-color: #99FF99"></asp:Label>
            <br />
            <br />
            <span class="auto-style2"><strong>BranchCode:</strong></span>
            <asp:Label ID="lblBranch" runat="server" Text="" Style="font-weight: 700; background-color: #99FF99">></asp:Label>
            <br />
            <br />
            <span class="auto-style2"><strong>Date:</strong></span>
            <asp:Label ID="lblDate" runat="server" Text="" Style="font-weight: 700; background-color: #99FF99">></asp:Label>
        </asp:Panel>
    </div>
    <br />
    <asp:Button ID="btnPrint" CssClass="btnMain btnGreen" runat="server" Text="Print" OnClientClick="return printpage();" OnClick="btnPrint_Click" />

</asp:Content>

