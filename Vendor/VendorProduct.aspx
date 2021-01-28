<%@ Page Language="C#" MasterPageFile="~/Main.master"  AutoEventWireup="true" CodeFile="ViewVendor.aspx.cs" Inherits="ViewVendor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:Panel ID="Panel2" runat="server">
        <h3>
            Vendor Name
        </h3>
        </asp:Panel>

    <div id="panel" style="height: 500px; background-color: White; padding: 10px; overflow: auto">  
     <h3>
        <a href="../adminIndex.aspx">Back </a>| Service Master  
    </h3> 
    <asp:updatepanel id="UpdatePanelService" runat="server" updatemode="Conditional">  
        <ContentTemplate>  
                <asp:GridView ID="gridService" runat="server" CssClass="EU_DataTable" AutoGenerateColumns="false" ShowFooter="true"OnRowEditing="gridService_RowEditing"            onrowcreated="gridService_RowCreated"onrowupdating="gridService_RowUpdating">  
                    <Columns>  
                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="SR.NO">  
                            <ItemTemplate>  
                                <asp:Label ID="lblID" runat="server"  
                                  Text='<%#Eval("service_id")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="600px" HeaderText="Service">  
                            <ItemTemplate>  
                                <asp:Label ID="lblService" runat="server" Text='<%#Eval("service_name")%>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtService" runat="server" Text='<%#Eval("service_name")%>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <FooterTemplate>  
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  
                            </FooterTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Service Photo">  
                            <ItemTemplate>  
                                <img src='<%# Eval("service_image")%>' alt='<%#  
                                                Eval("service_image")%>' height="50px"  
                                    width="50px" />  
                            </ItemTemplate>  
                            <EditItemTemplate>  
                                <asp:FileUpload ID="fuService" runat="server" />  
                            </EditItemTemplate>  
                            <FooterTemplate>  
                                <asp:FileUpload ID="FileUpload1" runat="server" />  
                            </FooterTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField>  
                            <ItemTemplate>  
                                <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%#  
                                         Eval("service_id")%>'  
                                    OnClientClick="return confirm('Do you want to delete?')"  
                                  Text="Delete"></asp:LinkButton>  
                            </ItemTemplate>  
                            <FooterTemplate>  
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddService"/>  
                            </FooterTemplate>  
                        </asp:TemplateField>  
                        <asp:CommandField ShowEditButton="True" />  
                    </Columns>  
                </asp:GridView>  
                <asp:UpdateProgress ID="UpdateProgress1" runat="server"  
                     AssociatedUpdatePanelID="UpdatePanelService">  
                    <ProgressTemplate>  
                        Please wait image is getting uploaded....  
                    </ProgressTemplate>  
                </asp:UpdateProgress>  
            </ContentTemplate>  
            <Triggers>  
            </Triggers>  
       </asp:updatepanel>  
</div>  

    </asp:Content>
