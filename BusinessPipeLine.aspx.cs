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

public partial class BusinessPipeLine : System.Web.UI.Page
{
    DBPipeLine dre = new DBPipeLine();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnRemove.Visible = false;
        
        if (!IsPostBack)
        {
            CreateEvent();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        pnlDetails2.Visible = true;
        btnRemove.Visible = true;
        btnAdd.Visible = false;
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        pnlDetails2.Visible = false;
        btnAdd.Visible = true;
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
        //if(!IsPostBack)
        //{ 
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
            // ddlBranchCode.Items.Insert(0, "Choose Branch");
        }

        txtName.Text = "";
        //ddlLoanType.Items.Insert(0, "Choose Type");
        ddlType.Items.Insert(0, "Choose Type");
        txtVDate.Text = "";
        txtVisitBy.Text = "";
        
        ddlLoanType.Items.Insert(0, "Choose One");
        txtNature.Text = "";
        txtAmount.Text = "";
        txtExpDate.Text = "";
        txtRate.Text = "";
        txtCharge.Text = "";
        txtCommission.Text = "0.00";
        txtBank.Text = "";
        txtProbability.Text = "";

        ddlLoanType1.Items.Insert(0, "Choose One");
        txtNature1.Text = "";
        txtAmount1.Text = "0.00";
        txtExpDate1.Text = "";
        txtRate1.Text = "";
        txtCharge1.Text = "";
        txtCommission1.Text = "0.00";
        txtBank1.Text = "";
        txtProbability1.Text = "";

        txtRemarks.Text = "";

        //}
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Page.Validate("a");
        if (Page.IsValid)
        {
            string msender = Session["username"].ToString();

            if (msender != null)
            {

                string branchcode = ddlBranchCode.SelectedValue.ToString();
                string loantype = ddlLoanType.SelectedValue.ToString();
                string businesstype = ddlType.SelectedValue.ToString();
                string loantype1 = ddlLoanType1.SelectedValue.ToString();
                
                DataTable dt = dre.PCreateRefNo(branchcode);
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
                    if (pnlDetails2.Visible == false)
                    {
                        int i = dre.CreatePipeLine1(branchcode, referenceno, txtName.Text, businesstype, Convert.ToDateTime(txtVDate.Text), txtVisitBy.Text, loantype, txtNature.Text,
                            Convert.ToDecimal(txtAmount.Text), Convert.ToDateTime(txtExpDate.Text), txtRate.Text, txtCharge.Text, txtBank.Text, txtCommission.Text,
                            txtProbability.Text, txtRemarks.Text, "Created", msender);
                    }
                    else
                    {
                        int i = dre.CreatePipeLine2(branchcode, referenceno, txtName.Text, businesstype, Convert.ToDateTime(txtVDate.Text), txtVisitBy.Text, loantype, txtNature.Text,
                        Convert.ToDecimal(txtAmount.Text), Convert.ToDateTime(txtExpDate.Text), txtRate.Text, txtCharge.Text, txtBank.Text, txtCommission.Text,
                        txtProbability.Text, txtRemarks.Text, "Created", msender, loantype1, txtNature.Text,
                        Convert.ToDecimal(txtAmount.Text), Convert.ToDateTime(txtExpDate.Text), txtRate.Text, txtCharge.Text, txtBank.Text, txtCommission.Text,
                        txtProbability.Text);
                    }

                    lblRefNo.Text = referenceno;
                    Loan.Visible = false;
                    BDetail.Visible = false;
                    pnlDetails1.Visible = false;
                    pnlDetails2.Visible = false;
                    pnlRemarks.Visible = false;
                    btnAdd.Visible = false;
                    btnRemove.Visible = false;
                    btnSave.Visible = false;
                    pnlMsg.Visible = true;
                    btnCancel.Visible = false;
                }
                
            }
    }

    protected void btnMsg_Click(object sender, EventArgs e)
    {
        Response.Redirect("BusinessPipeLine.aspx", false);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("BusinessPipeLine.aspx", false);
    }
}