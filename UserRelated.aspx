<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="UserRelated.aspx.cs" Inherits="UserRelated" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/alertify.min.css" rel="stylesheet" />
    <script src="js/alertify.min.js"></script>
    <style>
        .alertify .ajs-dialog {
            top: 50%;
            transform: translateY(-50%);
            margin: auto;
        }
        .ajs-message.ajs-custom { 
            color: #31708f;  
            background-color: #d9edf7;  
            border-color: #31708f;
        }
        .btnMain {
            display: inline-block;
            font-weight: 300;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            padding: .375rem .75rem;
            font-size: .75rem;
            line-height: 1.5;
            border-radius: .25rem;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            color: white;
            padding-left: 20px;
        }

        .btnGreen {
            background-color: #0db42f;
            padding-left: 10px;
        }

            .btnGreen:hover {
                background-color: #50b765;
            }

        .btnRed {
            background-color: red;
        }

            .btnRed:hover {
                background-color: #eb5454;
            }

        .buttonSection {
            padding-left: 5px;
            padding-top: .5em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="contenthead">User Related Affairs</div>

    <div style="font-family: Verdana">
        <div style="padding-left: 15em;">
            <table>
                <tr>
                    <td style="font-size: .9em; font-weight: bold; color: blue;">UserId/BranchCode :</td>
                    <td>
                        <asp:TextBox ID="txtUserId" CssClass="textboxcss" Width="120" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttonSection" style="padding-left: 15em;">
            <asp:Button ID="btnCreateUser" CssClass="btnMain btnGreen" runat="server" Text="Create User" ForeColor="WhiteSmoke" OnClick="btnCreateUser_Click" />
            <asp:Button ID="btnView" CssClass="btnMain btnGreen" runat="server" Text="View User Detail" ForeColor="Yellow" OnClick="btnView_Click" />
            <asp:Button ID="btnViewAllUsers" CssClass="btnMain btnGreen" runat="server" Text="View All Users" ForeColor="Wheat" OnClick="btnViewAllUsers_Click" />
            <asp:Button ID="btnBranch" CssClass="btnMain btnGreen" runat="server" Text="View Branch User" ForeColor="Maroon" OnClick="btnBranch_Click" />
        </div>
    </div>
    <div style="margin-top: 10px">
        <asp:MultiView ID="MultiView1" runat="server">

            <asp:View ID="View1AllUsers" runat="server">
                <div style="padding-left: 0em; font-family: Verdana; font-size: .8em;">
                    <asp:GridView ID="gvGetAllUsers" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="UserId" OnSelectedIndexChanged="gvGetAllUsers_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="S.N.">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserId" HeaderText="UserId" />
                            <asp:BoundField DataField="FullName" HeaderText="FullName" />
                            <asp:BoundField DataField="BranchCode" HeaderText="BranchCode" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Designation" HeaderText="Designation" />
                            <%--<asp:BoundField DataField="Level" HeaderText="Level" />--%>
                            <asp:CommandField HeaderText="View" SelectText="View" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </asp:View>
            <asp:View ID="View2UserDetail" runat="server">

                <div style="color: blue; font-weight: bold; padding-left: 5em;">Selected User Detail</div>
                <div style="font-family: Verdana; font-size: .9em; padding-left: 5em;">
                    <table class="tablecss">
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">BranchCode</div>
                                <div style="float: right">:</div>
                            </td>

                            <td class="riskrighttd">
                                <asp:Label ID="lblBranchCode" runat="server" Text=""></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Department</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblDepartment" runat="server"></asp:Label>

                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">UserId</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">

                                <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">FullName</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblFullName" runat="server"></asp:Label>

                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Email</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">

                                <asp:Label ID="lblEmail" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Gender</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblGender" runat="server"></asp:Label>

                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Level</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblLevel" runat="server"></asp:Label>

                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Designation</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">

                                <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Staff Id</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblStaffId" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Status</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblStatus" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">MobileNo</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:Label ID="lblMobileNo" runat="server"></asp:Label>
                            </td>

                        </tr>
                    </table>
                    <div class="buttonSection" style="padding-left: 20em;">
                        <asp:Button ID="btnOK" CssClass="btnMain btnGreen" runat="server" Text="OK" OnClick="btnOK_Click" />
                        <asp:Button ID="btnEdit" CssClass="btnMain btnGreen" runat="server" ForeColor="YellowGreen" Text="Edit" ValidationGroup="a" OnClick="btnEdit_Click" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View3CreateUser" runat="server">
                <div style="color: blue; font-weight: bold; padding-left: 5em;">User Create/Update</div>
                <div style="font-family: Verdana; font-size: .9em; padding-left: 5em;">
                    <table class="tablecss">
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">UserId</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">

                                <asp:Label ID="lblUserIdC" runat="server" CssClass="textboxcss" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">BranchCode</div>
                                <div style="float: right">:</div>
                            </td>

                            <td class="riskrighttd">
                                <asp:DropDownList ID="ddlBranchCode" runat="server" CssClass="dropboxcss" InitialValue="Choose Branch">
                                </asp:DropDownList></td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchCode" ErrorMessage="Select Branch" ForeColor="Red" InitialValue="Choose Branch" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Department</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropboxcss" InitialValue="Choose Department">
                                </asp:DropDownList></td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlDepartment" ErrorMessage="Choose Department" ForeColor="Red" InitialValue="Choose Department" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="trpassword" runat="server" visible="true">
                            <td class="risklefttd">
                                <div style="float: left">Password</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtPassword" CssClass="textboxcss" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">FullName</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtFullName" CssClass="textboxcss" runat="server"></asp:TextBox>

                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Email</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">

                                <asp:TextBox ID="txtEmail" CssClass="textboxcss" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Gender</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <div style="float: left">
                                    <asp:TextBox ID="txtGender" CssClass="textboxcss" runat="server"></asp:TextBox>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Level</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:DropDownList ID="ddlLevel" CssClass="dropboxcss" runat="server">
                                    <asp:ListItem>Choose Level</asp:ListItem>
                                    <asp:ListItem Text="Assistant" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="Officer" Value="O"></asp:ListItem>
                                    <asp:ListItem Text="Manger" Value="M"></asp:ListItem>
                                    <asp:ListItem Text="Executive" Value="E"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlLevel" ErrorMessage="Choose Level"
                                    ForeColor="Red" InitialValue="Choose Level" ValidationGroup="a">*</asp:RequiredFieldValidator>

                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Designation</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:DropDownList ID="ddlDesignation" CssClass="dropboxcss" runat="server"></asp:DropDownList>
                                <%--<asp:TextBox ID="txtDesignation" CssClass="textboxcss" runat="server"></asp:TextBox>--%>
                            </td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlDesignation" ErrorMessage="Choose Designation"
                                    ForeColor="Red" InitialValue="Choose Designation" ValidationGroup="a">*</asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Staff Id</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtStaffId" CssClass="textboxcss" runat="server"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">Status</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropboxcss">
                                    <asp:ListItem>Choose Status</asp:ListItem>
                                    <asp:ListItem>NormalUser</asp:ListItem>
                                    <asp:ListItem>IsBM</asp:ListItem>
                                    <asp:ListItem>IsOI</asp:ListItem>
                                    <asp:ListItem>IsCI</asp:ListItem>
                                    <asp:ListItem>System</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>IsClosed</asp:ListItem>
                                    <asp:ListItem>Executive</asp:ListItem>
                                    <asp:ListItem>CRO</asp:ListItem>
                                    <asp:ListItem>DCEO</asp:ListItem>
                                    <asp:ListItem>CEO</asp:ListItem>
                                    <asp:ListItem>IntraUser</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="riskrighttd">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Choose Status"
                                    ForeColor="Red" InitialValue="Choose Status" ValidationGroup="a">*</asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td class="risklefttd">
                                <div style="float: left">MobileNo</div>
                                <div style="float: right">:</div>
                            </td>
                            <td class="riskrighttd">
                                <asp:TextBox ID="txtMobileNo" CssClass="textboxcss" runat="server"></asp:TextBox>
                            </td>

                        </tr>
                    </table>
                    <div class="buttonSection" style="padding-left: 15em;">
                        <asp:Button ID="btnSave" Style="margin-left: 50px" CssClass="btnMain btnGreen" runat="server" Text="" ValidationGroup="a" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btnMain btnRed" OnClick="btnCancel_Click" Text="Cancel" />
                        <asp:Button ID="btnResetPassword" runat="server" CssClass="btnMain btnGreen" OnClick="btnResetPassword_Click" Text="" />
                    </div>

                </div>
            </asp:View>
             <asp:View ID="View3Empty" runat="server"></asp:View>
        </asp:MultiView>
    </div>
</asp:Content>

