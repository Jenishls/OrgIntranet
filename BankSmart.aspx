<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BankSmart.aspx.cs" Inherits="BankSmart" %>

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
    <h3 class="auto-style2">NCC Bank-BankSmart</h3>

    <ul>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="BankSmart/Banksmart Frequent Problems.pdf" target="_blank">Banksmart Frequent Problems</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="BankSmart/BankSmart User Manual.pdf" target="_blank">BankSmart User Manual</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="BankSmart/BankSmart Admin Manual.pdf" target="_blank">BankSmart Admin Manual</a></li>

    </ul>
</asp:Content>

