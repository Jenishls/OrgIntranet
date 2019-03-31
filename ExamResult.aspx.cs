using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ExamResult : System.Web.UI.Page
{
    DBBranchTable dbt = new DBBranchTable();
    DBUserTableT dut = new DBUserTableT();
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblMsg.Text = "";
        string name = Session["FullName"].ToString();
        string branchcode = Session["BranchCode"].ToString();
        DataTable dt = dbt.GetBranchByBranchCode(branchcode);
        string branchname = dt.Rows[0]["BranchName"].ToString();
        // show exam result
        Examination exam = (Examination)Session["questions"];
        lblName.Text = name;
        lblBranch.Text = branchname;
        lblBranchCode.Text = branchcode;
        //lblDept.Text = dept;
        lblSubject.Text = exam.sname;
        lblStime.Text = exam.StartTime.ToString();
        lblEtime.Text = DateTime.Now.ToString();
        TimeSpan ts = DateTime.Now.Subtract(exam.StartTime);
        lblMin.Text = ts.Minutes.ToString();
        lblNquestions.Text = exam.SIZE.ToString();

        // find how many correct answers
        int cnt = 0;
        foreach (Question q in exam.questions)
        {
            if (q.IsCorrect())
                cnt++;
        }

        lblNcans.Text = cnt.ToString();
        exam.ncans = cnt;
        Session.Add("questions", exam);

        if (cnt >= 35)
            lblGrade.Text = "Excellent";
        else
            if (cnt >= 30 && cnt <=34)
                lblGrade.Text = "Good";
            else
                lblGrade.Text = "Poor";
        // add row to OE_EXAMS table
        
        
    }
   
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.RedirectPermanent("eTest.aspx", true);
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        string userid = Session["UserId"].ToString();
        DataTable dt = dut.GetCertificate(userid);
        int cans = Convert.ToInt32(dt.Rows[0]["nocans"].ToString());
        TimeSpan ts = Convert.ToDateTime(dt.Rows[0]["EDate"].ToString()).Subtract(Convert.ToDateTime(dt.Rows[0]["SDate"].ToString()));

        if (cans >= 30 && ts.Minutes <=45)
        {
            Response.Redirect("Certificate1.aspx", false);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alertify.alert('NCC KEEP',\"Not sufficient mark or can't finished  at given time to view your Certificate.<br/> Please try next time.\");</script>");
        }
    }
    protected void btnBack_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}