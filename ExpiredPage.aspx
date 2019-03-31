<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ExpiredPage.aspx.cs" Inherits="ExpiredPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #FF0000;
            font-size: larger;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style3">
        <span class="auto-style2"><strong>Sorry your examination is not completed.Time has been expired.</strong></span>
    </div>
</asp:Content>

