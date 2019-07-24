<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CircularDisplay.aspx.cs" Inherits="CircularDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
      <embed src="<%= "Uploads/"+Request.QueryString["link"]+"#toolbar=0&navpanes=0&scrollbar=0" %>" height="600px" width="800px"/>
 
  <asp:Label id="test" runat="server"></asp:Label>
</asp:Content>

