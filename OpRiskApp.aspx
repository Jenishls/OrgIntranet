<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OpRiskApp.aspx.cs" Inherits="OpRiskApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:Button ID="btnRPT" runat="server" Visible="false" CssClass="btn" OnClick="btnRPT_Click" style="margin-left: 0%;" Text="Get Report"></asp:Button>
    <asp:Panel ID="Panel2" runat="server">
       <div style="color: blue; font-weight: bold; padding-left: 5em; padding-top:1em">Filter Report</div>
        <div style="font-family: Verdana; font-size: .9em; padding-left: 5em;">
        <table class="tablecss">
          <tr>
              <td class="risklefttd">
                  <div style="float: left">Branch Code</div>
                  <div style="float: right">:</div>
              </td>
              <td class="riskrighttd">
                 <asp:TextBox ID="txtBranchCode" CssClass="textboxcss" Width="50px" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="risklefttd">
                  <div style="float: left">Year</div>
                  <div style="float: right">:</div>
              </td>
              <td class="riskrighttd">
                  <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropboxcss">
                      <asp:ListItem>2074</asp:ListItem>
                      <asp:ListItem>2075</asp:ListItem>
                      <asp:ListItem>2076</asp:ListItem>
                      <asp:ListItem>2077</asp:ListItem>
                  </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td class="risklefttd">
                  <div style="float: left">Month</div>
                  <div style="float: right">:</div>
              </td>
              <td class="riskrighttd">
                  <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropboxcss">
                      
                      <asp:ListItem>Choose Month</asp:ListItem>
                      <asp:ListItem>Baishakh</asp:ListItem>
                      <asp:ListItem>Jestha</asp:ListItem>
                      <asp:ListItem>Asadh</asp:ListItem>
                      <asp:ListItem>Shrawan</asp:ListItem>
                      <asp:ListItem>Bhadra</asp:ListItem>
                      <asp:ListItem>Ashwin</asp:ListItem>
                      <asp:ListItem>Kartik</asp:ListItem>
                      <asp:ListItem>Mangsir</asp:ListItem>
                      <asp:ListItem>Poush</asp:ListItem>
                      <asp:ListItem>Magh</asp:ListItem>
                      <asp:ListItem>Falgun</asp:ListItem>
                      <asp:ListItem>Chaitra</asp:ListItem>
                      
                  </asp:DropDownList>
              </td>
          </tr>
                       
        </table>
      <asp:Button ID="btnFilter" runat="server" CssClass="btn" style="margin-left: 10px" OnClick="btnFilter_Click" Text="Filter"></asp:Button>
            <asp:Button ID="btnExportToExcelFilter" runat="server" CssClass="btn" OnClick="btnExportToExcel_ClickFilter" Text="Export to excel" Visible="false" />
      </div>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="h3">
        <h3 style="color:green"> Approve/Delete</h3>
    </asp:Panel>
    <asp:Image ID="Image1" ImageUrl="~/Image/riskexposure.png" runat="server" />
    <br />
    <asp:Label ID="lblmsg" runat="server" Visible="true"></asp:Label>
    <asp:Panel ID="pnlinfo" runat="server">
       <center>
        <asp:GridView ID="gvPending" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="OpId" 
            OnSelectedIndexChanged="gvPending_SelectedIndexChanged" GridLines="None">
            <AlternatingRowStyle BackColor="White"  />
            <Columns>
                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate></asp:TemplateField>
                <%--<asp:BoundField DataField="BranchCode" HeaderText="Branch" />--%>
                <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                <asp:BoundField DataField="OpId" HeaderText="OpRiskId" />
                <asp:BoundField DataField="Year" HeaderText="Year" />
                <asp:BoundField DataField="Month" HeaderText="Month" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Wighted" HeaderText="Wighted" />
                <asp:BoundField DataField="RiskLevel" HeaderText="RiskLevel" />
                <asp:CommandField ShowSelectButton="True"  SelectText="Action" /></Columns>
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
        </asp:GridView></center>
    </asp:Panel>

      <asp:Panel ID="PanelFilterTable" runat="server">
       <center>
        <asp:GridView ID="GridViewFilter" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="OpId" 
            OnSelectedIndexChanged="GridViewFilter_SelectedIndexChanged" GridLines="None"
             >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate></asp:TemplateField>
                <%--<asp:BoundField DataField="BranchCode" HeaderText="Branch" />--%>
                <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                <asp:BoundField DataField="OpId" HeaderText="OpRiskId" />
                <asp:BoundField DataField="Year" HeaderText="Year" />
                <asp:BoundField DataField="Month" HeaderText="Month" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Wighted" HeaderText="Wighted" />
                <asp:BoundField DataField="RiskLevel" HeaderText="RiskLevel" />
                <asp:CommandField ShowSelectButton="True"  SelectText="Action" />
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
        </asp:GridView></center>
    </asp:Panel>
   
    <asp:Panel ID="pnldata" runat="server">
       <center>
           <div>
               <table cellpadding="0" cellspacing="0" class="tablecss">
                  <tr>
                      <td class="risklefttd">
            <div style="float: left">BranchCode</div><div style="float: right">:</div></td>
                       <td class="riskrighttd">
                <asp:Label ID="lblBranchCodeAF" runat="server"></asp:Label></td></tr>
                   <tr>
                       <td class="risklefttd">
            <div style="float: left">Branch Name</div><div style="float: right">:</div></td>
                       <td class="riskrighttd">
                <asp:Label ID="lblBranchNameAF" runat="server"></asp:Label></td></tr>
                   <tr>
                       <td class="risklefttd">
            <div style="float: left">OpRiskId.</div><div style="float: right">:</div></td>
                       <td class="riskrighttd">
                <asp:Label ID="lblReferenceNoAF" runat="server"></asp:Label></td></tr>
                   <tr>
                       <td class="risklefttd">
            <div style="float: left">Year</div><div style="float: right">:</div></td>
                       <td class="riskrighttd">
                <asp:Label ID="lblLoanNameAF" runat="server"></asp:Label></td></tr>
                  <tr>
                      <td class="risklefttd">
            <div style="float: left">Month</div><div style="float: right">:</div></td>
                      <td class="riskrighttd">
                <asp:Label ID="lblLoanTypeAF" runat="server"></asp:Label></td></tr>
                  <tr>
                    <td class="risklefttd">
            <div style="float: left">Total Risk Weighted Exposure</div><div style="float: right">:</div></td>
                      <td class="riskrighttd">
                <asp:Label ID="lblLimitTypeAF" runat="server"></asp:Label></td></tr>
                  <tr>
                    <td class="risklefttd">
            <div style="float: left">Risk Level</div><div style="float: right">:</div></td>
                    <td class="riskrighttd">
                <asp:Label ID="lblLimitAF" runat="server"></asp:Label></td></tr>
                  <tr>
                    <td class="risklefttd">
            <div style="float: left">Created By</div><div style="float: right">:</div></td>
                    <td class="riskrighttd">
                <asp:Label ID="lblCreatedByAF" runat="server"></asp:Label></td></tr>
                   <tr>
                    <td class="risklefttd">
            <div style="float: left">Created On</div><div style="float: right">:</div></td>
                    <td class="riskrighttd">
                <asp:Label ID="lblCreatedOnAF" runat="server"></asp:Label></td></tr>
                   <tr>
                    <td class="risklefttd">
            <div style="float: left">Status</div><div style="float: right">:</div></td>
                       <td class="riskrighttd">
                <asp:Label ID="lblStatusAF" runat="server"></asp:Label></td></tr>
                   
                    <tr>
                       <td>
                               <div style="float: left; margin-left:20px">
                <asp:Button ID="btnBackAF" runat="server" CssClass="btn" OnClick="btnBack_Click" style="margin-left: 10px" Text="Back"></asp:Button>
                            </div>
                           <div style="float: left; margin-left:20px">
                <asp:Button ID="btnDetails" runat="server" CssClass="btn" OnClick="btnDetails_Click" style="margin-left: 10px" Text="More Details"></asp:Button>
                <asp:Button ID="filterBtnDetails" runat="server" CssClass="btn" OnClick="filter_btnDetails_Click" style="margin-left: 10px" Text="More Details"></asp:Button>

                            
                           </div>
                       </td>
                       <td>
                               <div style="float: left; margin-left:20px">
                <asp:Button ID="btnApprove" runat="server" Visible="false" CssClass="btn" OnClick="btnApprove_Click" style="margin-left: 10px" Text="Approve"></asp:Button>
                            </div>
                           <div style="float: left; margin-left:20px">
                <asp:Button ID="btnDelete" runat="server" Visible="false" CssClass="btn" OnClick="btnDelete_Click" style="margin-left: 10px" Text="Delete"></asp:Button>
                            </div></td></tr>
                    </table>
                </div>
            </center>
    </asp:Panel>
    <asp:Panel ID="pnlDetail" runat="server">
        <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Both">
            <Columns>
                   <%-- <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                        
                            <asp:HiddenField ID="hfRiskId" value='<%#Eval("RId") %>' runat="server" />
                    </ItemTemplate></asp:TemplateField>--%>
                    <asp:BoundField DataField="RId" HeaderText="RiskId" />
                    <asp:BoundField DataField="RiskIndicators" HeaderText="RiskIndicators" />
                    <asp:BoundField DataField="Selected" HeaderText="Selected" />
                    <asp:BoundField DataField="Score" HeaderText="Score" />
                    <%--<asp:BoundField DataField="CreatedOn" DataFormatString="{0:MM/dd/yyyy}" HeaderText="CreatedOn" />
                   
                    <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
                    <asp:TemplateField HeaderText="Action">
                       <ItemTemplate>
                           <asp:LinkButton ID="btnEdit"  runat="server" CommandName="EditItem"  ForeColor="#333333">Edit</asp:LinkButton>
                       </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/Image/view.jpg" SelectText="View" />--%>
                    
                </Columns>
        </asp:GridView>
        
         <asp:Button ID="btnBack" runat="server" CssClass="btn" OnClick="btnBack_Click" style="margin-left: 50%;"  Text="Back"></asp:Button>
        <%--<asp:Button ID="btnRPT" runat="server" Visible="false" CssClass="btn" OnClick="btnRPT_Click" style="margin-left: 35%;" Text="Report"></asp:Button>--%>
            
    </asp:Panel>
    <asp:Panel ID="pnlReport" Visible="false" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblBranch" CssClass="risklefttd" runat="server" Text="BranchCode"></asp:Label>
                </td>
                 <td>
                     <asp:TextBox ID="txtBranch" CssClass="textboxcss" Width="50px" runat="server"></asp:TextBox>
                </td>
            
                <td>
                    <asp:Label ID="lblYear" CssClass="risklefttd" runat="server" Text="Year"></asp:Label>
                </td>
                 <td>
                     <asp:TextBox ID="txtYear" CssClass="textboxcss" Width="50px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMonth" CssClass="risklefttd" runat="server" Text="Month"></asp:Label>
                </td>
                 <td>
                     <asp:TextBox ID="txtMonth" CssClass="textboxcss" Width="50px" runat="server"></asp:TextBox>
                </td>
           
                <td>
                    <asp:Label ID="lblRId" CssClass="risklefttd" runat="server" Text="Risk Id"></asp:Label>
                </td>
                 <td>
                     <asp:TextBox ID="txtRId" CssClass="textboxcss" Width="50px" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnOK" Visible="false" CssClass="btn" OnClick="btnOK_Click" runat="server" Text="Go" />
        </asp:Panel>
        <asp:GridView ID="gvReport" AutoGenerateColumns="false" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Both">
            <Columns>
                   
                    <asp:BoundField DataField="BranchCode" HeaderText="BranchCode" />
                    <asp:BoundField DataField="Year" HeaderText="Year" />
                    <asp:BoundField DataField="Month" HeaderText="Month" />
                    <asp:BoundField DataField="RId" HeaderText="Risk Id" />
                    <asp:BoundField DataField="RiskIndicators" HeaderText="RiskIndicators" />
                    <asp:BoundField DataField="Selected" HeaderText="Selected" />
                    <asp:BoundField DataField="Score" HeaderText="Score" />

                    
                </Columns>
        </asp:GridView>
        
    
    <asp:Button ID="btnExportToExcel" Visible="false" CssClass="btn" runat="server" Text="Export to excel" OnClick="btnExportToExcel_Click" />
</asp:Content>

