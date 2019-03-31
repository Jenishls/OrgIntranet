<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div  class="contenthead">Change Password <br />
             </div>
         <table cellpadding="0" cellspacing="0" class="tablecss"  >
              <tr style="width:100%">  <td class="risklefttd">
             <div style="float:left">UserId</div>
              <div style="float:right">:</div>
               </td>
           <td class="riskrighttd">
               
                <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>  </td>
                </tr>
       <tr id="tr2" runat="server" visible="true">
              <td class="risklefttd">
             <div style="float:left">Old Password</div>
                <div style="float:right">:</div>
              </td>
           <td class="riskrighttd">
               <asp:TextBox  ID="txtOldPassword" CssClass="textboxcss" runat="server" TextMode="Password"></asp:TextBox>
          
            </td>
                </tr>
            <tr>
            <td class="risklefttd">
                <div style="float:left">New Password</div>
                <div style="float:right">:</div>
            </td>
           <td class="riskrighttd">
                <asp:TextBox ID="txtNewPassword" CssClass="textboxcss" runat="server" TextMode="Password"></asp:TextBox>
          
            </td>
            
        </tr>
        
       
         <tr id="trpassword" runat="server" visible="true">
              <td class="risklefttd">
             <div style="float:left">Confirm Password</div>
                <div style="float:right">:</div>
              </td>
           <td class="riskrighttd">
               <asp:TextBox ID="txtConfirmPassword" CssClass="textboxcss" runat="server" TextMode="Password"></asp:TextBox>
          
            </td>
                </tr>
             </table>
              
             <div style="padding-left:30px">
                    <asp:Button ID="btnSave" CssClass="btnMain btnGreen" runat="server" Text="Save" OnClick="btnSave_Click" />
             
           
               <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
       

        
        
    </center>
</asp:Content>

