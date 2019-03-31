using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ChangePassword : System.Web.UI.Page
{
    UserTable ut = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                lblUserId.Text = Session["UserId"].ToString();
            }
            else
            {
                //LoadCreateEvent();
                //LoadEvents();
                Response.Redirect("~/Login.aspx");
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        DataTable dt = ut.GetUserByUserNamePassword(lblUserId.Text, txtOldPassword.Text);
        if (dt.Rows.Count > 0)
        {
            if (txtNewPassword.Text == txtConfirmPassword.Text && txtNewPassword.Text!="")
            {
                int i = ut.ResetPassword(lblUserId.Text, txtNewPassword.Text);
                if (i > 0)
                {
                    string Alert = "Password Changed Successfully.";

                    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
                    Response.Redirect("Login.aspx");
                   
                }
            }
            else
            {
                string Alert = "Password Not Changed." + "\\n" + "New & Confirm Password Mismatch.";

                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            }

        }
        else
        {

            string Alert = "Oldpassword  Incorrect.";

            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
            
                   
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx"); 
    }
}