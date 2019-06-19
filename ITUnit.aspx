<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ITUnit.aspx.cs" Inherits="ITUnit" %>

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
            color:blue;
            padding-bottom:6px;
        }
        
        </style>
    <h3 class="auto-style2">IT Unit </h3>

        <ul class="list">
        <li>
            <a href="ITUnit/How to Install New exe of Pumori.docx" target="_blank">
                How to Install New exe of Pumori
            </a>
        </li>
        <li>
            <a href="ITUnit/Pumori User  Approval Sheet.docx" target="_blank">
                Pumori User Approval Sheet
            </a>
        </li>
        <li>
            <a href="ITUnit/Standing Instruction.docx" target="_blank">
                Create Standing Instruction
            </a>
        </li>
        <li>
            <a href="ITUnit/Remove Intruder Locked Out.docx" target="_blank">
                Remove Intruder Locked Out
            </a>
        </li>
        <li>
            <a href="ITUnit/Steps to fix Currency and Date format.docx" target="_blank">
                Steps to fix Currency and Date format
            </a>
        </li>
        <li>
            <a href="ITUnit/Steps to remove connection exceed.docx" target="_blank">
                Steps to remove connection exceed
            </a>
        </li>
        <li>
            <a href="ITUnit/Steps to turn off firewall.docx" target="_blank">
                Steps to remove connection exceed
            </a>
        </li>
        <li>
            <a href="ITUnit/STEPS TO TURN OFF FIREWALL.docx" target="_blank">
                Steps to Turn off Firewall
            </a>
        </li>

         <li>
            <a href="ITUnit/Steps to check the IP Address.docx" target="_blank">
                Steps to check IP Address
            </a>
        </li>

    </ul>
</asp:Content>

