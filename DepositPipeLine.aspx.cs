using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class DepositPipeLine : System.Web.UI.Page
{
    DBPipeLine dre = new DBPipeLine();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlResolution.Visible = false;
        if (!IsPostBack)
        {
            CreateEvent();
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

    private void CreateEvent()
    {
        string branch = Session["BranchCode"].ToString();
        if (branch == "000")
        {
            DataTable dt = dbt.GetAllBranch();
            ddlBranchCode.DataSource = dt;
            ddlBranchCode.DataValueField = "BranchCode";
            ddlBranchCode.DataTextField = "Branch";
            ddlBranchCode.DataBind();
            ddlBranchCode.Items.Insert(0, "Choose Branch");
        }
        else
        {
            DataTable dt = dbt.GetBranchByBranchCode(branch);
            ddlBranchCode.DataSource = dt;
            ddlBranchCode.DataValueField = "BranchCode";
            ddlBranchCode.DataTextField = "Branch";
            ddlBranchCode.DataBind();
            
        }

        txtName.Text = "";
        ddlType.Items.Insert(0, "Choose Type");
        txtVDate.Text = "";
        txtVisitBy.Text = "";
        txtAmount.Text = "0.00";
        txtExpDate.Text = "";
        txtRate.Text = "";
        txtReceived.Text = "0.00";
        txtBank.Text = "";
        txtProbability.Text = "";
        txtRemarks.Text = "";

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        string msender = Session["username"].ToString();

        if (msender != null)
        {

            string branchcode = ddlBranchCode.SelectedValue.ToString();
            
            string deposittype = ddlType.SelectedValue.ToString();
            
            string branch = ddlBranch.SelectedValue.ToString();

            DataTable dt = dre.PDCreateRefNo(branchcode);
            string referenceno = "";
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToInt32(dt.Rows[0]["RefNo"]) < 10)
                {
                    referenceno = branchcode + "PL" + DateTime.Today.Year + "000" + dt.Rows[0]["RefNo"];
                }
                else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 10 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 100)
                {
                    referenceno = branchcode + "PL" + DateTime.Today.Year + "00" + dt.Rows[0]["RefNo"];
                }
                else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 100 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 1000)
                {
                    referenceno = branchcode + "PL" + DateTime.Today.Year + "0" + dt.Rows[0]["RefNo"];
                }
                else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 1000)
                {
                    referenceno = branchcode + "PL" + DateTime.Today.Year + dt.Rows[0]["RefNo"];
                }
            }
            else
            {
                referenceno = branchcode + "PL" + DateTime.Today.Year + "000" + "1";
            }

                int i = dre.CreatePipeLineD(branchcode, referenceno, txtName.Text, deposittype, Convert.ToDateTime(txtVDate.Text), txtVisitBy.Text, 
                Convert.ToDecimal(txtAmount.Text), Convert.ToDateTime(txtExpDate.Text), txtRate.Text, txtBank.Text, Convert.ToDecimal(txtReceived.Text), 
                txtProbability.Text, txtRemarks.Text, "Created", msender);
            

                if (i > 0)
                {
                //    //string branch = ddlBranchCode.SelectedItem.ToString();
                //    //string Subject = "New Loan Request from:" + branchcode;
                //    //string Body = "New Loan Request Registered:" +
                //    //    Environment.NewLine + "Branch:" + " " + branch +
                //    //    Environment.NewLine + "ReferenceNo:" + " " + referenceno +

                //    //    Environment.NewLine + "For Detail Follow: http://192.168.103.13/DepositPipeLine.aspx";

                //    //string Alert = "Your data Successfully Saved" + "\\n" + "ReferenceNo:" + referenceno;
                //    ////string status = SendMail(msender, txtForwardTo.Text, Subject, Body);
                //    //ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

                //    //CreateEvent();
            }
            txtFRefNo.Text = referenceno;
            BDetail.Visible = false;
            Deposit.Visible = false;
            pnlDetails1.Visible = false;
            pnlRemarks.Visible = false;
            pnlResolution.Visible = false;
            btnSave.Visible = false;
            pnlMsg.Visible = true;

        }

        else
        {
            string Alert = "Please Re-login once" + "\\n" + "Request Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

        }
    }

    protected void btnMsg_Click(object sender, EventArgs e)
    {
        Response.Redirect("DepositPipeLine.aspx", false);
    }
}