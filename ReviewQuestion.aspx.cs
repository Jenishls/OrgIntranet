using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Drawing.Imaging;
using System.Globalization;

public partial class ReviewQuestion : System.Web.UI.Page
{
    DBUserTableT dut = new DBUserTableT();
    protected void Page_Load(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        DataTable dt = new DataTable();
        dt.Columns.Add("QuestionText");
        dt.Columns.Add("Answer1");
        dt.Columns.Add("Answer2");
        dt.Columns.Add("Answer3");
        dt.Columns.Add("Answer4");
        dt.Columns.Add("YourAnswer");
        dt.Columns.Add("CorrectAnswer");
        dt.Columns.Add("Scope");
        foreach(var item in exam.questions)
        {
            DataRow dr = dt.NewRow();
            dr["QuestionText"] = item.question;
            dr["Answer1"] = item.Answer1;
            dr["Answer2"] = item.Answer2;
            dr["Answer3"] = item.Answer3;
            dr["Answer4"] = item.Answer4;
            dr["YourAnswer"] = item.YourAnswer;
            dr["CorrectAnswer"] = item.CorrectAnswer;
            if(item.YourAnswer==item.CorrectAnswer)
                dr["Scope"] = "../images/tick.png";
            else
                dr["Scope"] = "../images/wrong.png";
            dt.Rows.Add(dr);
        }
        DataList1.DataSource=dt;
        DataList1.DataBind();
       
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        
        string userid = Session["UserId"].ToString();
        DataTable dt = dut.GetCertificate(userid);
        int cans = Convert.ToInt32(dt.Rows[0]["nocans"].ToString());
        TimeSpan ts = Convert.ToDateTime(dt.Rows[0]["EDate"].ToString()).Subtract(Convert.ToDateTime(dt.Rows[0]["SDate"].ToString()));

        if(cans>30 && ts.Minutes <=45)
        {
            Response.Redirect("Certificate1.aspx", false);
        }
        else
        {
            string Alert = "Not sufficient mark or can't finished at given time to view your Certificate. Please try next time. ";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','" + Alert + @"', function(){
                alertify.message('OK');
              });</script>");
        }
        
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}