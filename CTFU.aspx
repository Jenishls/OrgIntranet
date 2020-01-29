<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RFUnit.aspx.cs" Inherits="RFUnit" %>

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
      <h3 class="auto-style2">CTFU</h3>
   <ul style="list-style-type:none" class="list">
        <li>
            <a href="CTFU/9. 1 Team Contact Persons.pdf" target="_blank">
                9. 1    &nbsp; Team Contact Persons
            </a>
        </li>
       <li>
            <a href="CTFU/9. 2 Frequently Asked Questions.pdf" target="_blank">
                9. 2    &nbsp;  Frequently Asked Questions
            </a>
        </li>
       <li>
            <a href="CTFU/9. 3 Ref  Payment Cut Off Time.pdf" target="_blank">
                9. 3    &nbsp;  Ref  Payment Cut Off Time
            </a>
        </li>
       <li>
            <a href="CTFU/9. 4 Ref  Approval for Overdue Matters.pdf" target="_blank">
                9. 4    &nbsp;  Ref  Approval for Overdue Matters
            </a>
        </li>
       <li>
            <a href="CTFU/9. 5 Ref  Import DC Documents Arrival Settement Notice.pdf" target="_blank">
                9. 5    &nbsp; Ref  Import DC Documents Arrival Settement Notice
            </a>
        </li>
       <li>
            <a href="CTFU/9. 6 Ref  Payment of Usance Documents on Due Dates.pdf" target="_blank">
                9. 6    &nbsp; Ref  Payment of Usance Documents on Due Dates
            </a>
        </li>
        
       </ul>
</asp:Content>

