<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ExamHistory.aspx.cs" Inherits="ExamHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script runat="server">
  
        void GridView1_SelectedIndexChanged(Object sender, EventArgs e)
  {
      Session["examId"] = GridView1.SelectedRow.Cells[0].Text;
      Message.Text =Session["examId"].ToString();
            
          Response.Redirect("~/Certificate1.aspx");
  }
  
</script>

    <h2>
        Examinations History</h2> <asp:Label id="Message"
        forecolor="Red"
        runat="server"/>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false"
        PageSize="3" BorderColor="Black" CellPadding="3" CellSpacing="2"  Width="100%" AllowPaging="True"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
        >
        <RowStyle Font-Names="Verdana" Font-Size="10pt" />
        <HeaderStyle BackColor="#0000C0" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
            ForeColor="White" />
        <Columns>
                <asp:BoundField DataField="examid" HeaderText="Exam ID" />
                <asp:BoundField DataField="sname" HeaderText="Subject" />
                <asp:BoundField DataField="No of Ques." HeaderText="No of Ques." />
                <asp:BoundField DataField="No Of Correct Ans." HeaderText="No Of Corect Ans" />
                <asp:BoundField DataField="No Of Wrong Ans" HeaderText="No Of Wrong Ans" />
                <asp:BoundField DataField="Exam Start At" HeaderText="Exam Start At" />
                <asp:BoundField DataField="Exam End At" HeaderText="Exam End At" />
                <asp:BoundField DataField="Spent Minute" HeaderText="Spent Minute" />
                <asp:CommandField ShowSelectButton="True"  SelectText="Certificate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource DataSourceMode="DataSet" ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myconnection %>"
        SelectCommand="SELECT Distinct sname, 'No Of Ques.'=e.noq ,'No Of Correct Ans.'= nocans, 'No Of Wrong Ans'= e.noq - nocans, 
        'Exam Start At'=stdate,'Exam End At'=enddate,'Spent Minute' = datediff(mi,stdate,enddate), e.examid   
        FROM  OTexams e, OTsubjects s where  e.sid = s.sid and   UserId = @userid order by  stdate desc"  >
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnBack" CssClass="btn1" runat="server" OnClick="btnBack_Click" Text="Back To Page" />
</asp:Content>

