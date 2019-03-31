<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OpRiskAssess.aspx.cs" Inherits="OpRiskAssess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 43%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style5 {
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 59%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style6 {
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 85%;
            border-bottom: 1px solid #e1e2e2;
        }
        .auto-style7 {
            text-align: left;
            vertical-align: middle;
            padding: 5px;
            width: 25%;
            border-bottom: 1px solid #e1e2e2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3> Matrix on the determination of Operation Risk Profile of the Branch</h3>
    <br />
    <div>
    <asp:Wizard ID="Wizard1" runat="server" 
        onfinishbuttonclick="Wizard1_FinishButtonClick" 
        onnextbuttonclick="Wizard1_NextButtonClick" ActiveStepIndex="0">
        <SideBarStyle HorizontalAlign="Left" VerticalAlign="Top" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" StepType="Start" Title="Branch Details">
                <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style4">
                        <div style="float:left">BranchCode </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlBranchCode" runat="server" cssclass="dropboxcss">
                            <%--<asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch" 
                        ForeColor="Red" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <div style="float:left">Year </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlYear" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Choose One" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="2074" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2075" Value="2"></asp:ListItem>
                            <asp:ListItem Text="2076" Value="3"></asp:ListItem>
                            <asp:ListItem Text="2077" Value="4"></asp:ListItem>
                            <asp:ListItem Text="2078" Value="5"></asp:ListItem>
                            <asp:ListItem Text="2079" Value="6"></asp:ListItem>
                            <asp:ListItem Text="2080" Value="7"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlYear" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <div style="float:left">Month </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlMonth" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Baishakh" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Jesth" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Ashadh" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Shrawan" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Bhadra" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Ashwin" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Kartik" Value="7"></asp:ListItem>
                            <asp:ListItem Text="Mangsir" Value="8"></asp:ListItem>
                            <asp:ListItem Text="Poush" Value="9"></asp:ListItem>
                            <asp:ListItem Text="Magh" Value="10"></asp:ListItem>
                            <asp:ListItem Text="Falgun" Value="11"></asp:ListItem>
                            <asp:ListItem Text="Chaitra" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMonth" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <div style="float:left">Branch Manager </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblBM" runat="server" ></asp:Label>
                    </td>    
                </tr>
                   
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" StepType="Step" Title="Group 'A'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Is the branch office premises and working stations are safe in terms of Health, Air, Lighting, Security and Overall Environment along with unexpired fire extinguisher, alarm system </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlA1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlA1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. Was there any accidents/physical hurt to the staffs in work status due to the physical infrastructure of the Bank in this month. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlA2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlA2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Have you find any instances in this Month that Security Guard have not checked the visitors by their Metal Detector/or by Other Means. (Plz check CCTV record once before replying it) </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlA3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlA3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Do the CCTV record and store at least 90 days (All Cameras). Do the CCTV coverage is sufficient to differentiate the cash denomination and cover whole branch premises  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlA4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlA4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. Are office equipments, furniture, machineries, generators are fully insured and Insurance are upto date (do not depend only on GAD). </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlA5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlA5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep4" runat="server" StepType="Step" Title="Group 'B'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Is the branch has suggestion/complain box in visible area of the branch? </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlB1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlB1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. What are the numbers of Complaints received in the branch related with customer servicing and other branch related activities. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlB2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlB2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Have the complaints resolved on time and responded to complainants on time in line with the Guidelines. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlB3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlB3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Was there any loss of assets of the Branch during this month by the cause of natural disaster or unpredicted/unplanned events.  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlB4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlB4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. Is there adequate space area in branch premises according to customer flow, customer waiting chair, drinking water, coupon system,  A/C, space available etc.  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlB5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlB5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep5" runat="server" StepType="Step" Title="Group 'C'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Are the door to Teller Area and Teller Drawers with Lock System. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlC1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. What are the numbers of Incidents of Cash Short or Excess in the Month in excess Rs 500. Plz mention the number </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlC2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Is the Cash recorded on CBS tallied/verified with the Physical Cash Balance at the end of the Month </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlC3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Has a single person entered and moved cash from Vault in absence of another Key Holder. (Ensure throught CCTV record too)  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlC4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. Does the ATM cash shown by CBS verified/tallied with the cash shown in ATM at the end of the Month  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlC5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">6. Was there cash EXCESS/SHORT in this month. Mention the amount equal or in above of:  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="500" Value="3"></asp:ListItem>
                            <asp:ListItem Text="5,000" Value="4"></asp:ListItem>
                            <asp:ListItem Text="10,000" Value="5"></asp:ListItem>
                            <asp:ListItem Text="20,000" Value="6"></asp:ListItem>
                            <asp:ListItem Text="35,000" Value="8"></asp:ListItem>
                            <asp:ListItem Text="50,000" Value="10"></asp:ListItem>
                            <asp:ListItem Text="1,00,000" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddlC6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">7. Did the branch booked cash loss or expenses in this month due to operational lapses. Mention the amount equal or in above of:  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlC7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="500" Value="3"></asp:ListItem>
                            <asp:ListItem Text="5,000" Value="5"></asp:ListItem>
                            <asp:ListItem Text="10,000" Value="7"></asp:ListItem>
                            <asp:ListItem Text="20,000" Value="10"></asp:ListItem>
                            <asp:ListItem Text="35,000" Value="13"></asp:ListItem>
                            <asp:ListItem Text="50,000" Value="16"></asp:ListItem>
                            <asp:ListItem Text="1,00,000" Value="20"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="ddlC7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep6" runat="server" StepType="Step" Title="Group 'D'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Was the stale cheque was paid during the month as identified in transaction checking. If yes, mention the number of cases. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlD1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. Have any cheque payments found paid without verifying signature or not confirming other information (date, figures etc) identified on transaction verifications/supervisory reviews </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlD2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Are there any instances of cheque payments where copy of valid identification (Citizenship, Passport, License, Voter’s ID, Employment or school/college IDs) are  not taken on payment of cheque more than Rs 200,000. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="ddlD3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Have there any instances in this month that the cash denomination written in backside of Cheque is different than actually provided/handed over to customer (check at least 10 instances of the Month through CCTV record)  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="ddlD4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. Are there any instances that Income source is not mentioned in deposit in excess of NRs 1,000,000 and USD 2,000 or equivalent not recorded on CBS.  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="ddlD5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">6. Are the pre-numbered stationery and all deliverables under single custody during the day and dual control of designated custodians over night.  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="ddlD6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">7. Was cheques amounting Rs. 10 lacs and above is encashed instead of account deposit except in the condition as mentioned in NRB Directives  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlD7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="ddlD7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep7" runat="server" StepType="Step" Title="Group 'E'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Is there any transaction exceeded USD 1,000 that the rate not taken from Treasury Department. If Yes, Plz mention the number of transactions. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="ddlE1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. Have any cheque payments found paid without verifying signature or not confirming other information (date, figures etc) identified on transaction verifications/supervisory reviews </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="10" Value="1"></asp:ListItem>
                            <asp:ListItem Text="25" Value="2"></asp:ListItem>
                            <asp:ListItem Text="50" Value="3"></asp:ListItem>
                            <asp:ListItem Text="100" Value="4"></asp:ListItem>
                            <asp:ListItem Text="250" Value="5"></asp:ListItem>
                            <asp:ListItem Text="500" Value="6"></asp:ListItem>
                            <asp:ListItem Text="1000" Value="7"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="ddlE2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Are there any accounts where copy documents of Citizenships, Registratinos etc. not signed as "True Copy Verified". </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="ddlE3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Are there any accounts where competent staff (say BM or OI or others) has not approved the account opening form or KYC Form.  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="ddlE4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. Are there any operative accounts where signature/image not updated in CBS  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="ddlE5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">6. Is there any signature of customer where it is not verified by Staff in register of Cheque Issue, Statement Issue, Stop Payments, Card Issue, Balance Certificate Issue or other information/documents issue during this Month?  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="ddlE6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">7. Do the branch have uncollected cheque books for more than 90 days and additional charge is levied incase handed over to customer after 90 days. Do the branch has undestroyed cheque books and ATM card for more than 2 years and six months respectively.  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="ddlE7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">8. How many accounts are on Block or Debit restricted status without mentioning the remarks for reason or basis of block. Mention equal or as above of:  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlE8" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="3" Value="2"></asp:ListItem>
                            <asp:ListItem Text="5" Value="3"></asp:ListItem>
                            <asp:ListItem Text="10" Value="4"></asp:ListItem>
                            <asp:ListItem Text="15" Value="5"></asp:ListItem>
                            <asp:ListItem Text="25" Value="6"></asp:ListItem>
                            <asp:ListItem Text="40" Value="7"></asp:ListItem>
                            <asp:ListItem Text="60" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="ddlE8" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep8" runat="server" StepType="Step" Title="Group 'F'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Mention the expired Insurance number as on end of the Month as recorded in CBS ( choose in equal or above of:) </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="3" Value="2"></asp:ListItem>
                            <asp:ListItem Text="5" Value="3"></asp:ListItem>
                            <asp:ListItem Text="10" Value="4"></asp:ListItem>
                            <asp:ListItem Text="15" Value="5"></asp:ListItem>
                            <asp:ListItem Text="25" Value="6"></asp:ListItem>
                            <asp:ListItem Text="40" Value="7"></asp:ListItem>
                            <asp:ListItem Text="60" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="ddlF1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. What are the loan account number of expired Drawing Power in your branch as per the CBS report of Month End (choose in equal or above of:) </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="3" Value="2"></asp:ListItem>
                            <asp:ListItem Text="5" Value="3"></asp:ListItem>
                            <asp:ListItem Text="10" Value="4"></asp:ListItem>
                            <asp:ListItem Text="15" Value="5"></asp:ListItem>
                            <asp:ListItem Text="25" Value="6"></asp:ListItem>
                            <asp:ListItem Text="40" Value="7"></asp:ListItem>
                            <asp:ListItem Text="60" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="ddlF2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. What are the loan account number of Due Revaluations in your branch on Month End (choose in equal or above of:) </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="3" Value="2"></asp:ListItem>
                            <asp:ListItem Text="5" Value="3"></asp:ListItem>
                            <asp:ListItem Text="10" Value="4"></asp:ListItem>
                            <asp:ListItem Text="15" Value="5"></asp:ListItem>
                            <asp:ListItem Text="25" Value="6"></asp:ListItem>
                            <asp:ListItem Text="40" Value="7"></asp:ListItem>
                            <asp:ListItem Text="60" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="ddlF3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Was there any incident in the month that loan disbursed through CBS more than assigned limit  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="ddlF4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. Is there any incident that Interest applied in CBS different than approved and rectified during this Month. Plz mention the numbers  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="ddlF5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">6. Are the original Credit Security Documents, Original Approved Credit Appraisals and other Prime Documents stored on fire proof cabinet  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="ddlF6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">7. Was there any incident in the month that customer account (deposit and loan) was overdrawn  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlF7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="ddlF7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>

             <asp:WizardStep ID="WizardStep9" runat="server" StepType="Step" Title="Group 'G'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Are there any instances in this month that Key Handover not recorded in register and not signed by respective Key Holder  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlG1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="ddlG1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep10" runat="server" StepType="Step" Title="Group 'H'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Has there been balance remained overnight on the account of IDT, Adjustment Account, IBT, Suspense account or other intermediary accounts </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlH1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="ddlH1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. Was there any service interruptions in any days within this month that service stopped for 20 minutes or more </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlH2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="ddlH2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Are there any differences on AIP and AIR on individual account to the Balances of AIR and AIP of General Ledger </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlH3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="ddlH3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">4. Are there any account blank on coding of Risk Grade, AML Code, Citizenship Number etc  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlH4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="ddlH4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">5. How many reversal transactions are made in this month? (all transaction reversal). Mention as above of:  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlH5" runat="server" cssclass="dropboxcss">
                             <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="3" Value="2"></asp:ListItem>
                            <asp:ListItem Text="5" Value="3"></asp:ListItem>
                            <asp:ListItem Text="10" Value="4"></asp:ListItem>
                            <asp:ListItem Text="15" Value="5"></asp:ListItem>
                            <asp:ListItem Text="25" Value="6"></asp:ListItem>
                            <asp:ListItem Text="40" Value="7"></asp:ListItem>
                            <asp:ListItem Text="60" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="ddlH5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="auto-style6">
                        <div style="float:left">6. Are there any accounts where VISA or Operating License expiry period have crossed but account are in still operating conditions  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlH6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="ddlH6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep11" runat="server" StepType="Step" Title="Group 'I'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Is the ATM under the surveillance of CCTV all the time and PIN entered by the user cannot be seen through the camera </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlI1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="ddlI1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. Is the ATM operating smoothly? If not mentioned number of hour for which ATM is not operated during the month. Mention as above of: </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlI2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="1" Value="3"></asp:ListItem>
                            <asp:ListItem Text="2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="1"></asp:ListItem>
                            <asp:ListItem Text="5" Value="3"></asp:ListItem>
                            <asp:ListItem Text="6" Value="1"></asp:ListItem>
                            <asp:ListItem Text="7" Value="3"></asp:ListItem>
                            <asp:ListItem Text="8" Value="1"></asp:ListItem>
                            <asp:ListItem Text="9" Value="3"></asp:ListItem>
                            <asp:ListItem Text="10" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="ddlI2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">3. Is there any un-reconciled/unsuccessful item on ATM related transactions at the end of the Month continuous for 15 days. </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlI3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="ddlI3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep12" runat="server" StepType="Step" Title="Group 'J'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. Have you replied online query (letters/account block/ac info/CIAA etc) within 24 hours in this month </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlJ1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="ddlJ1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. Staff' late attendance more than 15 minutes (in %) during the month (Calculation: Total number of Late attendance recorded by software of all staffs/ Total Working days of  </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlJ2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0%" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1%" Value="1"></asp:ListItem>
                            <asp:ListItem Text="5%" Value="2"></asp:ListItem>
                            <asp:ListItem Text="10%" Value="3"></asp:ListItem>
                            <asp:ListItem Text="15%" Value="4"></asp:ListItem>
                            <asp:ListItem Text="25%" Value="6"></asp:ListItem>
                            <asp:ListItem Text="50%" Value="8"></asp:ListItem>
                            <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="ddlJ2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep13" runat="server" StepType="Step" Title="Group 'K'">
                 <table cellpadding="0" cellspacing="0" class="tablecss"  >
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">1. How many operational issues (including the issues of credit files) are still to be corrected/implemented as remarked by previous Internal Audit. Mention as above of: </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlK1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="ddlK1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="auto-style6">
                        <div style="float:left">2. How many operational issues (including the issues of credit files) are still remained to correct/implement as remarked by External Audit and NRB Inspection. Mention as   </div>
                        <div style="float:right">:</div>
                    </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlk2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="ddlk2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>
            
            <asp:WizardStep ID="WizardStep2" runat="server" StepType="Finish" Title="Summary">
                <table  class="tablecss1"> 
                    <tr>
                        <td colspan="2">
                            <h3>
                                Branch Details</h3>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                            Branch Name:
                        </td>
                       <td style="border: 1px solid black">
                            <asp:Label ID="lblBrName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                            Year:
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblYear" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                            Month:
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblMonth" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                            Branch Manager:
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblNameBM" runat="server"></asp:Label>
                        </td>
                    </tr>
                    </table>
                <table style=" border: 1px solid double;" class="tablecss1">
                    <tr>
                        
                        
                        <td colspan="3">
                            <h3>
                               A. Health, Safety & Security of Work Stations and Office Premises</h3>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                            A.1
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA1" runat="server"></asp:Label>
                        </td>
                         <td style="border: 1px solid black">
                            <asp:Label ID="lblWA1" Text="2" runat="server"></asp:Label>
                        </td>
                         <td style="border: 1px solid black">
                            <asp:Label ID="A1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                           A.2
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA2" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblWA2" Text="2" runat="server"></asp:Label>
                        </td>
                         <td style="border: 1px solid black">
                            <asp:Label ID="A2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                           A.3
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA3" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblWA3" Text="2" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="A3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                           A.4 
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA4" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblWA4" Text="3" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="A4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                           A.5
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA5" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblWA5" Text="1" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="A5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">
                           Total A
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblAW" Text="0.1" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblATW" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</div> 
</asp:Content>

