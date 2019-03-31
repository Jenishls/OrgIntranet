<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Policies.aspx.cs" Inherits="Policies" %>

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
        
        .list li{
            margin: 10px;
        }

        .list li > a{
            color:blue;
            font-style:italic;
            font-size:large;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="auto-style2">NCC Bank Policies</h3>

    <ul class="list">
        <li>
            <a href="Policies/Credit Policy Guidelines, 2018.pdf" target="_blank">
                Credit Policy Guidelines (CPG-2018)
            </a>
        </li>
        <li>
            <a href="Policies/Internal Audit Policy 2072.pdf" target="_blank">
                Internal Audit Policy,2072
            </a>
        </li>
        <li>
            <a href="Policies/Policy of ICAAP.pdf" target="_blank">
                Internal Capital Adequacy Assessment Process(ICAAP), 2018
            </a>
        </li>
         <li>
            <a href="Policies/Asset & Liability Management Guidelines and Investment Policy, 2018.pdf" target="_blank">
                Asset & Liability Management Guideline and Investment Policy,2018
            </a>
        </li>
        <li>
            <a href="Policies/Financial Administration Bylaws,2065.pdf" target="_blank">
                Financial Administration Bylaws,2065
            </a>
        </li>
        <li>
            <a href="Policies/Internal Audit Policy - 2075.pdf" target="_blank">
                Internal Audit Policy,2075
            </a>
        </li>
        <li>
            <a href="Policies/AML, CFT & KYC Policy.pdf" target="_blank">
                Anti Money Laundering (AML) Combating the Financing of Terrorism (CFT) and Know Your Customer (KYC) Policy,2018
            </a>
        </li>
        <li>
            <a href="Policies/Medium Term Credit Strategy 2072-75.pdf" target="_blank">
                Medium Term Credit Strategy 2072-75
            </a>
        </li>
        <li>
            <a href="Policies/NPA-NBA Recovery & Sales Directives, 2071.pdf" target="_blank">
                NPA-NBA Recovery & Sales Directives,2071
            </a>
        </li>
        <li>
            <a href="Policies/Operation Risk Management Policy & Framework - 2018.pdf" target="_blank">
                Operational Risk Management Policy & Framework,2018
            </a>
        </li>
        <li>
            <a href="Policies/CSR Framework.pdf" target="_blank">
                Corporate Social Responsibility (CSR),2018
            </a>
        </li>
        <li>
            <a href="Policies/Compliance Policy.pdf" target="_blank">
                Compliance Policy, 2018
            </a>
        </li>
        <li>
            <a href="Policies/Risk Apetite and Risk Tolerance Policy.pdf" target="_blank">
                Risk Appetite and Risk Tolerance Policy, 2018
            </a>
        </li>

        <li>
            <a href="Policies/Circular 14.pdf" target="_blank">
                Amendment in AML/CFT and KYC Policy - 2018
            </a>
        </li>
        <li>
            <a href="Policies/Market Risk Management Policy, 2019.pdf" target="_blank">
                Market Risk Management Policy, 2019
            </a>
        </li>
        <li>
            <a href="Policies/Credit Risk Management Policy, 2019.pdf" target="_blank">
                  Credit Risk Management Policy, 2019
            </a>
        </li>
        <li>
            <a href="Policies/Liquidity and Funding Risk Management Policy, 2019.pdf" target="_blank">
                Liquidity and Funding Risk Management Policy, 2019
            </a>
        </li>

        <h4>Staff Related</h4>
        
        <li>
            <a href="Policies/Staff Rules 2067.pdf" target="_blank">
                Staff Rules 2067
            </a>
        </li>
        <li>
            <a href="Policies/Content of Staff Rules 2067.pdf" target="_blank">
                Content of Staff Rules,2067
            </a>
        </li>
        <li>
            <a href="Policies/Provision of staff promotion.pdf" target="_blank">
                Provision of staff promotion
            </a>
        </li>
        <li>
            <a href="Policies/Amendments in the clause 65(1) & 39(Gna) of EmPloYees Service Rules,2067.pdf" target="_blank">
                Amendments in the clause 65(1) & 39(Gna) of EmPloYees Service Rules,2067
            </a>
        </li>
        <li>
            <a href="Policies/Circular 25.pdf" target="_blank">
                Amendment in the clause 39 1 (Ka) & 39 1 (Gha) of Staff Service Rule, 2067
            </a>
        </li>
        
    </ul>

    <%--<asp:ListBox ID="ListBox1" Width="100%" Height="200px" runat="server"></asp:ListBox>--%>
</asp:Content>

