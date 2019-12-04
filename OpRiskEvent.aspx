<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OpRiskEvent.aspx.cs" Inherits="OpRiskEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <script>
        $(function () {
            $("#<%=txtDateOfIncident.ClientID %>").datepicker({ changeMonth: true, changeYear: true, numberOfMonths: 1 });
            $("#<%=txtDateOfIncident.ClientID %>").datepicker("option", "showAnim", "drop");
            $("#<%=txtDateOfFinding.ClientID %>").datepicker({ changeMonth: true, changeYear: true, numberOfMonths: 1 });
            $("#<%=txtDateOfFinding.ClientID %>").datepicker("option", "showAnim", "drop");
        });

    </script>
    <script>
        function printpage() {

            var getpanel = document.getElementById("<%= Print1.ClientID%>");
            var MainWindow = window.open('', '', 'height=600,width=800');
            MainWindow.document.write('<html><head><title>Ncc Bank Ltd - Operation Risk Event</title>');
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
    <script>
        function printpage1() {

            var getpanel = document.getElementById("<%= Print2.ClientID%>");
            var MainWindow = window.open('', '', 'height=600,width=800');
            MainWindow.document.write('<html><head><title>Ncc Bank Ltd - Operation Risk Event</title>');
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
    <div class="contenthead">
        Operation Risk Event 
        <br />
    </div>
   
    
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssTheme="XP" CssClass="ui-tabs-nav" padding="10px">
        <cc1:TabPanel runat="server" HeaderText="Create Event" ID="TabPanel1">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Create Event </p></panel>
            </HeaderTemplate>
            <ContentTemplate>
                <panel>
                    <table cellpadding="0" cellspacing="0" class="tablecss"  >
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
            <td class="risklefttd">
                <div style="float:left">OperationRiskType</div>
                <div style="float:right">:</div>
            </td>
           <td class="riskrighttd">
                <asp:DropDownList ID="ddlOperationRiskType" runat="server" cssclass="dropboxcss">
                </asp:DropDownList>
          
            </td>
            
           <td class="riskrighttd">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlOperationRiskType" 
                    ErrorMessage="Choose Operational Risk Type" ForeColor="Red" InitialValue="Choose Operational Risk Type" ValidationGroup="a"> *</asp:RequiredFieldValidator>
          
            </td>
            
        </tr>
         <tr> <td class="risklefttd">
             <div style="float:left">Nature of Incident</div>
                <div style="float:right">:</div>
              </td>
           <td class="riskrighttd">
               <asp:DropDownList ID="ddlNatureOfIncident" runat="server" cssclass="dropboxcss">
                </asp:DropDownList>
          
            </td>
           <td class="riskrighttd">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlNatureOfIncident" 
                    ErrorMessage="Choose Nature Of Incident" ForeColor="Red" InitialValue="Choose Nature Of Incident" ValidationGroup="a">*</asp:RequiredFieldValidator>
          
            </td></tr>
        <tr>
                        <td class="risklefttd">
                            <div style="float:left">Date of Incident</div>
                            <div style="float:right">:</div></td>
                       <td class="riskrighttd">
                          <asp:TextBox ID="txtDateOfIncident" runat="server" cssclass="textboxcss"></asp:TextBox></td>
                       <td class="riskrighttd">
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDateOfIncident" 
                               ErrorMessage="DateOfIncident Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td></tr>
                    <tr>
                       <td class="risklefttd">
                            <div style="float:left">Date of Finding</div>
                            <div style="float:right">:</div></td>
                       <td class="riskrighttd">
                           <asp:TextBox ID="txtDateOfFinding" runat="server" cssclass="textboxcss"></asp:TextBox></td>
                       <td class="riskrighttd">
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDateOfFinding" 
                               ErrorMessage="DateOfFinding Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator></td></tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Operational Risk Level</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:DropDownList ID="ddlOperationRiskLevel" runat="server" cssclass="dropboxcss">
                </asp:DropDownList>
          
            </td>
            
           <td class="riskrighttd">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ControlToValidate="ddlOperationRiskLevel" 
                    ErrorMessage="Choose Risk Level" ForeColor="Red" InitialValue="Choose Risk Level" ValidationGroup="a">*</asp:RequiredFieldValidator>
          
            </td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Business/Function Involved</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtBusinessInvolved" runat="server" cssclass="textboxcss"></asp:TextBox>
            </td>
           <td class="riskrighttd">
                &nbsp;</td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Amount(NPR) of IR</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtAmount" runat="server" cssclass="textboxcss"></asp:TextBox>
            </td>
           
           <td class="riskrighttd">
                &nbsp;</td>
           
        </tr>
         <tr>
               <td class="risklefttd">
                   <div style="float:left">Potential Operational Loss</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtPotentialOperationalLoss" runat="server" cssclass="textboxcss"></asp:TextBox>
            </td>
           <td class="riskrighttd">
                &nbsp;</td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Near Misses?</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtNearMisses" runat="server" cssclass="textboxcss"></asp:TextBox>
            </td>
            
           <td class="riskrighttd">
                &nbsp;</td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Gross OperationalLossYTD</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtGrossOperationalLoss" runat="server" cssclass="textboxcss"></asp:TextBox>
            </td>
           <td class="riskrighttd">
                &nbsp;</td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Event Detail</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtEventDetail" runat="server" cssclass="textboxcss" TextMode="MultiLine"></asp:TextBox>
            </td>
            
           <td class="riskrighttd">
                &nbsp;</td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Revenue Implication</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtRevenueImplication" runat="server" cssclass="textboxcss"></asp:TextBox>
            </td>
           <td class="riskrighttd">
                &nbsp;</td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Action Taken Till Date</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtActionTakenTillDate" runat="server" cssclass="textboxcss" TextMode="MultiLine"></asp:TextBox>
            </td>
            
           <td class="riskrighttd">
                &nbsp;</td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Further Plan</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtFurtherPlan" runat="server" cssclass="textboxcss" TextMode="MultiLine"></asp:TextBox>
            </td>
           <td class="riskrighttd">
                &nbsp;</td>
         </tr>
                    <tr>
              <td class="risklefttd">
                  <div style="float:left">Remarks</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtRemarks" runat="server" cssclass="textboxcss" TextMode="MultiLine"></asp:TextBox>
            </td>
           <td class="riskrighttd">
                &nbsp;</td>
         </tr>
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
                        <asp:Button ID="btnCancel" cssclass="btn" style="margin-left:150px"  runat="server" OnClick="btnCancel_Click" /></td>
                    <td class="riskrighttd">&nbsp;</td></tr></table></panel>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Pending Events">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Pending Events </p></panel>
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
                <asp:BoundField DataField="NOI" HeaderText="Nature Of Incident" />
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
                                        <div style="float:left">Operation Risk Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                                            <asp:Label ID="lblORTPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                <div style="float:left">Nature of Incident</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                    <asp:Label ID="lblNOIPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                         <div style="float:left">Date of Incident</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                    <asp:Label ID="lblDOIPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                        <div style="float:left">Date of Finding</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblDOFPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Operational Risk Level</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblORLPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <%--<div style="float:left">Business/Function Involved</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblBFIPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Amount(NPR) of IR</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblAIRPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Potential Operational Loss</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblPOLPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Gross OperationalLossYTD</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblGOPLYTDPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Event Detail</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblEDPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Revenue Implication</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblRIPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Action Taken Till Date</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblATTDPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Further Plan</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblFPPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Remarks (Initializer)</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                    <asp:Label ID="lblRemarksPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >--%>
                                                                        <div style="float:left">Last Forwarded To</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                            <asp:Label ID="lblForwardToPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                <div style="float:left">Created By</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                    <asp:Label ID="lblCreatedByPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                        <div style="float:left">Created On</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                            <asp:Label ID="lblCreatedOnPending" runat="server"></asp:Label></td></tr><tr><td class="risklefttd" >
                                                                                                <div style="float:left">Status</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                                                                    <asp:Label ID="lblStatusPending" runat="server"></asp:Label></td></tr><tr><td colspan="2"  >
         <center><p class="contenthead">Forward History</p></center></td></tr><tr>
             <td colspan="2" > <center><asp:GridView ID="gvEventHistoryPending" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
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
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Noted Event">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Noted Event </p></panel>
            </HeaderTemplate>
            <ContentTemplate>
                <panel><asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"><asp:View ID="EventView" runat="server">
    <center><asp:GridView ID="gvNotedEvent" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        DataKeyNames="ReferenceNo" OnSelectedIndexChanged="gvNotedEvent_SelectedIndexChanged" GridLines="None" 
        OnRowCommand="gvNotedEvent_RowCommand"><AlternatingRowStyle BackColor="White" />
        <Columns><asp:TemplateField HeaderText="S.N."><ItemTemplate> <%#Container.DataItemIndex+1 %> </ItemTemplate>
                 </asp:TemplateField>
            <asp:BoundField DataField="BranchCode" HeaderText="Branch" />
            <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
            <asp:BoundField DataField="NOI" HeaderText="Nature Of incident" />
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
        <center>
            <div>
                <div id="Print1" runat="server">
                <table cellpadding="0" cellspacing="0" class="tablecss"  ><tr><td class="risklefttd">
                    <div style="float:left">BranchCode</div><div style="float:right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblBranchCode" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                    <div style="float:left">ReferenceNo.</div><div style="float:right">:</div></td><td class="riskrighttd">
                        <asp:Label ID="lblReferenceNo" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                             <div style="float:left">Operation Risk Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                                            <asp:Label ID="lblORT" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                <div style="float:left">Nature of Incidente</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                    <asp:Label ID="lblNOI" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                         <div style="float:left">Date of Incident</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                    <asp:Label ID="lblDOI" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                        <div style="float:left">Date of Finding</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblDOF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Operational Risk Level</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblORL" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Business/Function Involved</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblBFI" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Amount(NPR) of IR</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblAIR" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Potential Operational Loss</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblPOL" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Gross OperationalLossYTD</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblGOLYTD" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Event Detail</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblED" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Revenue Implication</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblRI" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Action Taken Till Date</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblATTD" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                                                <div style="float:left">Further Plan</div><div style="float:right">:</div></td><td class="riskrighttd">
                                                            <asp:Label ID="lblFP" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
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
        <tr><td class="risklefttd" ><div style="float:left">Noted By</div><div style="float:right">:</div></td>
            <td class="riskrighttd"><asp:Label ID="lblApprovedBy" runat="server"></asp:Label></td></tr>
        <tr><td class="risklefttd" ><div style="float:left">Noted On</div><div style="float:right">:</div></td>
            <td class="riskrighttd"><asp:Label ID="lblApprovedOn" runat="server"></asp:Label></td></tr>
                    
        <tr><td colspan="2"  ><center><p class="contenthead">Forward History</p></center></td></tr>
            <tr><td colspan="2" ><center> <asp:GridView ID="gvEventHistory" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
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
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                 </asp:GridView></center> </td></tr>
                    </table></div>
                <div>
                    <table>
            <tr><td colspan="2"  ><center>
                <asp:Button ID="btnBack"   cssclass="btn" runat="server" Text="Back" OnClick="btnBack_Click" />
                <asp:Button ID="btnPrint"   cssclass="btn" runat="server" Text="Print" style="margin-left: 60px" OnClientClick="return printpage();"/>
                                  </center></td></tr></div>
                </table></div></center></asp:View></asp:MultiView></panel>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanelAF" runat="server" HeaderText="Forward/Noted">
            <HeaderTemplate>
                <panel><p style="color:black;font-weight:bold">Forward/Note </p></panel>
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
            <asp:BoundField DataField="NOI" HeaderText="Nature Of Incident" />
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
        <asp:View ID="View4" runat="server">
            <center>
                <div>
                    <div id="Print2" runat="server">
                    <table cellpadding="0" cellspacing="0" class="tablecss"><tr><td class="risklefttd">
            <div style="float: left">BranchCode</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblBranchCodeAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
            <div style="float: left">ReferenceNo.</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblReferenceNoAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
            <div style="float:left">Operation Risk Type</div><div style="float:right">:</div></td><td class="riskrighttd">
                <asp:Label ID="lblORTAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                    <div style="float:left">Nature of Incidente</div><div style="float:right">:</div></td><td class="riskrighttd">
                        <asp:Label ID="lblNOIAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                <div style="float:left">Date of Incident</div><div style="float:right">:</div></td><td class="riskrighttd">
                        <asp:Label ID="lblDOIAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                            <div style="float:left">Date of Finding</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblDOFAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Operational Risk Level</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblORLAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Business/Function Involved</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblBFIAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Amount(NPR) of IR</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblAIRAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Potential Operational Loss</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblPOLAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Gross OperationalLossYTD</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblGOLYTDAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Event Detail</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblEDAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Revenue Implication</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblRIAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Action Taken Till Date</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblATTDAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
                                    <div style="float:left">Further Plan</div><div style="float:right">:</div></td><td class="riskrighttd">
                                <asp:Label ID="lblFPAF" runat="server"></asp:Label></td></tr><tr><td class="risklefttd">
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
        </td></tr><tr><td colspan="2"><center><p class="contenthead">Forward History</p></center></td></tr><tr>
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
        </center></td></tr></table>
                        </div>
                     <table cellpadding="0" cellspacing="0" class="tablecss">   
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
        </div>
            <div style="float: right"><asp:Button ID="btnForward" runat="server" CssClass="btn" 
            OnClick="btnForward_Click" style="float: left; margin-left: 10px" Text="Forward" ValidationGroup="b"></asp:Button>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" HeaderText="Errors : " ShowMessageBox="True" ShowSummary="False" ValidationGroup="b"></asp:ValidationSummary>
        </div></center></td><td><div style="float: left">
            <asp:Button ID="btnApprove" runat="server" Visible="false" CssClass="btn" OnClick="btnApprove_Click" style="margin-left: 10px" Text="Approve"></asp:Button>
            <asp:Button ID="btnPrint1"   cssclass="btn" runat="server" Text="Print" style="margin-left: 200px"  OnClientClick="return printpage1();"/>
        </div>
            <div style="float: left">
             
        </div></td></tr></table></div></center></asp:View>
        </asp:MultiView>
        </panel>
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>
        </asp:Content>

