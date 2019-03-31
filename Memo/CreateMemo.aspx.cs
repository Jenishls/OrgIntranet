using System;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Memo_CreateMemo : System.Web.UI.Page
{
    DBBranchTable bt = new DBBranchTable();
    UserTable ut = new UserTable();
    DBMemo dm = new DBMemo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        CreateMemo();
        }
        if (!this.IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM OnlineMemo", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvImages.DataSource = dt;
                    gvImages.DataBind();
                }
            }
        }

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

    private void CreateMemo()
    {
        string branch = Session["BranchCode"].ToString();
        if (branch == "000")
        {
            DataTable dt = bt.GetAllBranch();
            ddlBranchCode.DataSource = dt;
            ddlBranchCode.DataValueField = "BranchCode";
            ddlBranchCode.DataTextField = "Branch";
            ddlBranchCode.DataBind();
            ddlBranchCode.Items.Insert(0, "Choose Branch");
        }
        else
        {
            DataTable dt = bt.GetBranchByBranchCode(branch);
            ddlBranchCode.DataSource = dt;
            ddlBranchCode.DataValueField = "BranchCode";
            ddlBranchCode.DataTextField = "Branch";
            ddlBranchCode.DataBind();
            
        }

        txtTo.Text = "";
        DataTable dt1 = ut.GetAllDepartments();
        ddlDep.DataSource = dt1;
        ddlDep.DataValueField = "DepartmentId";
        ddlDep.DataTextField = "Department";
        ddlDep.DataBind();
        ddlDep.Items.Insert(0, "Choose Department");
        txtThrough.Text = "";
        txtFrom.Text = "";
        txtSubject.Text = "";
        txtDate.Text = "";
        fMemo.Text = "";
        txtComments.Text = "";
        txtForwardTo.Text = "";
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
             string msender = Session["username"].ToString();
             string ForwardedTo = txtForwardTo.Text;
             if (msender != null)
             {
                 string str = HttpUtility.HtmlEncode(fMemo.Text);
                 string branchcode = ddlBranchCode.SelectedValue.ToString();
                 string dept = ddlDep.SelectedValue.ToString();
                 string fname = FileUpload1.PostedFile.FileName.ToString();

                 DataTable dt = dm.MCreateRefNo(branchcode);
                 string referenceno = "";
                 if (dt.Rows.Count > 0)
                 {
                     if (Convert.ToInt32(dt.Rows[0]["RefNo"]) < 10)
                     {
                         referenceno = branchcode + "OM" + DateTime.Today.Year + "000" + dt.Rows[0]["RefNo"];
                     }
                     else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 10 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 100)
                     {
                         referenceno = branchcode + "OM" + DateTime.Today.Year + "00" + dt.Rows[0]["RefNo"];
                     }
                     else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 100 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 1000)
                     {
                         referenceno = branchcode + "OM" + DateTime.Today.Year + "0" + dt.Rows[0]["RefNo"];
                     }
                     else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 1000)
                     {
                         referenceno = branchcode + "OM" + DateTime.Today.Year + dt.Rows[0]["RefNo"];
                     }
                 }
                 else
                 {
                     referenceno = branchcode + "OM" + DateTime.Today.Year + "000" + "1";
                 }

                 //int i = dm.CreateMemo(branchcode, "OM00020181220", txtTo.Text, dept, txtThrough.Text, txtFrom.Text, txtSubject.Text, str, fname, ForwardedTo, "C", msender);
                 //if (i > 0)
                {
                    string branch = ddlBranchCode.SelectedItem.ToString();
                    string Subject = "New Memo Request from:" + branchcode;
                    string Body = "Memo Created:" +
                        Environment.NewLine + "Branch:" + " " + branch +
                        Environment.NewLine + "ReferenceNo:" + " " + "OM00020181220" +
                        Environment.NewLine + "To:" + " " + txtTo.Text +
                         Environment.NewLine + "Department:" + " " + dept +
                         Environment.NewLine + "Through:" + " " + txtThrough.Text +
                         Environment.NewLine + "From:" + " " + txtFrom.Text +
                         Environment.NewLine + "Subject:" + " " + txtSubject.Text +
                         
                         Environment.NewLine +
                         Environment.NewLine  ;


                    string Alert = "New Memo Created" + "\\n" + "ReferenceNo:" + "OM00020181220" + "\\n" + "Forwarded to:" + ForwardedTo;
                    string status = SendMail(msender, txtForwardTo.Text, Subject, Body);
                    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

                }
            }
            else
            {
                string Alert = "You can't forward yourself";
                
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            }
                
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {

    }
}