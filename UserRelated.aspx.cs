using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRelated : System.Web.UI.Page
{
    DBTraceFile dre = new DBTraceFile();
    UserTable ut = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                MultiView1.ActiveViewIndex = 3;
            }
            else
            {
                //LoadCreateEvent();
                //LoadEvents();
                Response.Redirect("~/Login.aspx");
            }
        }
        
    }
    protected void btnCreateUser_Click(object sender, EventArgs e)
    {
        
        btnSave.Text = "Save";
        btnResetPassword.Visible = false;
        trpassword.Visible = true;
        LoadEmptyCreationForm();
    }

    private void LoadEmptyCreationForm()
    {
        DataTable dt = ut.GetUserByUserName(txtUserId.Text);
        if (dt.Rows.Count > 0)
        {
            //string Alert = "UserId Already Exists";

            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','UserId Already Exists');</script>");
            
            MultiView1.ActiveViewIndex = 3;
            return;
           
        }
        else
        {
            if (txtUserId.Text != "")
            {
                MultiView1.ActiveViewIndex = 2;
                lblUserIdC.Text = txtUserId.Text;
                DataTable dbt = dre.GetAllBranch();
                ddlBranchCode.DataSource = dbt;
                ddlBranchCode.DataValueField = "BranchCode";
                ddlBranchCode.DataTextField = "Branch";
                ddlBranchCode.DataBind();
                ddlBranchCode.Items.Insert(0, "Choose Branch");
                DataTable ddpt = ut.GetAllDepartments();
                ddlDepartment.DataSource = ddpt;
                ddlDepartment.DataValueField = "Department";
                ddlDepartment.DataTextField = "Department";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, "Choose Department");
                txtUserId.Text = "";
                txtPassword.Text = "";
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtGender.Text = "";
                DataTable ddgn = ut.GetDesignation();
                ddlDesignation.DataSource = ddgn;
                ddlDesignation.DataValueField = "Designation";
                ddlDesignation.DataTextField = "Designation";
                ddlDesignation.DataBind();
                ddlDesignation.Items.Insert(0, "Choose Designation");
                //txtDesignation.Text = "";
                txtStaffId.Text = "";
               // ddlStatus.Text = "";
                txtMobileNo.Text = "";

            }
            else
            {
                //string Alert = "Enter UserId";
                ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','Enter UserId');</script>");
                MultiView1.ActiveViewIndex = 3;
                return;
            }  
        }
    }

   
    protected void btnView_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        DataTable dt = ut.GetUserByUserName(txtUserId.Text);
        if (dt.Rows.Count > 0)
        {
            lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();
            lblDepartment.Text = dt.Rows[0]["Department"].ToString();
            lblUserId.Text = dt.Rows[0]["UserId"].ToString();
           // lblPassword.Text = dt.Rows[0]["Password"].ToString();
            lblFullName.Text = dt.Rows[0]["FullName"].ToString();
            lblEmail.Text = dt.Rows[0]["Email"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            lblLevel.Text = dt.Rows[0]["Level"].ToString();
            if (lblLevel.Text == "A")
            {
                lblLevel.Text = "Assistant";
            }
            else if (lblLevel.Text == "O")
            {
                lblLevel.Text = "Officer";
            }
            else if (lblLevel.Text == "M")
            {
                lblLevel.Text = "Manager";
            }
            else if (lblLevel.Text == "E")
            {
                lblLevel.Text = "Executive";
            }
            lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
            lblStaffId.Text = dt.Rows[0]["StaffId"].ToString();
            lblStatus.Text = dt.Rows[0]["Status"].ToString();
            lblMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
        }
        else
        {
            //string Alert = "Invalid UserId";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','Invalid UserId');</script>");
            MultiView1.ActiveViewIndex = 3;
            return;
        }
    }

    private void LoadEmptyViewUserDetail()
    {
        lblUserId.Text = "";
        DataTable dbt = dre.GetAllBranch();
        ddlBranchCode.DataSource = dbt;
        ddlBranchCode.DataValueField = "BranchCode";
        ddlBranchCode.DataTextField = "Branch";
        ddlBranchCode.DataBind();
        lblDepartment.Text = "";
        lblUserId.Text = "";
        //lblPassword.Text = "";
        lblFullName.Text = "";
        lblEmail.Text = "";
        lblGender.Text = "";
        lblLevel.Text = "";
        lblDesignation.Text = "";
        lblStaffId.Text = "";
        lblStatus.Text = "";
        lblMobileNo.Text = "";
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        
        MultiView1.ActiveViewIndex = 2;
        btnResetPassword.Visible = true;
        trpassword.Visible = false;
        btnSave.Text = "Update";
        btnCancel.Text = "Cancel";
        btnResetPassword.Text = "ResetPassword";
        DataTable dt = ut.GetUserByUserName(lblUserId.Text);
        if (dt.Rows.Count > 0)
        {
            lblUserIdC.Text = lblUserId.Text;
            DataTable dbt = dre.GetAllBranch();
            ddlBranchCode.DataSource = dbt;
            ddlBranchCode.DataValueField = "BranchCode";
            ddlBranchCode.DataTextField = "Branch";
            
            ddlBranchCode.DataBind();
            ddlBranchCode.Items.Insert(0, "Choose Branch");
           // ddlBranchCode.SelectedValue = dt.Rows[0]["BranchCode"].ToString();

            DataTable ddpt = ut.GetAllDepartments();
            ddlDepartment.DataSource = ddpt;
            ddlDepartment.DataValueField = "Department";
            ddlDepartment.DataTextField = "Department";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, "Choose Department");
            DataTable ddgn = ut.GetDesignation();
            ddlDesignation.DataSource = ddgn;
            ddlDesignation.DataValueField = "Designation";
            ddlDesignation.DataTextField = "Designation";
            ddlDesignation.DataBind();
            ddlDesignation.Items.Insert(0, "Choose Designation");
            //ddlDepartment.SelectedValue = dt.Rows[0]["Department"].ToString(); 
            
            txtUserId.Text = dt.Rows[0]["UserId"].ToString();
           // txtPassword.Text = dt.Rows[0]["Password"].ToString();
            txtFullName.Text = dt.Rows[0]["FullName"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            txtGender.Text = dt.Rows[0]["Gender"].ToString();
            ddlLevel.SelectedItem.Text = dt.Rows[0]["Level"].ToString();
            if (ddlLevel.SelectedItem.Text == "A")
            {
                ddlLevel.SelectedItem.Text = "Assistant";
            }
            else if (ddlLevel.SelectedItem.Text == "O")
            {
                ddlLevel.SelectedItem.Text = "Officer";
            }
            else if (ddlLevel.SelectedItem.Text == "M")
            {
                ddlLevel.SelectedItem.Text = "Manager";
            }
            else if (ddlLevel.SelectedItem.Text == "E")
            {
                ddlLevel.SelectedItem.Text = "Executive";
            }
            ddlDesignation.SelectedItem.Text = dt.Rows[0]["Designation"].ToString();
            txtStaffId.Text = dt.Rows[0]["StaffId"].ToString();
            ddlStatus.Text = dt.Rows[0]["Status"].ToString();
            txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            //ddlDepartment.Text = dt.Rows[0]["Department"].ToString();
            
        }

        LoadEmptyViewUserDetail();
    }
    
    protected void btnOK_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
         LoadEmptyViewUserDetail();
    }
    protected void btnViewAllUsers_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        DataTable dt = ut.GetAllUser();
        gvGetAllUsers.DataSource = dt;
        gvGetAllUsers.DataBind();
    }
    protected void gvGetAllUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
        string UserIdView = gvGetAllUsers.SelectedDataKey.Value.ToString();
        MultiView1.ActiveViewIndex = 1;
        DataTable dt = ut.GetUserByUserName(UserIdView);
        if (dt.Rows.Count > 0)
        {
            lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();
            lblDepartment.Text = dt.Rows[0]["Department"].ToString();
            lblUserId.Text = dt.Rows[0]["UserId"].ToString();
          //  lblPassword.Text = dt.Rows[0]["Password"].ToString();
            lblFullName.Text = dt.Rows[0]["FullName"].ToString();
            lblEmail.Text = dt.Rows[0]["Email"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            lblLevel.Text = dt.Rows[0]["Level"].ToString();
            if (lblLevel.Text == "A")
            {
                lblLevel.Text = "Assistant";
            }
            else if (lblLevel.Text == "O")
            {
                lblLevel.Text = "Officer";
            }
            else if (lblLevel.Text == "M")
            {
                lblLevel.Text = "Manager";
            }
            else if (lblLevel.Text == "E")
            {
                lblLevel.Text = "Executive";
            }
            lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
            lblStaffId.Text = dt.Rows[0]["StaffId"].ToString();
            lblStatus.Text = dt.Rows[0]["Status"].ToString();
            lblMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
        }
        else
        {
            //string Alert = "Invalid UserId";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','Invalid UserId');</script>");

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            int i = ut.CreateUser(ddlBranchCode.Text, ddlDepartment.Text, lblUserIdC.Text, txtPassword.Text, txtFullName.Text, txtEmail.Text, txtGender.Text, ddlDesignation.Text, txtStaffId.Text, ddlStatus.Text, txtMobileNo.Text, ddlLevel.SelectedValue);
            if (i > 0)
            {
                //string Alert = "User Created:"+" "+lblUserIdC.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','" + lblUserIdC.Text + " <br /> User Created Successfully.');</script>");
                MultiView1.ActiveViewIndex = 3;
                return;

            }
        }
        if (btnSave.Text == "Update")
        {
            int i = ut.UpdateUser(ddlBranchCode.Text, ddlDepartment.Text, lblUserIdC.Text, txtFullName.Text, txtEmail.Text, txtGender.Text, ddlDesignation.Text, txtStaffId.Text, ddlStatus.Text, txtMobileNo.Text, ddlLevel.SelectedValue);
            if (i > 0)
            {
                string Alert = "User Updated:" + " " + lblUserIdC.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet',' User " + lblUserIdC.Text + " Updated Successfully.');</script>");
                MultiView1.ActiveViewIndex = 3;
                return;

            }
        }
        
        LoadEmptyViewUserDetail();
        MultiView1.ActiveViewIndex = 3;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
       
        LoadEmptyViewUserDetail();
        MultiView1.ActiveViewIndex = 3;
    }
    public string CreatePassword(int length)
    {
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
    }
    private string SendMail(string Sender, string Receiver, string Subject, string Body)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(Receiver);
            mailMessage.From = new MailAddress(Sender);
            mailMessage.Subject = Subject;
            mailMessage.Body = Body;
            SmtpClient smtpClient = new SmtpClient("192.168.100.2");
            smtpClient.Send(mailMessage);
            return ("E-mail sent!");
        }
        catch (Exception ex)
        {
            return ("Could not send the e-mail - error: " + ex.Message);
        }
    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        if (btnResetPassword.Text == "ResetPassword")
        {
            string password = CreatePassword(7);
            int i = ut.ResetPassword(lblUserIdC.Text,password);
            if (i > 0)
            {
                
                 string Subject = "Intranet Login Password Reset ";
                        string Body = "Intranet Login Password Reset Successfully:" +
                            Environment.NewLine + "UserId:" + " " + lblUserIdC.Text +
                            Environment.NewLine + "New Password:" + " " + password +

                             Environment.NewLine +
                             Environment.NewLine +
                            Environment.NewLine + "For Login Follow: http://nccintranet.nccbank.com.np/Login.aspx";

                        string status = SendMail("noreply@nccbank.com.np", txtEmail.Text, Subject, Body);
                        string Alert = "Password Reset for:" + " " + lblUserIdC.Text + "\\n" + "Forwarded to:" + txtEmail.Text; 
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

            }

            
                
        }
    }
    protected void btnBranch_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        string branchcode = txtUserId.Text;
        
        DataTable dtb = ut.GetUserByBranch(branchcode);
        gvGetAllUsers.DataSource = dtb;
        gvGetAllUsers.DataBind();

    }
    
}