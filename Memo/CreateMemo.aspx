<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CreateMemo.aspx.cs" Inherits="Memo_CreateMemo" %>
<%@ Register Assembly="CKEditor.NET"  Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .buttonSection{
            padding-left:200px;
            padding-top:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contenthead" style="float:left">
        NCC- Online Memo
    </div>
    <div>
        <table class="tablecss" style="width:60em; font-family:Verdana; font-size:.8em; font-weight:bold;">
            <tr>
                <td class="risklefttd">
                    To:
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtTo" CssClass="textboxcss" Width="20em" runat="server"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td class="risklefttd">
                    Initiator Dep. of HO:
                </td>
                <td class="riskrighttd">
                    <asp:DropDownList ID="ddlDep" CssClass="textboxcss" runat="server" Width="21.8em"></asp:DropDownList>
                </td>
                <%--<td class="riskrighttd">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlDep" ErrorMessage="Select Department"
                                ForeColor="Red" SetFocusOnError="true" InitialValue="Choose Department" ValidationGroup="a">*</asp:RequiredFieldValidator>
                        </td>--%>
            </tr>
            <tr>
                <td class="risklefttd">
                    Through:
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtThrough" CssClass="textboxcss" Width="20em" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    From:
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtFrom" CssClass="textboxcss" Width="20em" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    Subject:
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtSubject" CssClass="textboxcss" Width="20em" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                    Date:
                </td>
                <td class="riskrighttd">
                    <asp:TextBox ID="txtDate" CssClass="textboxcss" Width="20em" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="risklefttd">
                            <div style="float: left;">
                                Branch
                            </div>
                            <%--<div style="float: right">:</div>--%>
                        </td>
                        <td class="riskrighttd">
                            <asp:DropDownList ID="ddlBranchCode" runat="server" Width="21.8em" BorderColor="SkyBlue" ForeColor="Blue" CssClass="dropboxcss">
                            </asp:DropDownList></td>
                        <%--<td class="riskrighttd">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch"
                                ForeColor="Red" SetFocusOnError="true" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                        </td>--%>
            </tr>
        </table>
    </div>
    <hr />
    <div style="font-family:Verdana; font-size:.8em; font-weight:bold;"> 
        <asp:Label ID="lblFreMemo" runat="server" CssClass="risklefttd" Text="Free Memo:"></asp:Label> <br />
        <CKEditor:CKEditorControl ID="fMemo" BasePath="/ckeditor/" Width="100%" Toolbar="Basic"
                ToolbarBasic="|Bold|Italic|Underline|Strike|-|NumberedList|BulletedList|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|
                |Link|Unlink|-|TextColor|-|Undo|Redo|Cut|Copy|Paste|PasteText|PasteFromWord|
                /
                |Find|Replace|SelectAll|-|Image|Table|HorizontalRule|SpecialChar|-|Format|" runat="server"></CKEditor:CKEditorControl>
        <%--<asp:TextBox ID="TextBox3" TextMode="MultiLine" Rows="10" Width="53em" runat="server"></asp:TextBox>--%>
    </div>
    <div style="font-family:Verdana; font-size:.8em; font-weight:bold;">
        <%--<div>
            <asp:Label ID="Label1" CssClass="risklefttd" runat="server" Text="Attach File(PDF):" Width="40em"></asp:Label>
        </div>
   <div>

   
       <asp:FileUpload ID="FileUpload1" CssClass="textboxcss" Width="40em" runat="server" />
       
</div>--%>
        <hr />
        <div>
            <div>
            <asp:Label ID="lblFile" CssClass="risklefttd" runat="server" Text="Attach File(JPEG):" Width="20em"></asp:Label>
        </div>
            <div>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                    <hr />
                    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="FileId" HeaderText="Image Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:ImageField DataImageUrlField="Path" HeaderText="Image" />
                        </Columns>
                    </asp:GridView>
                    <div id="dialog" style="display: none">
                    </div>
            </div>
        </div>
        <hr />
        <div>
            <asp:Label ID="lblComments" CssClass="risklefttd" runat="server" Text="Comments(if any):" Width="20em"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="txtComments" CssClass="textboxcss" TextMode="MultiLine" runat="server" Width="20em"></asp:TextBox>
        </div>
        <hr />
        <div>
            <asp:Label ID="lblForwardTo" CssClass="risklefttd" runat="server" Text="Forward To:" Width="20em"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="txtForwardTo" CssClass="textboxcss" runat="server" Width="20em"></asp:TextBox>
        </div>
</div>
    <hr />
    <div class="buttonSection">
        <asp:Button ID="btnCreate" CssClass="btnMain btnGreen" runat="server" Text="Create" OnClick="btnCreate_Click" />
        <asp:Button ID="btnCancel" CssClass="btnMain btnRed" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </div>
</asp:Content>

