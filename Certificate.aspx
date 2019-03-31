<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Certificate.aspx.cs" Inherits="Certificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #0099FF;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <script>
        
       function printpage() {

            var getpanel = document.getElementById("<%= Cert1.ClientID%>");
            var MainWindow = window.open('', '', 'height=600,width=800,left=400,right=400');
            //MainWindow.document.write('<html><head><title>Ncc Bank Ltd - Certificate</title>');
            MainWindow.document.write('</head><body>');
            
            MainWindow.document.write(getpanel.innerHTML);
            MainWindow.document.write('</body></html>');
            MainWindow.document.close();
            setTimeout(function () {
                MainWindow.print();
            }, 500);
            return false;

        }
 </script>
    
    
    <br />
    <br />
    <center>
        <div id="Cert1" runat="server" style="left: 300px; position: absolute; top: 200px;
            width: 700px; height: 500px; background-color:white; border:double; border-color:#940101">
            <asp:Image ID="Image1" ImageUrl="~/Image/logo.gif" runat="server"></asp:Image>
            <%--<br />
            <br />
            <br />
            <br />--%>
            <h2  style="text-decoration:underline; color:#940101;">
                Certificate of Successful Participation on NCC-KTP
            </h2>
            <h3>
                This Certificate has been awarded in recognition of
            </h3>
            <asp:Label ID="lblName" runat="server" ForeColor="" Font-Size="XX-Large" Font-Bold="true" Font-Italic="true" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblBranch" runat="server" Font-Size="X-Large" Font-Bold="true" Text=""></asp:Label>
            <br />
            <br />
            <h3>
                having successfully participated and obtained <asp:Label ID="lblMark" runat="server" Text=""></asp:Label> % score on the subject 
            </h3>
            <%--<br />--%>
            <h3>
                of 
            </h3>
            <%--<br />--%>
            <h3 style="font-weight:bold">
                ..... <asp:Label ID="lblSubject" runat="server" Font-Underline="true" Font-Size="X-Large" Font-Bold="true" ForeColor="Green" Text=""></asp:Label> .....
            </h3>
            <br />
            <asp:Label ID="lblDate" runat="server" Font-Underline="false" Font-Size="Large" ForeColor="Blue" Text=""></asp:Label>
        </div>
    </center>
    
    <br />
    <div style="margin-top:510px; margin-left:575px">
    <%--<asp:Button ID="btnPrint" runat="server" CssClass="btn" Text="Print Certificate" OnClientClick="return printpage();" />--%>
        <asp:Button ID="btnBack" runat="server" CssClass="btn1" Text="Close" OnClick="btnBack_Click" />
        </div>
    
</asp:Content>

