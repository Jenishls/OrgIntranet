<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TraceFile.aspx.cs" Inherits="TraceFile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="contenthead">
        Loan File Tracing 
        <br />
    </div>
    <asp:MultiView ID="SearchView" runat="server" ActiveViewIndex="0">
        <asp:View ID="Search" runat="server">
            <table cellpadding="0" cellspacing="0" class="tablecss">
                <tr>
                    <td>
                        <div style="float: left; margin: 10Px">ReferenceNo:</div>
                    </td>
                    <td>
                        <div style="float: left">
                            <asp:TextBox ID="txtSearchByReferenceNo" Width="150px" CssClass="textboxcss" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        <div style="float: left; margin: 10px">
                            <asp:Button CssClass="btn" ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </td>
                    <td>
                        <div style="float: left; margin: 10px">
                            <asp:Button CssClass="btn" ID="btnAdvSearch" runat="server" Text="Adv.Search" OnClientClick="window.open('Search.aspx')" OnClick="btnAdvSearch_Click" Target="_Blank" />
                        </div>
                    </td>
                    <td>
                        <div style="float: left; margin: 10px">
                            <asp:Button CssClass="btn" ID="btnReport"  runat="server" Visible="false" Text="Reports" OnClientClick="window.open('MisReports.aspx')" OnClick="btnReport_Click" Target="_Blank" />
                        </div>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View9" runat="server">
            <center>
            <div>
            <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="risklefttd">
                        <div style="float:left">BranchCode</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblBranchCodeSearch" runat="server">
        </asp:Label></td>
                </tr>
                <tr>
                    <td class="risklefttd">
                        <div style="float:left">ReferenceNo.</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblReferenceNoSearch" runat="server">
        </asp:Label></td>
                </tr>
                <tr>
                     <td class="risklefttd">
                        <div style="float:left">Loan Name</div>
                        <div style="float:right">:</div></td>
                     <td class="riskrighttd">
        <asp:Label ID="lblLoanNameSearch" runat="server">
        </asp:Label></td>
                </tr>
                <tr>
                    <td class="risklefttd"><div style="float:left">Loan Type</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblLoanTypeSearch" runat="server"></asp:Label></td></tr>
                <tr>
                    <td class="risklefttd"><div style="float:left">Limit Type</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblLimitTypeSearch" runat="server"></asp:Label></td></tr>
                 <tr>
                    <td class="risklefttd">
                        <div style="float:left">Limit: Funded (NPR)</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblLimitSearch" runat="server"></asp:Label></td></tr>
                 <tr>
                    <td class="risklefttd">
                        <div style="float:left">Limit: Non-Funded (NPR)</div><div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblLimit1Search" runat="server"></asp:Label></td></tr>
                 <tr>
                    <td class="risklefttd">
                        <div style="float:left">New/Renew</div><div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblRenewSearch" runat="server"></asp:Label></td></tr>
                <tr>
                    <td class="risklefttd">
                        <div style="float:left">Remarks (Initializer)</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd"><asp:Label ID="lblRemarksSearch" runat="server">
        </asp:Label></td></tr>
                <tr>
                    <td class="risklefttd" >
                        <div style="float:left">Last Forwarded To</div><div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblForwardToSearch" runat="server"></asp:Label></td></tr>
                <tr>
                    <td class="risklefttd" >
                        <div style="float:left">Created By</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblCreatedBySearch" runat="server"></asp:Label></td></tr>
                <tr>
                    <td class="risklefttd" >
                        <div style="float:left">Created On</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblCreatedOnSearch" runat="server"></asp:Label></td></tr>
                <tr>
                    <td class="risklefttd" >
                        <div style="float:left">Status</div>
                        <div style="float:right">:</div></td>
                    <td class="riskrighttd">
        <asp:Label ID="lblStatusSearch" runat="server"></asp:Label></td></tr><tr>
                    <td colspan="2"  >
                        <center><p class="contenthead">Forward History</p></center></td></tr>
                <tr>
                    <td colspan="2" >
        <asp:GridView ID="gvFileTraceHistorySearch" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"><AlternatingRowStyle BackColor="White" />
            <Columns>
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:BoundField DataField="ForwardedBy" HeaderText="Forwarded By" />
        <asp:BoundField DataField="ForwardedTo" HeaderText="Forwarded To" />
        <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
            </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView></td></tr>
                <tr>
                    <td colspan="2"  >
        <center>
        <asp:Button ID="btnbacksearch"   cssclass="btn" runat="server" Text="Back" OnClick="btnbacksearch_Click" />
        </center></td></tr>
        </table></div></center>
        </asp:View>
        </asp:MultiView>
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssTheme="XP">
        <cc1:TabPanel runat="server" HeaderText="Loan Apply" ID="TabPanel1">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Loan Apply </p></panel>
            </HeaderTemplate>
            <ContentTemplate>
                <panel><table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="risklefttd"><div style="float:left">BranchCode </div>
                        <div style="float:right">:</div></td><td class="riskrighttd">
                        <asp:DropDownList ID="ddlBranchCode" runat="server" cssclass="dropboxcss">
                        </asp:DropDownList></td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch" 
                        ForeColor="Red" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td></tr>
                 <tr>
                     <td class="risklefttd"><div style="float:left">Loan Name</div>
                        <div style="float:right">:</div></td><td class="riskrighttd">
                        <asp:TextBox ID="txtLoanName"  runat="server"  cssclass="textboxcss"></asp:TextBox></td>
                    <td class="riskrighttd"></td></tr>
                     <tr>
                        <td class="risklefttd">
                            <div style="float:left">Loan Type</div>
                            <div style="float:right">:</div></td>
                        <td class="riskrighttd">
                         <asp:DropDownList ID="ddlLoanType" runat="server" cssclass="dropboxcss">
                            <asp:ListItem>Non- Funded</asp:ListItem>
                            <asp:ListItem>Overdraft</asp:ListItem>
                            <asp:ListItem>Cash Credit</asp:ListItem>
                            <asp:ListItem>Trem Loan</asp:ListItem>
                            <asp:ListItem>Export Loan</asp:ListItem>
                            <asp:ListItem>Trust Receipt Loan</asp:ListItem>
                            <asp:ListItem>Demand Loan/STL</asp:ListItem>
                            <asp:ListItem>Consortium Loan</asp:ListItem>
                            <asp:ListItem>Deprived Sector-Inst.</asp:ListItem>
                            <asp:ListItem>Deprived Sector-Other</asp:ListItem>
                            <asp:ListItem>Loan Against Govt. Bonds</asp:ListItem>
                            <asp:ListItem>Loan Against FDR</asp:ListItem>
                            <asp:ListItem>Loan Against Shares</asp:ListItem>
                            <asp:ListItem>Personal Loan/Others</asp:ListItem>
                            <asp:ListItem>Home Loan- Upto 5 Yrs.</asp:ListItem>
                            <asp:ListItem>Home Loan- 5 Yrs. to 10 Yrs.</asp:ListItem>
                            <asp:ListItem>Home Loan- Above 10 Yrs.</asp:ListItem>
                            <asp:ListItem>Comm. HP Loan</asp:ListItem>
                            <asp:ListItem>Vehicle Loan</asp:ListItem>
                            <asp:ListItem>Education Loan</asp:ListItem>
                            <asp:ListItem>Professional Loan</asp:ListItem>
                            <asp:ListItem>K & L Uddyami Karja</asp:ListItem>
                            <asp:ListItem>Saral Karja</asp:ListItem>
                            <asp:ListItem>Foreign Emp. Loan</asp:ListItem>
                            <asp:ListItem>Small Agr. Loan</asp:ListItem>
                            <asp:ListItem>Small Business Loan</asp:ListItem>
                            <asp:ListItem>Loan Against Loan</asp:ListItem>
			    <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList></td><td class="riskrighttd">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlLoanType" ErrorMessage="Select Loan Type" 
                  ForeColor="Red" InitialValue="Choose Type" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                        <td class="riskrighttd">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="risklefttd">
                            <div style="float:left">Limit Type</div>
                            <div style="float:right">:</div></td>
                        <td class="riskrighttd">
                         <asp:DropDownList ID="ddlLimitType" OnSelectedIndexChanged="ddlLimitType_SelectedIndexChanged" AutoPostBack="True" runat="server" cssclass="dropboxcss">
                         <asp:ListItem>Funded</asp:ListItem>
                         <asp:ListItem>Non-Funded</asp:ListItem>
                         <asp:ListItem>Both</asp:ListItem>
                         <asp:ListItem>Others</asp:ListItem>
                         </asp:DropDownList></td><td class="riskrighttd">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlLimitType" ErrorMessage="Select Limit Type" 
                  ForeColor="Red" InitialValue="Choose Type" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                        <td class="riskrighttd">&nbsp;</td>
                    </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float:left">Limit: Funded</div>
                                <div style="float:right">:</div>(NPR) </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtLimit" runat="server" Visible="False" ToolTip="Please enter full amount without ','" cssclass="textboxcss" ></asp:TextBox></td>
                            <td class="riskrighttd">&nbsp; </td></tr>
                        <tr>
                            
                            <td class="risklefttd">
                                <div style="float:left">Limit: Non-Funded</div>
                                <div style="float:right">:</div>(NPR) </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtLimit1" runat="server" Visible="False" ToolTip="Please enter full amount without ','" cssclass="textboxcss" ></asp:TextBox></td>
                            <td class="riskrighttd">&nbsp; </td>
                        </tr> 
                             <tr>
                        <td class="risklefttd">
                            <div style="float:left">New/Renew</div>
                            <div style="float:right">:</div></td>
                        <td class="riskrighttd">
                         <asp:DropDownList ID="ddlRenew" runat="server" cssclass="dropboxcss">
                         <asp:ListItem>New</asp:ListItem>
                         <asp:ListItem>Renew</asp:ListItem>
                         </asp:DropDownList></td><td class="riskrighttd">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlRenew" ErrorMessage="Choose One" 
                  ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                        <td class="riskrighttd">&nbsp;</td>
                    </tr>
                        <tr>
                                <td class="risklefttd">
                                    <div style="float:left">Remarks</div>
                                    <div style="float:right">:</div></td>
                                <td class="riskrighttd">
                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" cssclass="textboxcss"></asp:TextBox></td>
                                <td class="riskrighttd">&nbsp;</td></tr>
                        <tr>
                                    <td class="risklefttd" ><div style="float:left">Forward To</div>
                                        <div style="float:right">:</div></td><td class="riskrighttd">
                                            <script src="js/jquery.min.js" type="text/javascript"></script>
                                            <script src="js/jquery-ui.min.js"type="text/javascript"></script>
                                            <link href="js/jquery-ui.css"rel="Stylesheet" type="text/css" />
                                            <script type="text/javascript">
                                                $(function () {
                                                    $("[id$=txtForwardTo]").autocomplete({
                                                        source:
                                                        function (request, response) {
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
    </script><asp:TextBox ID="txtForwardTo" runat="server" cssclass="textboxcss" ></asp:TextBox>
                                            <asp:HiddenField ID="hfUserId" runat="server" /></td><td class="riskrighttd">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtForwardTo" ErrorMessage="ForwardTo Missing" 
            ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtForwardTo" ErrorMessage="Wrong Email" 
            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a">*</asp:RegularExpressionValidator></td></tr><tr>
                <td colspan="2" headertext="Compulsory " ><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                HeaderText="Errors : " ShowMessageBox="True" ShowSummary="False"  ForeColor="Red" ValidationGroup="a" /></td>
                <td >&nbsp;</td></tr><tr>
                    <td  ><asp:Button ID="btnSubmit" style="margin-left:100px"  cssclass="btn" runat="server" OnClick="btnSubmit_Click" ValidationGroup="a" /></td><td >
                        <asp:Button ID="btnCancel" cssclass="btn" style="margin-left:30px"  runat="server" OnClick="btnCancel_Click" /></td>
                    <td class="riskrighttd">&nbsp;</td></tr></table></panel>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Pending Files">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Pending Files </p></panel>
            </HeaderTemplate>
            <ContentTemplate>
                <panel><asp:MultiView ID="PendingView" runat="server" ActiveViewIndex="0">
    <asp:View ID="View5" runat="server"><center>
        <asp:GridView ID="gvPending" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="ReferenceNo" 
            OnSelectedIndexChanged="gvPending_SelectedIndexChanged" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate></asp:TemplateField>
                <asp:BoundField DataField="BranchCode" HeaderText="Branch" />
                <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
                <asp:BoundField DataField="LoanName" HeaderText="Loanee Name" />
                <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" />
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
                <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/Image/view.jpg" SelectText="View" /></Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView></center></asp:View>
    <asp:View ID="View6" runat="server"></asp:View>
    <asp:View ID="View7" runat="server">
        <center>
            <div>
                <table cellpadding="0" cellspacing="0" class="tablecss"  ><tr>
                    <td class="risklefttd"><div style="float:left">BranchCode</div>
                        <div style="float:right">:</div></td><td class="riskrighttd">
                            <asp:Label ID="lblBranchCodePending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                <div style="float:left">ReferenceNo.</div><div style="float:right">:</div></td><td class="riskrighttd">
                                    <asp:Label ID="lblReferenceNoPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                        <div style="float:left">Loan Name</div><div style="float:right">:</div></td><td class="riskrighttd">
                                            <asp:Label ID="lblLoanNamePending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                <div style="float:left">Loan Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                    <asp:Label ID="lblLoanTypePending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                         <div style="float:left">Limit Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                    <asp:Label ID="lblLimitTypePending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                        <div style="float:left">Funded Limit (NPR)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblLimitPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Non-Funded Limit (NPR)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblLimit1Pending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">New/Renew</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblRenewPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Remarks (Initializer)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                    <asp:Label ID="lblRemarksPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                        <div style="float:left">Last Forwarded To</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                            <asp:Label ID="lblForwardToPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                <div style="float:left">Created By</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                    <asp:Label ID="lblCreatedByPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                        <div style="float:left">Created On</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                            <asp:Label ID="lblCreatedOnPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                                <div style="float:left">Status</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                                    <asp:Label ID="lblStatusPending" runat="server"></asp:Label></td></tr><tr><td colspan="2"  >
         <center><p class="contenthead">Forward History</p></center></td></tr><tr>
             <td colspan="2" > <center><asp:GridView ID="gvFileTraceHistoryPending" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
                 <AlternatingRowStyle BackColor="White" /><Columns>
                     <asp:BoundField DataField="Date" HeaderText="Date" />
                     <asp:BoundField DataField="ForwardedBy" HeaderText="Forwarded By" />
                     <asp:BoundField DataField="ForwardedTo" HeaderText="Forwarded To" />
                     <asp:BoundField DataField="Remarks" HeaderText="Remarks" /></Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EFF3FB" />
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
                              </asp:GridView> </center> </td></tr><tr><td colspan="2"  >
                                  <center><asp:Button ID="btnPending"   cssclass="btn" runat="server" Text="Back" OnClick="btnBack_Click" />
                                  </center></td></tr></table></div></center></asp:View></asp:MultiView></panel>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Approved/Rejected Files">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Approved/Rejected Files </p></panel>
            </HeaderTemplate>
            <ContentTemplate>
                <panel><asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"><asp:View ID="EventView" runat="server">
    <center><asp:GridView ID="gvApprovedTraceFile" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        DataKeyNames="ReferenceNo" OnSelectedIndexChanged="gvApprovedTraceFile_SelectedIndexChanged" GridLines="None" 
        OnRowCommand="gvApprovedTraceFile_RowCommand"><AlternatingRowStyle BackColor="White" />
        <Columns><asp:TemplateField HeaderText="S.N."><ItemTemplate> </ItemTemplate>
                 </asp:TemplateField>
            <asp:BoundField DataField="BranchCode" HeaderText="Branch" />
            <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
            <asp:BoundField DataField="LoanName" HeaderText="Loanee Name" />
            <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/Image/view.jpg" SelectText="View" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView></center></asp:View>
    <asp:View ID="CreateNew" runat="server"></asp:View>
    <asp:View ID="View1" runat="server">
        <center><div><table cellpadding="0" cellspacing="0" class="tablecss"  ><tr><td class="risklefttd">
            <div style="float:left">BranchCode</div><div style="float:right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblBranchCode" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                    <div style="float:left">ReferenceNo.</div><div style="float:right">:</div></td><td class="riskrighttd">
                        <asp:Label ID="lblReferenceNo" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                            <div style="float:left">Loan Name</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblLoanName" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Loan Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                                        <asp:Label ID="lblLoanType" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                            <div style="float:left">Limit Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                                        <asp:Label ID="lblLimitType" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                            <div style="float:left">Funded Limit (NPR)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                <asp:Label ID="lblLimit" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                    <div style="float:left">Non-Funded Limit (NPR)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                <asp:Label ID="lblLimit1" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                    <div style="float:left">New/Renew</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                <asp:Label ID="lblRenew" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                    <div style="float:left">Remarks (Initializer)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                        <asp:Label ID="lblRemarks" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                            <div style="float:left">Last Forwarded To</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                <asp:Label ID="lblForwardTo" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                    <div style="float:left">Created By</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                        <asp:Label ID="lblCreatedBy" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                            <div style="float:left">Created On</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                <asp:Label ID="lblCreatedOn" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                    <div style="float:left">Status</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                        <asp:Label ID="lblStatus" runat="server"></asp:Label></td></tr>
        <tr><td class="risklefttd" ><div style="float:left">Approved/RejectedBy</div><div style="float:right">:</div></td>
            <td class="riskrighttd"><asp:Label ID="lblApprovedBy" runat="server"></asp:Label></td></tr>
        <tr><td class="risklefttd" ><div style="float:left">Approved/RejectedOn</div><div style="float:right">:</div></td>
            <td class="riskrighttd"><asp:Label ID="lblApprovedOn" runat="server"></asp:Label></td></tr>
        <tr><td colspan="2"  ><center><p class="contenthead">Forward History</p></center></td></tr>
            <tr><td colspan="2" ><center> <asp:GridView ID="gvFileTraceHistory" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" /><Columns><asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="ForwardedBy" HeaderText="Forwarded By" />
                    <asp:BoundField DataField="ForwardedTo" HeaderText="Forwarded To" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" /></Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                 </asp:GridView></center> </td></tr>
            <tr><td colspan="2"  ><center>
                <asp:Button ID="btnBack"   cssclass="btn" runat="server" Text="Back" OnClick="btnBack_Click" />
                                  </center></td></tr></table></div></center></asp:View></asp:MultiView></panel>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanelAF" runat="server" HeaderText="Forward/Approve">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Forward/Approve </p></panel>
            </HeaderTemplate>
            <ContentTemplate>
                <panel><asp:MultiView ID="AFView" runat="server" ActiveViewIndex="0"><asp:View ID="View2" runat="server"><center>
    <asp:GridView ID="gvAF" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="ReferenceNo" 
        OnSelectedIndexChanged="gvAF_SelectedIndexChanged" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:TemplateField HeaderText="S.N."><ItemTemplate><%#Container.DataItemIndex+1 %> 
        </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="BranchCode" HeaderText="Branch" />
            <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
        <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
            <asp:BoundField DataField="LoanName" HeaderText="Loanee Name" />
        <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" />
        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
        <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/Image/view.jpg" SelectText="View" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </center></asp:View>
        <asp:View ID="View3" runat="server"></asp:View>
        <asp:View ID="View4" runat="server"><center><div><table cellpadding="0" cellspacing="0" class="tablecss"><tr><td class="risklefttd">
            <div style="float: left">BranchCode</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblBranchCodeAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
            <div style="float: left">ReferenceNo.</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblReferenceNoAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
            <div style="float: left">Loan Name</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblLoanNameAF" runat="server"></asp:Label></td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">Loan Type</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblLoanTypeAF" runat="server"></asp:Label>
        </td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">Limit Type</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblLimitTypeAF" runat="server"></asp:Label>
        </td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">Funded Limit (NPR)</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblLimitAF" runat="server"></asp:Label>
        </td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">Non-Funded Limit (NPR)</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblLimit1AF" runat="server"></asp:Label>
        </td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">New/Renew</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblRenewAF" runat="server"></asp:Label>
        </td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">Remarks (Initializer)</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblRemarksAF" runat="server"></asp:Label>
        </td></tr>
            <tr><td class="risklefttd">
            <div style="float: left">Last Forwarded To</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblForwardToAF" runat="server"></asp:Label>
        </td></tr><tr><td class="risklefttd">
            <div style="float: left">Created By</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblCreatedByAF" runat="server"></asp:Label>
        </td></tr><tr><td class="risklefttd">
            <div style="float: left">Created On</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblCreatedOnAF" runat="server"></asp:Label>
        </td></tr><tr><td class="risklefttd">
            <div style="float: left">Status</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblStatusAF" runat="server"></asp:Label>
        </td></tr>
            <tr><td colspan="2"><center><p class="contenthead">Forward History</p></center></td></tr><tr>
            <td colspan="2"><center><asp:GridView ID="gvFileTraceHistoryAF" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        <Columns>
        <asp:BoundField DataField="Date" HeaderText="Date"></asp:BoundField>
        <asp:BoundField DataField="ForwardedBy" HeaderText="Forwarded By"></asp:BoundField>
        <asp:BoundField DataField="ForwardedTo" HeaderText="Forwarded To"></asp:BoundField>
        <asp:BoundField DataField="Remarks" HeaderText="Remarks"></asp:BoundField>
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
        </center></td></tr>
            <tr>
            <td class="risklefttd"><div style="float: left">Remarks</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:TextBox ID="txtRemarksAF" runat="server" CssClass="textboxcss" Width="200px" TextMode="MultiLine"></asp:TextBox>
        </td></tr><tr><td class="risklefttd">
            <div style="float: left">Forward To (Department)</div>
            <div style="float: right">:</div></td><td class="riskrighttd">
                <asp:DropDownList ID="ddlDepartment" CssClass="dropboxcss" runat="server" Width="230px" InitialValue="Choose Department" AutoPostBack="True" 
                    OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
        </td></tr><tr><td class="risklefttd">
            <div style="float: left">Forward To (Email)</div>
            <div style="float: right">:</div></td><td class="riskrighttd">
                <div style="float:left">
                  <asp:DropDownList ID="ddlForwardToAF" CssClass="dropboxcss" InitialValue="Choose Email" runat="server" Width="230px"></asp:DropDownList>
                </div><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlForwardToAF" ErrorMessage="ForwardToMissing" 
                    ForeColor="Red" ValidationGroup="b">*</asp:RequiredFieldValidator>
        </td></tr><tr><td><center><div style="float: left;margin-left:30px"><asp:Button ID="btnBackAF" runat="server" CssClass="btn" 
            OnClick="btnBack_Click" style="margin-left: 10px" Text="Back"></asp:Button>
        </div><div style="float: right"><asp:Button ID="btnForward" runat="server" CssClass="btn" 
            OnClick="btnForward_Click" style="float: left; margin-left: 10px" Text="Forward" ValidationGroup="b"></asp:Button>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" HeaderText="Errors : " ShowMessageBox="True" ShowSummary="False" ValidationGroup="b"></asp:ValidationSummary>
        </div></center></td><td><div style="float: left">
            <asp:Button ID="btnApprove" runat="server" Visible="False" CssClass="btn" OnClick="btnApprove_Click" style="margin-left: 10px" Text="Approve"></asp:Button>
        </div><div style="float: left">
            <asp:Button ID="btnReject" runat="server" Visible="False" CssClass="btn" OnClick="btnReject_Click" style="margin-left: 10px" Text="Reject"></asp:Button>
        </div></td></tr></table></div></center></asp:View>
        </asp:MultiView>
        </panel>
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        if ($('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLoanType').val() == 'Others') {
            $('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLimitType option').each(function () {
                if ($(this).val() != 'Others') {
                    $(this).attr('disabled', 'disabled');
                }
                else {
                    $(this).removeAttr('disabled');
                }
            });
        }
        else {
            $('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLimitType option').each(function () {
                if ($(this).val() != 'Others') {
                    $(this).removeAttr('disabled');
                }
                else {
                    $(this).attr('disabled', 'disabled');
                }
            });
        }

        $('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLoanType').change(function (event) {
            event.preventDefault();
            $('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLimitType option:selected').removeAttr('selected');
            if ($(this).val() == 'Others') {

                $('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLimitType option').each(function () {
                    if ($(this).val() != 'Others') {
                        $(this).attr('disabled', 'disabled');
                    }
                    else {
                        $(this).removeAttr('disabled');
                    }
                });
            }
            else {
                $('#ContentPlaceHolder1_TabContainer1_TabPanel1_ddlLimitType option').each(function () {
                    if ($(this).val() != 'Others') {
                        $(this).removeAttr('disabled');
                    }
                    else {
                        $(this).attr('disabled', 'disabled');
                    }
                });
            }
        });
    });
    </script>
        </asp:Content>
	



