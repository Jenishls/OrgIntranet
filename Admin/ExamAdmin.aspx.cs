using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Drawing;

public partial class Admin_ExamAdmin : System.Web.UI.Page
{
    UserTable ut = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        ddlStatus.Items.Insert(0, "Choose One");
        lblStatus.Visible = false;
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string userid = txtUserId.Text;
        int status = Convert.ToInt32(ddlStatus.SelectedValue);

        int i = ut.UpdateExam(userid, status);
        if(i > 0)
        {
            lblMsg.Text = "Status of:" + "  " + userid + "  " + "has been updated.";
            lblMsg.ForeColor = System.Drawing.Color.Green;
            
        }
        else
        {
            lblMsg.Text = "Status of:" + "  " + userid + "  " + "is already Unblocked";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        txtUserId.Text = "";
       
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamAdmin.aspx", false);
    }
    protected void txtUserId_TextChanged(object sender, EventArgs e)
    {
        string userid = txtUserId.Text;
        DataTable dt = ut.GetExam(userid);
        lblStatus.Visible = true;
        if(dt.Rows.Count>0)
        { 
        int status =Convert.ToInt32(dt.Rows[0]["examstatus"].ToString());
        if (status == 1)
        {
            lblStatus.Text = "Blocked";
            lblStatus.ForeColor = Color.Red;
            lblStatus.BackColor = Color.White;
        }
        else 
        {
            lblMsg.Text = "Exam Completed/Running or User:" + " " + userid + "  " + "does not exist in exam table";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            //lblStatus.Text = "Running";
            //lblStatus.ForeColor = Color.GreenYellow;
            //ddlStatus.Visible = false;
            //btnUpdate.Enabled = false;
            //btnUpdate.ForeColor = Color.Lime;
        }
        //else
        //{
        //    lblStatus.Text = "Completed";
        //    lblStatus.ForeColor = Color.Green;
        //    ddlStatus.Visible = false;
        //    btnUpdate.Enabled = false;
        //    btnUpdate.ForeColor = Color.Lime;
        //}
        }
        else
        {
            lblMsg.Text = "Exam Completed/Running or User:" + " " + userid + "  " + "does not exist in exam table";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            btnUpdate.Enabled = false;
            btnUpdate.ForeColor = Color.Lime;
            ddlStatus.Enabled = false;
        }
    }
}