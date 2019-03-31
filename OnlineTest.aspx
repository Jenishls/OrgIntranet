<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OnlineTest.aspx.cs" Inherits="OnlineTest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color:#951846">NCC Bank Online Test</h1>
    <div style="height: 50px; width: 300px">
        <asp:ScriptManager ID="Sp" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Interval="1000" runat="server"></asp:Timer>
        <asp:UpdatePanel ID="Up" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <asp:Label ID="litMsg" runat="server"></asp:Label>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        
    </div>
    <asp:Label ID="Label1" runat="server" Text="Please select one option for each question. All questions are compulsory."></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Correct Answer:"></asp:Label>
    <br />
    <asp:Label ID="Label3"  runat="server" Text="Wrong Answer:"></asp:Label>
    <%--<h3 id="h3" style="color:red">Please select one option for each question. All questions are compulsory.</h3>--%>
    <hr />
    
    <div id="popup" style="max-height:450px;overflow-y:scroll;">
    <asp:GridView ID="GridView1" PageSize="1" ForeColor="BlueViolet" BackColor="Window" AlternatingRowStyle-BackColor="#007acc" AlternatingRowStyle-ForeColor="White" AlternatingRowStyle-BorderColor="WindowFrame" CellPadding="5" CellSpacing="2" AutoGenerateColumns="false" ShowHeader="false" runat="server" GridLines="None">
        <Columns>
            <asp:TemplateField ItemStyle-ForeColor="">
                <ItemTemplate>
                    <asp:Label runat="server" Font-Size="Large" ID="QuestionId" Text='<%#GetID(Container.DataItem) %>' />
                    <asp:Label runat="server" Text="." />
                    <asp:Label runat="server" Font-Size="Large" ID="Question" Text='<%# Eval("Question") %>' />
                    <br />
                    <hr />
                    <asp:RadioButton runat="server" ForeColor="SaddleBrown" GroupName="a" ID="ans1" Text='<%# Eval ("ans1") %>' />
                    <br />
                    <asp:RadioButton runat="server" ForeColor="SaddleBrown" GroupName="a" ID="ans2" Text='<%# Eval ("ans2") %>' />
                    <br />
                    <asp:RadioButton runat="server" ForeColor="SaddleBrown" GroupName="a" ID="ans3" Text='<%# Eval ("ans3") %>' />
                    <br />
                    <asp:RadioButton runat="server" ForeColor="SaddleBrown" GroupName="a" ID="ans4" Text='<%# Eval ("ans4") %>' />
                    <hr style="color:aliceblue" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
        </div>
    <asp:Button runat="server" ID="btnSubmit" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:Button runat="server" ID="btnBack" CssClass="btn" Text="Back" OnClick="btnBack_Click" />
</asp:Content>


