<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RiskEvent.aspx.cs" Inherits="RiskEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
   
   
    <script>
        $(function () {
            $("#<%=txtDateOfIncident.ClientID %>").datepicker();
            $("#<%=txtDateOfIncident.ClientID %>").datepicker("option", "showAnim", "drop");
            $("#<%=txtDateOfFinding.ClientID %>").datepicker();
            $("#<%=txtDateOfFinding.ClientID %>").datepicker("option", "showAnim", "drop");
        });
       
    </script>
     
    <%-- forwardto --%>
        <script type="text/javascript">
         function LoadList() {
             var ds = null;
             ds = <%=listFilter %>
        $("#txtForwardTo").autocomplete({
            source: ds
        });
         }
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
     
    <div  class="contenthead">Risk Event Reporting</div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="EventView" runat="server">
             <asp:Button ID="btnNew" CssClass="btn" runat="server" Text="CreateNewEvent" OnClick="btnNew_Click" />
            <asp:GridView ID="gvRiskEvents" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="RiskId" 
                OnSelectedIndexChanged="gvRiskEvents_SelectedIndexChanged" GridLines="None" OnRowCommand="gvRiskEvents_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="S.N.">
                        <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                            <asp:HiddenField ID="hfRiskId" value='<%#Eval("RiskId") %>' runat="server" />
                    </ItemTemplate></asp:TemplateField>
                   
                    <asp:BoundField DataField="BranchCode" HeaderText="BranchCode" />
                    <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
                    <asp:BoundField DataField="CreatedOn" DataFormatString="{0:MM/dd/yyyy}" HeaderText="CreatedOn" />
                   
                    <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
                    <asp:TemplateField HeaderText="Action">
                       <ItemTemplate>
                           <asp:LinkButton ID="btnEdit"  runat="server" CommandName="EditItem"  ForeColor="#333333">Edit</asp:LinkButton>
                       </ItemTemplate>
                    </asp:TemplateField>
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
            
        </asp:View>

        <asp:View ID="CreateNew" runat="server">
           
       <asp:Button ID="btnView" CssClass="btn" runat="server" Text="ViewEvents" OnClick="btnViewEvents_Click" />
            
                <table cellpadding="0" cellspacing="0" class="tablecss"  >
        <tr>
            <td class="risklefttd">
                <div style="float:left">BranchCode</div>
                <div style="float:right">:</div>
                <asp:HiddenField ID="hfRiskIdE" runat="server" />
            </td>

           <td class="riskrighttd">
                <asp:DropDownList ID="ddlBranchCode" runat="server" cssclass="dropboxcss">
                </asp:DropDownList>
            </td>
           
           <td class="riskrighttd">
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" 
                 ErrorMessage="Select Branch" ForeColor="Red" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
            </td>
           
        </tr>
         
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
              <asp:TextBox ID="txtDateOfIncident" runat="server" cssclass="textboxcss">

                      </asp:TextBox>
            
            </td>
           
           <td class="riskrighttd">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDateOfIncident" 
                   ErrorMessage="DateOfIncident Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
            
            </td>
           
        </tr>
         <tr>
               <td class="risklefttd">
                   <div style="float:left">Date of Finding</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                
                    <asp:TextBox ID="txtDateOfFinding" runat="server" cssclass="textboxcss">

                    </asp:TextBox>
            
            </td>
           <td class="riskrighttd">
                
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDateOfFinding" 
                   ErrorMessage="DateOfFinding Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
            
            </td>
         </tr>
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
           <td class="risklefttd" >
               <div style="float:left">Forward To</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                
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
    <asp:HiddenField ID="hfUserId" runat="server" />
             
             
           </td>
           <td class="riskrighttd">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtForwardTo" ErrorMessage="ForwardTo Missing" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
            
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtForwardTo" ErrorMessage="Wrong Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a">*</asp:RegularExpressionValidator>
             
           </td>
        </tr>
         

          <tr>
              <td colspan="2" headertext="Compulsory " >
                  <asp:Label ID="lblMessage" runat="server" ForeColor="Blue"></asp:Label>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" 
