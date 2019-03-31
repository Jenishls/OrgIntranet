﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RFUnit.aspx.cs" Inherits="RFUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        
        .list li{
            margin: 10px;
        }

        .list li > a{
            color:blue;
            font-style:italic;
            font-size:large;
        }

        ul[type="none"] li{
            padding-bottom:6px;
        }
        
        </style>
      <h3 class="auto-style2">RF Unit</h3>

    <ul class="list">
        <li>
            <a href="RF/Account Opening Form.pdf" target="_blank">
                RF A/C Opening Form
            </a>
        </li>
        <li>
            <a href="RF/Latest Application for loan- FINAL.pdf" target="_blank">
                RF Loan Application Form
            </a>
        </li>
        <li>
            <a href="RF/Deed of RF.pdf" target="_blank">
                Deed of RF Loan
            </a>
        </li>
        <li>
            <a href="RF/Latest APPLICATION FOR REFUND OF DEPOSIT AMOUNT-final.pdf" target="_blank">
                RF Refund Form
            </a>
        </li>
        <li>
            <a href="RF/NCCB-ACCOUNTING POLICIES &OPERATIONAL MANUAL.pdf" target="_blank">
                NCCB-Accounting Policies & Operational Manual
            </a>
        </li>
        <li>
            <a href="RF/NCCB RF SYSTEM ACCESS GUIDELINES.pdf" target="_blank">
                NCCB RF System Access Guidelines
            </a>
        </li>
        <li>
            <a href="RF/BOOK LET OF NCC Retired Fund Ad.pdf" target="_blank">
                Book-let of RF
            </a>
        </li>
        <li>
            <a href="RF/Medical Insurance.pdf" target="_blank">
                Medical Insurance
            </a>
        </li>

        <li>
            <img src="" />
        </li>

     </ul>
    <ul type="none">
        <h3>Contact</h3>
        <li>NCCB Retirement Fund Unit</li>
        <li>NCC Bank Ltd., Head Office, Bagbazar, KTM.</li>
        <li>Tel : 977-01-4246991, Ext. 125 & 411, Fax: 977-01-4262843</li>
        <li>E-mail: nccbrf@nccbank.com.np,  Web: www.nccbank.com.np</li>
        <li>Unit Head – Mr. Prem Krishna Barahi</li>

    </ul>


</asp:Content>
