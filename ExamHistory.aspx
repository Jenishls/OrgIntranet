<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ExamHistory.aspx.cs" Inherits="ExamHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Examinations History</h2>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
        PageSize="3" BorderColor="Black" CellPadding="3" CellSpacing="2"  Width="100%" AllowPaging="True">
        <RowStyle Font-Names="Verdana" Font-Size="10pt" />
        <HeaderStyle BackColor="#0000C0" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
            ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myconnection %>"
        SelectCommand="SELECT Distinct 'Subject'=sname, 'No Of Ques.'=e.noq ,'No Of Correct Ans.'= nocans, 'No Of Wrong Ans'= e.noq - nocans, 
        'Exam Start At'=stdate,'Exam End At'=enddate,'Spent Minute' = datediff(mi,stdate,enddate)   
        FROM  OTexams e, OTsubjects s where  e.sid = s.sid and   UserId = @userid order by  stdate desc">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnBack" CssClass="btn1" runat="server" OnClick="btnBack_Click" Text="Back To Page" />
</asp:Content>