HeaderText="Errors : " ShowMessageBox="true" ShowSummary="false"  ForeColor="Red" ValidationGroup="a" />
                 
              </td>
              <td >
                  &nbsp;</td>
         </tr>
         

          <tr>
              <td  >
                  <asp:Button ID="btnSubmit" style="margin-left:100px"  cssclass="btn" runat="server" Text="" OnClick="btnSubmit_Click" ValidationGroup="a" />

              </td>
           <td class="riskrighttd">
                  <asp:Button ID="btnCancel" cssclass="btn" style="margin-left:30px"  runat="server" Text="" OnClick="btnCancel_Click" />

           </td>
           <td class="riskrighttd">
                  &nbsp;</td>
         </tr>
    </table>
        </asp:View>
        

        <asp:View ID="View1" runat="server">
           
                <center><div>
             <asp:Button ID="btnCreate" CssClass="btn" runat="server" Text="CreateNewEvent" OnClick="btnNew_Click" />
             <asp:Button ID="btnview1" CssClass="btn" runat="server" Text="ViewEvents" OnClick="btnViewEvents_Click" />
                    </div>
                    <center>
          <div id="Print1" runat="server">
              <h3> NCC Bank Ltd.</h3>
              <h4> Operation Risk Event </h4>
             <table cellpadding="0" cellspacing="6px" border="1" class="tablecss"  >
        <tr>
            <td class="risklefttd">
                <div style="float:left">BranchCode</div>
                <div style="float:right">:</div>
            </td>

           <td class="riskrighttd">
               <asp:Label ID="lblBranchCode" runat="server" Text=""></asp:Label>
            </td>
           
        </tr>
         <tr>  <td class="risklefttd">
             <div style="float:left">ReferenceNo.</div>
              <div style="float:right">:</div>
               </td>
           <td class="riskrighttd">
               
               <asp:Label ID="lblReferenceNo" runat="server" Text=""></asp:Label>
            </td>
                </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">OperationRiskType</div>
                <div style="float:right">:</div>
            </td>
           <td class="riskrighttd">
                <asp:Label ID="lblRiskType" runat="server"></asp:Label>
          
            </td>
            
        </tr>
         <tr> <td class="risklefttd">
             <div style="float:left">Nature of Incident</div>
                <div style="float:right">:</div>
              </td>
           <td class="riskrighttd">
               <asp:Label ID="lblNatureOfIncident" runat="server"></asp:Label>
          
            </td>
                </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Date of Incident</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblDateOfIncident" runat="server"></asp:Label>
            
            </td>
           
        </tr>
         <tr>
               <td class="risklefttd">
                   <div style="float:left">Date of Finding</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                
                    <asp:Label ID="lblDateOfFinding" runat="server"></asp:Label>
            
            </td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Operational Risk Level</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblOperationRiskLevel" runat="server"></asp:Label>
          
            </td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Business/Function Involved</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblBusinessInvolved" runat="server"></asp:Label>
            </td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Amount(NPR) of IR</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblAmount" runat="server"></asp:Label>
            </td>
           
        </tr>
         <tr>
               <td class="risklefttd">
                   <div style="float:left">Potential Operational Loss</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblPotentialOperationalLoss" runat="server"></asp:Label>
            </td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Near Misses?</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblNearMisses" runat="server"></asp:Label>
            </td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Gross OperationalLossYTD</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblGrossOperationalLoss" runat="server"></asp:Label>
            </td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Event Detail</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblEventDetail" runat="server"></asp:Label>
            </td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Revenue Implication</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblRevenueImplication" runat="server"></asp:Label>
            </td>
         </tr>
        <tr>
            <td class="risklefttd">
                <div style="float:left">Action Taken Till Date</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblActionTakenTillDate" runat="server"></asp:Label>
            </td>
            
        </tr>
         <tr>
              <td class="risklefttd">
                  <div style="float:left">Further Plan</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
                <asp:Label ID="lblFurtherPlan" runat="server"></asp:Label>
            </td>
         </tr>
        <tr>
           <td class="risklefttd" >
               <div style="float:left">Forwarded To</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblForwardTo" runat="server"></asp:Label>
             
           </td>
        </tr>
          <tr>
           <td class="risklefttd" >
               <div style="float:left">Created By</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblCreatedBy" runat="server"></asp:Label>
             
           </td>
        </tr>
       <tr>
           <td class="risklefttd" >
               <div style="float:left">Created On</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
             
           </td>
        </tr>
                 <tr>
           <td class="risklefttd" >
               <div style="float:left">Noted By</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblNotedBy" runat="server"></asp:Label>
             
           </td>
        </tr>
       <tr>
           <td class="risklefttd" >
               <div style="float:left">Noted On</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblNotedOn" runat="server"></asp:Label>
             
           </td>
        </tr>
                 <tr>
           <td class="risklefttd" >
               <div style="float:left">Status</div>
                <div style="float:right">:</div></td>
           <td class="riskrighttd">
               <asp:Label ID="lblStatus" runat="server"></asp:Label>
             
           </td>
        </tr>
        <tr>
            <td class="risklefttd"><div style="float: left">Remarks</div><div style="float: right">:</div></td><td class="riskrighttd">
                <asp:TextBox ID="txtRemarksAF" runat="server" CssClass="textboxcss" Width="200px" TextMode="MultiLine"></asp:TextBox>
        </td></tr><tr><td class="risklefttd">
            <div style="float: left">Forward To (Email)</div>
            <div style="float: right">:</div></td><td class="riskrighttd">
                <asp:TextBox ID="txtForwarded" runat="server" CssClass="textboxcss" Width="200px"></asp:TextBox>
                
        </td></tr>

         </Table>
              </div>
                        </center>
                    </center>
                    <div> <center>
                    <table>

          <tr>
              <td class="riskrighttd" >
                  <asp:Button ID="btnOK" style="margin-left:100px"  cssclass="btn" runat="server" Text="OK" OnClick="btnOK_Click" ValidationGroup="a" />

              </td>
              <td class="riskrighttd" >
                  <asp:Button ID="btnNoted" style="margin-left:100px"  cssclass="btn" runat="server" Text="Noted" OnClick="btnNoted_Click" ValidationGroup="a" />

              </td>
           <td class="riskrighttd">
              
               <asp:Button ID="btnEdit"   cssclass="btn" runat="server" Text="Edit" OnClick="btnEdit_Click" ValidationGroup="a" />
                <asp:HiddenField ID="hfriskid" runat="server" />
           </td>
               <td class="riskrighttd">
              
               <asp:Button ID="btnPrint"   cssclass="btn" runat="server" Text="Print" OnClientClick="return printpage();"/>
           </td>
         </tr>
    </table>
              </div> 
            </center>
        </asp:View>
    </asp:MultiView>
    
     
</asp:Content>

