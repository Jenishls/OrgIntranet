<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OnlineMemo.aspx.cs" Inherits="Memo_OnlineMemo" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <script>
        function printpage() {

            var getpanel = document.getElementById("<%= ViewMemo.ClientID%>");
            var MainWindow = window.open('', '', 'height=600,width=800');
            MainWindow.document.write('<html><head><title>Ncc Bank Ltd - NCC-Internal Memo Processing System(MPS) </title>');
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
    
    <div id="PanelMemo" runat="server">

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:Button ID="btnNew" CssClass="btnMain btnGreen" runat="server" Text="New Memo" OnClick="btnNew_Click" />
                <div style="padding-top: 5px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Both" Width="100%" DataKeyNames="ReferenceNo" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BranchCode" HeaderText="BranchCode" />
                            <asp:BoundField DataField="ReferenceNo" HeaderText="Reference No" />
                            <asp:BoundField DataField="ToName" HeaderText="To" />
                            <asp:BoundField DataField="FromName" HeaderText="From" />
                            <%--<asp:TemplateField HeaderText="File">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl='<%#"~/MemoImage/.."+Eval("Image") %>' Height="40px" Width="40px" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            <asp:BoundField DataField="ForwardTo" HeaderText="Forwarded To" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Image/images.jpg" ShowSelectButton="True" HeaderText="Action" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00ffff" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </div>
            </asp:View>

            <asp:View ID="View2" runat="server">

                <div>
                    <%--<div class="panel-heading">
                        <h3 class="panel-title">
                            <asp:Label ID="lblHeading" runat="server" Text=""></asp:Label></h3>
                    </div>--%>

                    <div>
                        <table class="table">
                            <tr>
                                <td colspan="3" class="header">Internal Memo Processing System</td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">To</td>
                                <td class="riskrighttd">
                                    <asp:TextBox ID="txtTo" CssClass="textboxcss" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTo" ErrorMessage="To Required" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">Through</td>
                                <td>
                                    <asp:TextBox ID="txtThrough" CssClass="textboxcss" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtThrough" ErrorMessage="Through Required" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Not Correct" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a">*</asp:RegularExpressionValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">Concerned Department</td>
                                <td>
                                    <asp:DropDownList ID="ddlDep" CssClass="textboxcss" runat="server" Width="300px"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlDep" InitialValue="Choose Department" ErrorMessage="Department Required" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr>
                                <td style="width: 200px" class="risklefttd">From</td>
                                <td>
                                    <asp:TextBox ID="txtFrom" CssClass="textboxcss" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFrom" ErrorMessage="From Required" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">Subject</td>
                                <td>
                                    <asp:TextBox ID="txtSubject" CssClass="textboxcss" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSubject" ErrorMessage="Subject Required" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">Free Memo</td>
                                <td>
                                    <CKEditor:CKEditorControl ID="fMemo" BasePath="/ckeditor/" Width="700px" Toolbar="Basic"
                                        ToolbarBasic="|Bold|Italic|Underline|Strike|-|NumberedList|BulletedList|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|
                                    |Link|Unlink|-|TextColor|-|Undo|Redo|Cut|Copy|Paste|PasteText|PasteFromWord|
                                    /
                                    |Find|Replace|SelectAll|-|Image|Table|HorizontalRule|SpecialChar|-|Format|"
                                        runat="server"></CKEditor:CKEditorControl>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">Attachments</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" AllowMultiple="true" CssClass="textboxcss" runat="server" Width="300px" />
                                    <%--<br />
                                    <asp:Image ID="Image2" runat="server" Height="120px" Width="164px" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px" class="risklefttd">Comments(if any)</td>
                                <td>
                                    <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="textboxcss" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            </table>
                            <table>
                            <tr>
                                    <td class="risklefttd" ><div style="float:left">Forward To</div>
                                        <div style="float:right">:</div></td><td class="riskrighttd">
                                            <script src="js/jquery.min.js" type="text/javascript"></script>
                                            <script src="js/jquery-ui.min.js"type="text/javascript"></script>
                                            <link href="js/jquery-ui.css"rel="Stylesheet" type="text/css" />
                                            <script type="text/javascript">
                                                $(function () {
                                                    $("[id$=txtForwardTo]").autocomplete({
                                                        source: function (request, response) {
                                                            $.ajax({
                                                                url: '<%=ResolveUrl("~/WebService.asmx/GetUsers") %>',
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
                                            <asp:TextBox ID="txtForwardTo" runat="server" cssclass="textboxcss" ></asp:TextBox>
                                            <asp:HiddenField ID="hfUserId" runat="server" /></td></tr>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" CssClass="btnMain btnGreen" runat="server" Text="Create" OnClick="btnSave_Click" ValidationGroup="a" />
                                    &nbsp;<asp:Button ID="btnBack" CssClass="btnMain btnBlue" runat="server" Text="Back" OnClick="btnBack_Click" />
                                    

                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="a" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="header">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </div>


            </asp:View>
            <asp:View ID="View3" runat="server">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <asp:Label ID="lblheading1" runat="server" Text=""></asp:Label></h3>
                    </div>

                    <div class="panel-body">
                        <div>
                            <table class="tablecss">
                                <%--<tr>
                                <td colspan="3" class="header">Online Memo</td>
                            </tr>--%>
                                <tr>
                                    <td style="width: 200px">Reference No</td>
                                    <td>
                                        <asp:Label ID="lblReferenceNo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">To</td>
                                    <td>
                                        <asp:Label ID="lblTo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Initiator Dep. of HO</td>
                                    <td>
                                        <asp:Label ID="lblDep" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Through</td>
                                    <td>
                                        <asp:Label ID="lblThrough" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>From</td>
                                    <td>
                                        <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Branch Code</td>
                                    <td>
                                        <asp:Label ID="lblBranchCode" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Subject</td>
                                    <td>
                                        <asp:Label ID="lblSubject" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Created On</td>
                                    <td>
                                        <asp:Label ID="lblCreate" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Comments</td>
                                    <td>
                                        <asp:Label ID="lblComment" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Last Forward To</td>
                                    <td>
                                        <asp:Label ID="lblForwardTo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td>
                                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <hr />
                        <br />
                        <div>
                            <table>
                                <tr>

                                    <%--<td></td>--%>
                                    <td colspan="3">
                                        <asp:Label ID="lblMemo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>


                            </table>
                        </div>
                        <br />
                        <hr />
                        <br />
                        
                            <table>
                                <tr>
                                    <td style="width: 200px">Attachments</td>
                                    <td>
                                         
                                        <asp:Image ID="Image1" runat="server" Height="120px" Width="164px" />
                                        
                                    </td>
                                </tr>
                            </table>
                        
                        <br />
                        <hr />
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td colspan="3">
                                        <center><p class="contenthead">Memo History</p></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center><asp:GridView ID="gvMemoHistory" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%">
                                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                        <Columns>
                                        <asp:BoundField DataField="Date" HeaderText="Date"></asp:BoundField>
                                        <asp:BoundField DataField="ForwardedBy" HeaderText="Forwarded By"></asp:BoundField>
                                        <asp:BoundField DataField="ForwardedTo" HeaderText="Forwarded To"></asp:BoundField>
                                        <asp:BoundField DataField="Comments" HeaderText="Comments"></asp:BoundField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF"></EditRowStyle>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                        <RowStyle BackColor="#EFF3FB"></RowStyle>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                                        <sortedascendingcellstyle backcolor="#F5F7FB"></sortedascendingcellstyle>
                                        <sortedascendingheaderstyle backcolor="#6D95E1"></sortedascendingheaderstyle>
                                        <sorteddescendingcellstyle backcolor="#E9EBEF"></sorteddescendingcellstyle>
                                        <sorteddescendingheaderstyle backcolor="#4870BE"></sorteddescendingheaderstyle>
                                        </asp:GridView>
                                        </center>
                                    </td>
                                </tr>
                                </table>
                                <asp:UpdatePanel ID="memo" runat="server">
                                    <ContentTemplate>
                                <table>
                                <tr>
                                    <td class="risklefttd">
                                        <div style="float: left">Remarks</div>
                                        <div style="float: right">:</div>
                                    </td>
                                    <td class="riskrighttd">
                                        <asp:TextBox ID="txtRemarksAF" runat="server" CssClass="textboxcss" Width="200px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="risklefttd">
                                        <div style="float: left">Forward To (Department)</div>
                                        <div style="float: right">:</div>
                                    </td>
                                    <td class="riskrighttd">
                                        <asp:DropDownList ID="ddlDepartment" CssClass="dropboxcss" runat="server" Width="230px" InitialValue="Choose Department" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="risklefttd">
                                        <div style="float: left">Forward To (Email)</div>
                                        <div style="float: right">:</div>
                                    </td>
                                    <td class="riskrighttd">
                                        <div style="float: left">
                                            <asp:DropDownList ID="ddlForwardToAF" CssClass="dropboxcss" InitialValue="Choose Email" runat="server" Width="230px"></asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlForwardToAF" ErrorMessage="ForwardToMissing"
                                            ForeColor="Red" ValidationGroup="b">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            
                            <asp:CheckBox ID="chkApprove" runat="server" Text="Has Approve Note ?" OnCheckedChanged="chkApprove_CheckedChanged" AutoPostBack="true" />
                            <div id="approve" runat="server" visible="false">
                                <table>
                                    <tr>
                                        <td>
                                            Approval Note
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNote" TextMode="MultiLine" CssClass="textboxcss" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div style="padding-top:5px">
                            <table>
                                <tr>
                                    <%--<td></td>--%>
                                    <td colspan="3">
                                        <asp:Button ID="btnForward" CssClass="btnMain btnGreen" runat="server" Text="Forward" OnClick="btnForward_Click" />
                                        &nbsp;<asp:Button ID="btnApprove" CssClass="btnMain btnBlue" runat="server" Text="Approve" OnClick="btnApprove_Click" />
                                        &nbsp;
                                            <asp:Button ID="btnCancel1" CssClass="btnMain btnRed" runat="server" Text="Cancel" OnClick="btnCancel1_Click" />
                                        &nbsp;<asp:Button ID="btnView" CssClass="btnMain btnGreen" runat="server" Text="ViewMemo" OnClick="btnView_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>

            </asp:View>
        </asp:MultiView>

    </div>
    <asp:Panel ID="ViewMemo" runat="server" Visible="false">
         <div>
                            <table class="tablecss">
                                <%--<tr>
                                <td colspan="3" class="header">Online Memo</td>
                            </tr>--%>
                                <tr>
                                    <td style="width: 200px">Reference No</td>
                                    <td>
                                        <asp:Label ID="vrefno" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">To</td>
                                    <td>
                                        <asp:Label ID="vTo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Initiator Dep. of HO</td>
                                    <td>
                                        <asp:Label ID="vDep" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Through</td>
                                    <td>
                                        <asp:Label ID="vThrough" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>From</td>
                                    <td>
                                        <asp:Label ID="vFrom" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Branch Code</td>
                                    <td>
                                        <asp:Label ID="vBranch" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Date</td>
                                    <td>
                                        <asp:Label ID="vCreate" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Subject</td>
                                    <td>
                                        <asp:Label ID="vSubject" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2">

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:5px">
                                        <asp:Label ID="vMemo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                               <tr>
                                    <td colspan="2">
                                        <center><asp:GridView ID="gvMemo" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%">
                                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                        <Columns>
                                        <asp:BoundField DataField="Date" HeaderText="Date"></asp:BoundField>
                                        <asp:BoundField DataField="ForwardedBy" HeaderText="Forwarded By"></asp:BoundField>
                                        <asp:BoundField DataField="ForwardedTo" HeaderText="Forwarded To"></asp:BoundField>
                                        <asp:BoundField DataField="Comments" HeaderText="Comments"></asp:BoundField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF"></EditRowStyle>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                        <RowStyle BackColor="#EFF3FB"></RowStyle>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                                        <sortedascendingcellstyle backcolor="#F5F7FB"></sortedascendingcellstyle>
                                        <sortedascendingheaderstyle backcolor="#6D95E1"></sortedascendingheaderstyle>
                                        <sorteddescendingcellstyle backcolor="#E9EBEF"></sorteddescendingcellstyle>
                                        <sorteddescendingheaderstyle backcolor="#4870BE"></sorteddescendingheaderstyle>
                                        </asp:GridView>
                                        </center>
                                    </td>
                                </tr>
                            </table>
            
                        </div>
    </asp:Panel>
     <div id="divbtn" runat="server" visible="false" style="padding-top:5px">
                            <table>
                                <tr>
                                    <%--<td></td>--%>
                                    <td colspan="3">
                                        <asp:Button ID="btnPrint" CssClass="btnMain btnBlue" runat="server" Text="Print" OnClientClick="return printpage();" OnClick="btnPrint_Click" />
                                        &nbsp;
                                            <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        
                                    </td>
                                </tr>
                            </table>
                        </div>
</asp:Content>

