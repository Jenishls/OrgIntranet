<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Certificate1.aspx.cs" Inherits="Certificate1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style2 {
            color: #FFFFFF;
            font-style: italic;
            background-color: #3333CC;
        }
        .auto-style3 {
            font-size: xx-large;
            color:white;
            font-weight: 700;
        }
        .certificate{
            z-index:555;position:absolute;top:531px;right:420px;
        }
    </style>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.rawgit.com/niklasvh/html2canvas/master/dist/html2canvas.min.js"></script>
    <script type="text/javascript">
        function ConvertToCanvas(btnExporttoimage) {
            html2canvas($("#ContentInfo")[0]).then(function (canvas) {
                var base64 = canvas.toDataURL();
                $("[id*=hdnImageData]").val(base64);
                __doPostBack(btnExporttoimage.name, "");
            });
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align:center;">
        <h3 class="auto-style2">NCC-KEEP Certificate </h3>
        </div>
        <div id="ContentInfo" runat="server" class="contentdiv">
            
    <div id="Cert1" runat="server" style=" margin-left:50px; height:600px; width:800px;  border-radius: 15px; background-repeat:no-repeat;">
        <img src="../Image/Certificate.jpg" style="z-index:1;"/>
        <div class="certificate">
        <div style="margin-left:250px; height:20px; font-size:x-large; z-index:999;font-style:italic; font-family:vardana; font-weight:bold;">
    <asp:Label ID="lblName" runat="server"></asp:Label>
   </div>
        <br />
        <%--<br />--%>
            <div class="info">
        <div style="margin-left:490px; height:15px;">
    <asp:Label ID="lblSubject" runat="server"></asp:Label>
     </div>
        <br />
        <div style="margin-left:340px; height:25px;">
        <asp:Label ID="lblGrade" runat="server"></asp:Label>
     </div>
        <br />
        <br />
        <div style="margin-left:450px;">
    <asp:Label ID="lblDate" runat="server"></asp:Label>
     </div>
            </div>
        </div>
        </div>
        </div>
        <asp:HiddenField ID="hdnImageData" runat="server" />
    
    <%--<asp:Button ID="btnExporttoimage" Text="Export to Image" runat="server" UseSubmitBehavior="false"
        OnClientClick="return ConvertToCanvas(this)" OnClick="btnExporttoimage_Click" />--%>
    <button  type="button"  id="btnExport">Export</button>
    <script src="js/jQuery.print.js"></script>
    <script>
        $('#btnExport').on('click', function () {
            $("#ContentPlaceHolder1_ContentInfo").print({
                globalStyles: true,
                mediaPrint: true,
                stylesheet: '../css/Cert.css',
                noPrintSelector: ".no-print",
                iframe: true,
                append: null,
                prepend: null,
                manuallyCopyFormValues: true,
                deferred: $.Deferred(),
                timeout: 750,
                title: null,
                doctype: '<!doctype html>'
            });
        });
    </script>
</asp:Content>

