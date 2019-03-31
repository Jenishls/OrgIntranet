<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AuxiliaryService.aspx.cs" Inherits="AuxiliaryService" %>

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
    <h3 class="auto-style2">A. Summary of Life Insurance Product</h3>
    <a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Summary of product details..pdf" target="_blank">Summary of Life Insurance Product</a>
     <h3 class="auto-style2">B. Life Insurance Product List & Details</h3>
         <ul id="Ul1" runat="server">
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Gurans Life Insurance Product Details.pdf" target="_blank">Gurans Life Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Life Insurance Corporation (LIC) products Details .pdf" target="_blank">Life Insurance Corporation (LIC) products Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Prime Life Insurance Product Details.pdf" target="_blank">Prime Life Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Reliable Life_Insurance_Products_RNLIL_English.pdf" target="_blank">Reliable Life Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Reliance life product details .pdf" target="_blank">Reliance life product details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Sun Nepal  Life Insurance Product Details.pdf" target="_blank">Sun Nepal  Life Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Surya Life Insurance Product Details.pdf" target="_blank">Surya Life Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Nepal Life Insurance Product Details.pdf" target="_blank">Nepal Life Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Union LIfe Insurance Product Details.pdf" target="_blank">Union LIfe Insurance Product Details</a></li>
       <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Citizen Life Insurance Product Details.pdf" target="_blank">Citizen Life Insurance Product Details</a></li>
        </ul>
       <h3 class="auto-style2">C. Non-Life Insurance Product List & Details</h3>
         <ul id="Ul2" runat="server">
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Everest Insurance Product Details.pdf" target="_blank">Everest Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Lumbini General Insurance Product Details.pdf" target="_blank">Lumbini General Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Prudential Insurance Product Details.pdf" target="_blank">Prudential Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/Siddhartha Insurance Product Details..pdf" target="_blank">Siddhartha Insurance Product Details</a></li>
        <li style="margin:10px"><a style="color:blue; font-style:italic; font-size:large" 
            href="AuxiliaryService/NLG Insurance Product Details.pdf" target="_blank">NLG Insurance Product Details</a></li>
       
        </ul>
</asp:Content>

