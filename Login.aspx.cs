using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Login : System.Web.UI.Page
{
    UserTable ut = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                Session.Abandon();
                Session.Clear();

            }
        }
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string IP = string.Empty;
        System.Web.HttpContext current = System.Web.HttpContext.Current;
        string IPAddress = current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if(!string.IsNullOrEmpty(IPAddress))
        {
            string[] valAddress = IPAddress.Split(',');
            if(valAddress.Length !=0)
            {
                IP = valAddress[0];
            }
        }
        IP = current.Request.ServerVariables["REMOTE_ADDR"];
       
        string userid = txtUserName.Text.ToString();
        //string password = txtPassword.Text;
        DataTable dt = ut.GetUserByUserNamePassword(txtUserName.Text,txtPassword.Text);
       
            if (dt.Rows.Count > 0)
            {
                int i1 = ut.Logout(userid);
                Session["username"] = dt.Rows[0]["Email"];//Email
                Session["UserId"] = dt.Rows[0]["UserId"];
                Session["FullName"] = dt.Rows[0]["FullName"];
                Session["BranchCode"] = dt.Rows[0]["BranchCode"];
                Session["Status"] = dt.Rows[0]["Status"];
                Session["Designation"] = dt.Rows[0]["Designation"];
                Session["Level"] = dt.Rows[0]["Level"];

                int i = ut.GetIp(userid, IP);
                if (txtPassword.Text != "abc123" && txtPassword.Text !="ABC123")
                { 
                Response.RedirectPermanent("~/Default.aspx");
                //lblMessage.Text = "";
                }
                else
                {
                    Response.RedirectPermanent("~/ChangePassword.aspx", false);
                }
                
            }
            else
            {
                lblMessage.Text = "Sorry Invalid Login";
                lblMessage.ForeColor = Color.Red;
            }
       
        
    }
    private string SendMail(string Sender, string Receiver, string Subject, string Body)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(Receiver);
            //mailMessage.CC.Add(CC);
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
    protected void btnResetPasswordL_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text != "")
        {
            DataTable dt = ut.GetUserByUserName(txtUserName.Text);

            if (dt.Rows.Count > 0)
            {
                string Email = dt.Rows[0]["Email"].ToString();
                string password = CreatePassword(7);
               
                int i = ut.ResetPassword(txtUserName.Text, password);
                if (i > 0)
                {
                       string Subject = "Intranet Login Password Reset ";
                    string Body = "Intranet Login Password Reset Successfull:" +
                        Environment.NewLine + "UserId:" + " " + txtUserName.Text +
                        Environment.NewLine + "New Password:" + " " + password +
                        
                         Environment.NewLine +
                         Environment.NewLine +
                        Environment.NewLine + "For Login Follow: http://10.10.5.2/Login.aspx";

                    string status = SendMail("noreply@nccbank.com.np", Email, Subject, Body);
                    string Alert = "Password Reset for:" + " " + txtUserName.Text + "\\n" + "Forwarded to:" + Email;
                    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert  +"\\n" + status + "');</script>");

                }
            }
            else
            {
                string Alert = "Invalid UserId";
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            }
           
        }
        else
        {
            string Alert = "Insert UserId to Reset Password";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

        }
    }


   
}