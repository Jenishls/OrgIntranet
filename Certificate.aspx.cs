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
 


public partial class Certificate : System.Web.UI.Page
{
    DBUserTableT dut = new DBUserTableT();
    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Session["UserId"].ToString();
        //string username = Session["FullName"].ToString();
        DataTable dt = dut.GetCertificate(userid);
        lblName.Text = dt.Rows[0]["FullName"].ToString();
        lblBranch.Text = dt.Rows[0]["BranchName"].ToString();
        lblMark.Text = dt.Rows[0]["Mark"].ToString();
        lblSubject.Text = dt.Rows[0]["sname"].ToString();
        lblDate.Text = DateTime.Now.ToLongDateString();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}