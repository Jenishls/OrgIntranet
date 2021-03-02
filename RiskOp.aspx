<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RiskOp.aspx.cs" Inherits="RiskOp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 400px;
            color: #000066;
        }
        .auto-style3 {
            color: #FFFFFF;
            background-color: #CC00FF;
        }
        .question{
            width:'80%' ;
            font-size:1.2em; 
            color:red;
           /* border:solid 1px #177b90;*/
           background-color:#45A29E;
           padding:5px;
            margin-right:300px;
            box-shadow: 10px 10px 5px grey;
            color:white;
            font-weight:normal;
        }
        .Set{
             border-radius:10px;
             /*background-color:#99d8e9;*/ 
             padding-left:5px;
             padding-top:5px;
             margin:5px;
        }
        .auto-style4 {
            color: #000066;
            
        }
        .auto-style5 {
            width: 686px;
            padding-left:3.5em;
        }
        .auto-style6 {
            color: #000066;
            width: 686px;
        }
        .riskrighttd1
        {
            color:#190061;
            text-align:center;
        }
        .risklefttd1
        {
            color:#190061;
        }
        table.minimalistBlack {
  border: 3px solid #8EE4AF;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
        table.minimalistBlack td, table.minimalistBlack th {
  border: 1px solid #8EE4AF;
  padding: 5px 4px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:Wizard ID="Wizard1" runat="server" 
        onfinishbuttonclick="Wizard1_FinishButtonClick" 
        onnextbuttonclick="Wizard1_NextButtonClick" ActiveStepIndex="0" DisplayCancelButton="True" OnSideBarButtonClick="Wizard1_SideBarButtonClick" SideBarButtonStyle-BackColor="White" SideBarButtonStyle-ForeColor="#6699FF">
        <NavigationStyle BackColor="White" />
        <SideBarButtonStyle Font-Bold="False" Font-Underline="false" />
        <SideBarStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="White" BorderColor="White" BorderWidth="1px" Width="100px" />
        <StepStyle BackColor="White" ForeColor="#3366FF" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" StepType="Start" Title="Branch Details">
                <div class="Set question">Branch Details:</div>
                <table cellpadding="2px" cellspacing="3px" class="tablecss1"  >
                    
                        <tr>
                            <td class="riskrighttd1">
                                <div style="float:left">
                                    BranchCode
                                </div>
                            </td>
                            <td class="risklefttd1">
                                <asp:DropDownList ID="ddlBranchCode" runat="server" CssClass="dropboxcss1">
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch" ForeColor="Red" InitialValue="Choose Branch" SetFocusOnError="True" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="riskrighttd1">
                                <div style="float:left">
                                    Year
                                </div>
                            </td>
                            <td class="risklefttd1">
                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropboxcss1" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlYear" ErrorMessage="Select One" ForeColor="Red" InitialValue="Choose One" SetFocusOnError="True" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="riskrighttd1">
                                <div style="float:left">
                                    Month
                                </div>
                            </td>
                            <td class="risklefttd1">
                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropboxcss1">
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMonth" ErrorMessage="Select One" ForeColor="Red" InitialValue="Choose One" SetFocusOnError="True" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="riskrighttd1">
                                <div style="float:left" >
                                    Branch Manager
                                </div>
                            </td>
                            <td class="risklefttd1">
                                <asp:Label ID="lblBM" runat="server"></asp:Label>
                            </td>
                        </tr>
                    
                   
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" StepType="Step" Title="Group 'A'">
                <div class="Set question"> A. Health, Safety & Security of Work Stations and Office Premises: </div> <br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGA1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblW1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlA1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlA1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGA2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblW2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlA2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlA2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                   <td class="risklefttd1">
                        <asp:Label ID="lblGA3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblW3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlA3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlA3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGA4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblW4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlA4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlA4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <%--<tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGA5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblW5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlA5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlA5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>--%>
                </table>
                
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep4" runat="server" StepType="Step" Title="Group 'B'">
                <div class="Set question"> B. Customer Complaints and Customer Servicing: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGB1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWB1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                
                        <asp:DropDownList ID="ddlB1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlB1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGB2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWB2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                
                        <asp:DropDownList ID="ddlB2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlB2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGB3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWB3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                
                        <asp:DropDownList ID="ddlB3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlB3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGB4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWB4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                
                        <asp:DropDownList ID="ddlB4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlB4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGB5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWB5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                
                        <asp:DropDownList ID="ddlB5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlB5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep5" runat="server" StepType="Step" Title="Group 'C'">
                <div class="Set question"> C. Cash Management (Teller,  Vault & ATM): </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                         <asp:DropDownList ID="ddlC1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlC1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlC2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlC2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlC3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5000" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=20000" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=50000" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=75000" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=100000" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlC3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlC4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlC4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlC5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlC5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC6" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC6" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlC6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5000" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=20000" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=50000" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=75000" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=100000" Value="5"></asp:ListItem>   
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddlC6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
              <%-- <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGC7" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWC7" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlC7" runat="server" cssclass="dropboxcss">
                             <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="5,000" Value="1"></asp:ListItem>
                            <asp:ListItem Text="20,000" Value="2"></asp:ListItem>
                            <asp:ListItem Text="50,000" Value="3"></asp:ListItem>
                            <asp:ListItem Text="75,000" Value="4"></asp:ListItem>
                            <asp:ListItem Text="1,00,000" Value="5"></asp:ListItem>  
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="ddlC7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>--%>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep6" runat="server" StepType="Step" Title="Group 'D'">
                <div class="Set question"> D. Cheque Payments and Cash/Cheque Deposit: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlD1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlD2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="ddlD3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="ddlD4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="ddlD5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD6" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD6" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="ddlD6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD7" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD7" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="ddlD7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGD8" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWD8" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlD8" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlD8" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep7" runat="server" StepType="Step" Title="Group 'E'">
                <div class="Set question"> E. Customer Account, Documents and Confidentiality Maintenance: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="ddlE1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=25" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=100" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=250" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=500" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=1000" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="ddlE2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="ddlE3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="ddlE4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="ddlE5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE6" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE6" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="ddlE6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE7" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE7" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="ddlE7" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGE8" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWE8" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlE8" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0.05"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=10" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=25" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=40" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=60" Value="5"></asp:ListItem>    
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
                <div class="Set question"> F. Loan Operations and Credit Documentations: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0.05"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=10" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=25" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=40" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=60" Value="5"></asp:ListItem>    
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="ddlF1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0.05"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=10" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=25" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=40" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=60" Value="5"></asp:ListItem>     
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="ddlF2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0.05"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=10" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=25" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=40" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=60" Value="5"></asp:ListItem>    
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="ddlF3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="ddlF4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="ddlF5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF6" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF6" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="ddlF6" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGF7" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWF7" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlF7" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
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
                 <div class="Set question"> G. Key Handling: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGG1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWG1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlG1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="ddlG1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGG2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWG2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlG2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="ddlG2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep10" runat="server" StepType="Step" Title="Group 'H'">
                <div class="Set question"> H. Account Monitoring and House Keeping: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGH1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWH1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlH1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="ddlH1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGH2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWH2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlH2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="ddlH2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGH3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWH3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlH3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="ddlH3" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGH4" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWH4" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlH4" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="ddlH4" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGH5" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWH5" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlH5" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text=">0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=10" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=25" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=40" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=60" Value="5"></asp:ListItem>  
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="ddlH5" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGH6" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWH6" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlH6" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
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
                <div class="Set question"> I. ATM Management: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGI1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWI1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlI1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="ddlI1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGI2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWI2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                    <asp:DropDownList ID="ddlI2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="ddlI2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGI3" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWI3" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlI3" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="5"></asp:ListItem>
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
                <div class="Set question"> J. Compliance and Others: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGJ1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWJ1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlJ1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="5"></asp:ListItem>
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="ddlJ1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGJ2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWJ2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlJ2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="0%" Value="0"></asp:ListItem>
                            <asp:ListItem Text=">0%" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text=">=5%" Value="1"></asp:ListItem>
                            <asp:ListItem Text=">=10%" Value="2"></asp:ListItem>
                            <asp:ListItem Text=">=25%" Value="3"></asp:ListItem>
                            <asp:ListItem Text=">=40%" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">=60%" Value="5"></asp:ListItem>
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
                <div class="Set question"> K. Internal and External Audit Observations: </div><br />
                 <table class="minimalistBlack td">
                     
                     <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                         <td></td>
                </tr>
                <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGK1" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWK1" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlK1" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="ddlK1" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               <tr>
                    <td class="risklefttd1">
                        <asp:Label ID="lblGK2" runat="server" ></asp:Label>
                    </td>
                    <td class="riskrighttd1">
                        <asp:Label ID="lblWK2" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlK2" runat="server" cssclass="dropboxcss">
                            <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0.5"></asp:ListItem>
                            <asp:ListItem Text="<=2" Value="1"></asp:ListItem>
                            <asp:ListItem Text="<=4" Value="2"></asp:ListItem>
                            <asp:ListItem Text="<=6" Value="3"></asp:ListItem>
                            <asp:ListItem Text="<=8" Value="4"></asp:ListItem>
                            <asp:ListItem Text=">8" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="riskrighttd">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="ddlK2" ErrorMessage="Select One" 
                        ForeColor="Red" InitialValue="Choose One" ValidationGroup="a">*</asp:RequiredFieldValidator>
                    </td>
               </tr>
               </table>
                
            </asp:WizardStep>
            
            <asp:WizardStep ID="WizardStep2" runat="server" StepType="Finish" Title="Summary">
                <table  class="minimalistBlack td"> 
                    <tr>
                        <td colspan="2">
                            <div class="Set question">
                                Branch Details</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Branch Name:
                        </td>
                       <td>
                            <asp:Label ID="lblBrName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year:
                        </td>
                        <td>
                            <asp:Label ID="lblYear" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Month:
                        </td>
                        <td>
                            <asp:Label ID="lblMonth" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Branch Manager:
                        </td>
                        <td>
                            <asp:Label ID="lblNameBM" runat="server"></asp:Label>
                        </td>
                    </tr>
                    </table>
                <table class="minimalistBlack td">
                    <tr>
                        
                        
                        <td colspan="4">
                            <div class="Set question">
                               A. Health, Safety & Security of Work Stations and Office Premises</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            A.1
                        </td>
                        <td>
                            <asp:Label ID="lblA1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblWA1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="A1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           A.2
                        </td>
                        <td>
                            <asp:Label ID="lblA2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWA2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="A2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           A.3
                        </td>
                        <td>
                            <asp:Label ID="lblA3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWA3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="A3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           A.4 
                        </td>
                        <td>
                            <asp:Label ID="lblA4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWA4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="A4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <%--<tr>
                        <td style="border: 1px solid black">
                           A.5
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblA5" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblWA5" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="A5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                           Total A
                        </td>
                        <td>
                            <asp:Label ID="lblA" Text="0.1" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAW"  runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblATW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               B. Customer Complaints and Customer Servicing</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            B.1
                        </td>
                        <td>
                            <asp:Label ID="lblB1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblBW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="B1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           B.2
                        </td>
                        <td>
                            <asp:Label ID="lblB2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="B2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           B.3
                        </td>
                        <td>
                            <asp:Label ID="lblB3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="B3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           B.4 
                        </td>
                        <td>
                            <asp:Label ID="lblB4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBW4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="B4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           B.5
                        </td>
                        <td>
                            <asp:Label ID="lblB5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBW5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="B5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total B
                        </td>
                        <td>
                            <asp:Label ID="lblB" Text="0.1" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWB" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               C. Cash Management (Teller,  Vault & ATM)</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            C.1
                        </td>
                        <td>
                            <asp:Label ID="lblC1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblCW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="C1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           C.2
                        </td>
                        <td>
                            <asp:Label ID="lblC2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="C2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           C.3
                        </td>
                        <td>
                            <asp:Label ID="lblC3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="C3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           C.4 
                        </td>
                        <td>
                            <asp:Label ID="lblC4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCW4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="C4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           C.5
                        </td>
                        <td>
                            <asp:Label ID="lblC5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCW5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="C5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           C.6
                        </td>
                        <td>
                            <asp:Label ID="lblC6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCW6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="C6RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <%--<tr>
                        <td style="border: 1px solid black">
                           C.7
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblC7" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="lblCW7" runat="server"></asp:Label>
                        </td>
                        <td style="border: 1px solid black">
                            <asp:Label ID="C7RWE" runat="server"></asp:Label>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                           Total C
                        </td>
                        <td>
                            <asp:Label ID="lblC" Text="0.15" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWC" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               D. Cheque Payments and Cash/Cheque Deposit</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            D.1
                        </td>
                        <td>
                            <asp:Label ID="lblD1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblDW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="D1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.2
                        </td>
                        <td>
                            <asp:Label ID="lblD2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="D2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.3
                        </td>
                        <td>
                            <asp:Label ID="lblD3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="D3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.4 
                        </td>
                        <td>
                            <asp:Label ID="lblD4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="D4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.5
                        </td>
                        <td>
                            <asp:Label ID="lblD5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="D5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.6
                        </td>
                        <td>
                            <asp:Label ID="lblD6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="D6RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.7
                        </td>
                        <td>
                            <asp:Label ID="lblD7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="D7RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           D.8
                        </td>
                        <td>
                            <asp:Label ID="lblD8" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDW8" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="D8RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total D
                        </td>
                        <td>
                            <asp:Label ID="lblD" Text="0.15" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWD" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               E. Customer Account, Documents and Confidentiality Maintenance</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            E.1
                        </td>
                        <td>
                            <asp:Label ID="lblE1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblEW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="E1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           E.2
                        </td>
                        <td>
                            <asp:Label ID="lblE2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="E2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           E.3
                        </td>
                        <td>
                            <asp:Label ID="lblE3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="E3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           E.4 
                        </td>
                        <td>
                            <asp:Label ID="lblE4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="E4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           E.5
                        </td>
                        <td>
                            <asp:Label ID="lblE5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="E5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           E.6
                        </td>
                        <td>
                            <asp:Label ID="lblE6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="E6RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           E.7
                        </td>
                        <td>
                            <asp:Label ID="lblE7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="E7RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
		            <tr>
                        <td>
                           E.8
                        </td>
                        <td>
                            <asp:Label ID="lblE8" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEW8" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="E8RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                         <td>
                           Total E
                        </td>
                        <td>
                            <asp:Label ID="lblE" Text="0.13" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWE" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblETW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               F. Loan Operations and Credit Documentations</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            F.1
                        </td>
                        <td>
                            <asp:Label ID="lblF1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblFW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="F1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           F.2
                        </td>
                        <td>
                            <asp:Label ID="lblF2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="F2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           F.3
                        </td>
                        <td>
                            <asp:Label ID="lblF3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="F3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           F.4 
                        </td>
                        <td>
                            <asp:Label ID="lblF4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFW4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="F4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           F.5
                        </td>
                        <td>
                            <asp:Label ID="lblF5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFW5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="F5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           F.6
                        </td>
                        <td>
                            <asp:Label ID="lblF6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFW6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="F6RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           F.7
                        </td>
                        <td>
                            <asp:Label ID="lblF7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFW7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="F7RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total F
                        </td>
                        <td>
                            <asp:Label ID="lblF" Text="0.1" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWF" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               G. Key Handling</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            G.1
                        </td>
                        <td>
                            <asp:Label ID="lblG1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblGW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="G1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            G.2
                        </td>
                        <td>
                            <asp:Label ID="lblG2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblGW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="G2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total G
                        </td>
                        <td>
                            <asp:Label ID="lblG" Text="0.02" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWG" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblGTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               H. Account Monitoring and House Keeping</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            H.1
                        </td>
                        <td>
                            <asp:Label ID="lblH1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblHW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="H1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           H.2
                        </td>
                        <td>
                            <asp:Label ID="lblH2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="H2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           H.3
                        </td>
                        <td>
                            <asp:Label ID="lblH3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="H3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           H.4 
                        </td>
                        <td>
                            <asp:Label ID="lblH4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHW4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="H4RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           H.5
                        </td>
                        <td>
                            <asp:Label ID="lblH5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHW5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="H5RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           H.6
                        </td>
                        <td>
                            <asp:Label ID="lblH6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHW6" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="H6RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total H
                        </td>
                        <td>
                            <asp:Label ID="lblH" Text="0.05" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWH" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               I. ATM Management</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            I.1
                        </td>
                        <td>
                            <asp:Label ID="lblI1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblIW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="I1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           I.2
                        </td>
                        <td>
                            <asp:Label ID="lblI2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblIW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="I2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           I.3
                        </td>
                        <td>
                            <asp:Label ID="lblI3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblIW3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="I3RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total I
                        </td>
                        <td>
                            <asp:Label ID="lblI" Text="0.05" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWI" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblITW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               J. Compliance and Others</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            J.1
                        </td>
                        <td>
                            <asp:Label ID="lblJ1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblJW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="J1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           J.2
                        </td>
                        <td>
                            <asp:Label ID="lblJ2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblJW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="J2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total J
                        </td>
                        <td>
                            <asp:Label ID="lblJ" Text="0.05" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWJ" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblJTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                    <div class="Set question">
                               K. Internal and External Audit Observations</div>
                        </td>
                    </tr>
                    <tr>
                    <td class="risklefttd1">
                       <b> Risk Indicators </b>
                    </td>
                    <td class="riskrighttd1">
                      <b> Weight </b>
                    </td>
                    <td class="auto-style2">
                       <b> Status/Response </b>
                    </td>
                    <td>
                       <b> Total </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            K.1
                        </td>
                        <td>
                            <asp:Label ID="lblK1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblKW1" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="K1RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           K.2
                        </td>
                        <td>
                            <asp:Label ID="lblK2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblKW2" runat="server"></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="K2RWE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Total K
                        </td>
                        <td>
                            <asp:Label ID="lblK" Text="0.1" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWK" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblKTW" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="minimalistBlack td">
                <tr>
                        <td>
                            <span class="auto-style3"><strong>Grand Total</strong></span>
                        </td>
                        <td style=" background-color:#557A95;">
                <asp:Label ID="lblGT" runat="server" ForeColor="white" ></asp:Label>
                            </td>
                    </tr>
                    </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</div>  
</asp:Content>

