<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RemitContact.aspx.cs" Inherits="Remittance_RemitContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable tbody td {
  font-size: 13px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
}
table.blueTable tfoot td {
  font-size: 14px;
}
table.blueTable tfoot .links {
  text-align: right;
}
table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contenthead" style="float:left">
        NCC- Remittance List
    </div>
    <div style="padding-left:2em;padding-bottom:.5em;">
        <a style="color:blue; font-style:italic; font-size:larger" 
            href="RemitDetails.aspx">Click here for Installation Process</a>
    
        </div>
    <div>
        <table class="blueTable">
            <tr>
                <th class="blueTable thead th">
                    S.N.
                </th>
                <th>
                    Name of the Remittance Companies
                </th>
                <th>
                    Phone/Toll Free
                </th>
                </tr>
            <tr>
                <td>
                    1.
                </td>
                
                <td>
                    INTERNATIONAL MONEY  EXPRESS (IME )REMIT 

                </td>
                
                <td>
                    01-4430600/16600151515

                </td>
            </tr>
            <tr>
                <td>
                    2.
                </td>
                
                <td>
                    WESTERN UNION MONEY TRANSFER 

                </td>
                
                <td>
                    01-5554677 

                </td>
            </tr>
            <tr>
                <td>
                    3.
                </td>
                
                <td>
                    PRABHU MONEY TRANSFER 

                </td>
                
                <td>
                    01-4169277/16600144444 

                </td>
            </tr>
            <tr>
                <td>
                    4.
                </td>
                
                <td>
                    CITY EXPRESS MONEY XFR 

                </td>
                
                <td>
                    01-4431900 

                </td>
            </tr>
            <tr>
                <td>
                    5.
                </td>
                
                <td>
                    HIMAL REMIT 

                </td>
                
                <td>
                    01-4215579 

                </td>
            </tr>
            <tr>
                <td>
                    6.
                </td>
                
                <td>
                    NABIL REMIT 

                </td>
                
                <td>
                    01-5554677 

                </td>
            </tr>
            <tr>
                <td>
                    7.
                </td>
                
                <td>
                    GME REMIT

                </td>
                
                <td>
                    01-4024067/16600199988 

                </td>
            </tr>
            <tr>
                <td>
                    8.
                </td>
                
                <td>
                    BOOM REMIT

                </td>
                
                <td>
                    01-4287834/16600187734 

                </td>
            </tr>
            <tr>
                <td>
                    9.
                </td>
                
                <td>
                    SAMSARA REMIT

                </td>
                
                <td>
                    01-4441724/16600171819 

                </td>
            </tr>
            <tr>
                <td>
                    10.
                </td>
                
                <td>
                    IPAY REMIT

                </td>
                
                <td>
                    01-4435122/16600100016 

                </td>
            </tr>
            <tr>
                <td>
                    11.
                </td>
                
                <td>
                    SDBL REMIT

                </td>
                
                <td>
                    01-5242602 

                </td>
            </tr>
            <tr>
                <td>
                    12.
                </td>
                
                <td>
                    NEPAL REMIT INTERNATIONAL

                </td>
                
                <td>
                    01-4168800 

                </td>
            </tr>
            <tr>
                <td>
                    13.
                </td>
                
                <td>
                    SANIMA EXPRESS REMIT

                </td>
                
                <td>
                    01-4428979 

                </td>
            </tr>
            <tr>
                <td>
                    14.
                </td>
                
                <td>
                    CASHWAY MONEY TRANSFER

                </td>
                
                <td>
                    01-4444205 

                </td>
            </tr>
            <tr>
                <td>
                    15.
                </td>
                
                <td>
                    PRITHVI REMIT

                </td>
                
                <td>
                    01-4228229 

                </td>
            </tr>
        </table>
    </div>
    
</asp:Content>

