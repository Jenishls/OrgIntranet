<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
                                    <td class="risklefttd" ><div style="float:left">Forward To</div>
                                        <div style="float:right">:</div></td><td class="riskrighttd">
                                            <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js"type="text/javascript"></script>
    <link href="js/jquery-ui.css"rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=txtForwardTo]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/WebService.asmx/GetUsers") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('-')[0],
                                    val: item.split('-')[1]
                                }
                            }))
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                select: function (e, i) {
                    $("[id$=hfUserId]").val(i.item.val);
                },
                minLength: 1
            });
        });
    </script>
    <asp:TextBox ID="txtForwardTo" runat="server" cssclass="textboxcss" ></asp:TextBox>
    <asp:HiddenField ID="hfUserId" runat="server" /></td></tr>
    </table>
</asp:Content>

