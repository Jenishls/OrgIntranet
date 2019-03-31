<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="eTest.aspx.cs" Inherits="eTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /*li::before {
            content: "•"; 
            color: red;
            display: inline-block; 
            width: 1em;
            margin-left: -1em}*/

        .auto-style2 {
            text-decoration: underline;
            color: #951818;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Test" runat="server">
     <h3 class="auto-style2">NCC-KEEP</h3>

    <ul>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="eExam.aspx">New Exam</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="ExamHistory.aspx">Previous Exam</a></li>

   </ul>
        </asp:Panel>
    
    <asp:Label ID="lblMsg" CssClass="auto-style2" Font-Bold="true" Font-Size="XX-Large" runat="server"></asp:Label>
        
</asp:Content>

