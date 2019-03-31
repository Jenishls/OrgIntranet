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

public partial class TraceFile : System.Web.UI.Page
{
    DBTraceFile dre = new DBTraceFile();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        string usertype = Session["Status"].ToString();
        string userid = Session["UserId"].ToString();
        if ( usertype == "CRO" || usertype == "DCEO" || usertype == "CEO" || userid == "binod")
        {
            btnApprove.Visible = true;
            btnReject.Visible = true;
        }

        {

            if (userid == "tripti" || userid == "ashim" || userid == "sameer" || userid == "mukunda" || userid == "mohan" || userid == "uresh" || userid=="binod")
            {
                btnReport.Visible = true;
            }
        }

        if(usertype == "IntraUser")
        {
            //string Alert = "You are not allowed to use this option";
            //ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + " ');</script>");
            Response.Redirect("~/Default.aspx");
        }

        if (!IsPostBack)
        {
           
            if (Session["username"] != null)
            {
                //btnApprove.Visible = false;
                //btnReject.Visible = false;
                LoadEvents();
                LoadCreateEvent();

            }
            else
            {
                //LoadCreateEvent();
                //LoadEvents();
                Response.Redirect("~/Login.aspx");
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
            //SmtpClient smtpClient = new SmtpClient("smpt.gmail.com", 587);
            //smtpClient.Credentials = new System.Net.NetworkCredential()
            //{
            //    UserName = "abc@gmail.com",
            //    Password = "abc123"

            //};
            smtpClient.Send(mailMessage);
            return ("E-mail sent!");
        }
        catch (Exception ex)
        {
            return ("Could not send the e-mail - error: " + ex.Message);
        }
    }

    private void LoadEvents()
    {
        string LoginBranch = Session["BranchCode"].ToString();
        AFView.ActiveViewIndex = 0;
        PendingView.ActiveViewIndex = 0;
        MultiView1.ActiveViewIndex = 0;
        string status= Session["Status"].ToString();
        string username = Session["UserId"].ToString();
        if (LoginBranch == "000" || status == "IsBM")
        {
            TabPanelAF.Visible = true;
            if (LoginBranch=="000")
            {
                DataTable PTraceFile = dre.GetAllPendingTraceFile(username);
                gvAF.DataSource = PTraceFile;
                gvAF.DataBind();
                gvPending.DataSource = PTraceFile;
                gvPending.DataBind();
                DataTable dTraceFile = dre.GetAllApprovedTraceFile();
                gvApprovedTraceFile.DataSource = dTraceFile;
                gvApprovedTraceFile.DataBind();
            }
            else
            {
                DataTable PTraceFile = dre.GetAllPendingTraceFileBranchWise(LoginBranch);
                gvAF.DataSource = PTraceFile;
                gvAF.DataBind();
                gvPending.DataSource = PTraceFile;
                gvPending.DataBind();
                DataTable dTraceFile = dre.GetAllApprovedTraceFileBranchWise(LoginBranch);
                gvApprovedTraceFile.DataSource = dTraceFile;
                gvApprovedTraceFile.DataBind();
            }
        }
        else
        {
            TabPanelAF.Visible = false;
            DataTable PTraceFile = dre.GetAllPendingTraceFileBranchWise(LoginBranch);
            gvAF.DataSource = PTraceFile;
            gvAF.DataBind();
            gvPending.DataSource = PTraceFile;
            gvPending.DataBind();
            DataTable dTraceFile = dre.GetAllApprovedTraceFileBranchWise(LoginBranch);
            gvApprovedTraceFile.DataSource = dTraceFile;
            gvApprovedTraceFile.DataBind();
        }



    }


    private void LoadCreateEvent()
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
            // ddlBranchCode.Items.Insert(0, "Choose Branch");
        }

        txtLoanName.Text = "";
        ddlLoanType.Items.Insert(0, "Choose Type");
        ddlLimitType.Items.Insert(0, "Choose Type");
        txtLimit.Text = "0";
        txtLimit1.Text = "0";
        ddlRenew.Items.Insert(0, "Choose One");
        txtRemarks.Text = "";

        DataTable dbm = dusert.GetBranchBM(branch);
        if (dbm.Rows.Count > 0)
        {
            txtForwardTo.Text = dbm.Rows[0]["Email"].ToString();
        }
        else
        {
            txtForwardTo.Text = "";
        }
        btnSubmit.Text = "Create";
        btnCancel.Text = "Reset";
        LoadEvents();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Create")
        {
            string msender = Session["username"].ToString();
            string ForwardedTo = txtForwardTo.Text;
            int limit = Convert.ToInt32(txtLimit.Text);
            int limit1 = Convert.ToInt32(txtLimit1.Text);
            if (limit > 0 || limit1 > 0 && msender != ForwardedTo )
            {
               
                string branchcode = ddlBranchCode.SelectedValue.ToString();
                string loantype = ddlLoanType.SelectedValue.ToString();
                string limittype = ddlLimitType.SelectedValue.ToString();
                string nature = ddlRenew.SelectedValue.ToString();
                DataTable dt = dre.CreateRefNo(branchcode);
                string referenceno = "";
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToInt32(dt.Rows[0]["RefNo"]) < 10)
                    {
                        referenceno = branchcode + "FT" + DateTime.Today.Year + "000" + dt.Rows[0]["RefNo"];
                    }
                    else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 10 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 100)
                    {
                        referenceno = branchcode + "FT" + DateTime.Today.Year + "00" + dt.Rows[0]["RefNo"];
                    }
                    else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 100 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 1000)
                    {
                        referenceno = branchcode + "FT" + DateTime.Today.Year + "0" + dt.Rows[0]["RefNo"];
                    }
                    else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 1000)
                    {
                        referenceno = branchcode + "FT" + DateTime.Today.Year + dt.Rows[0]["RefNo"];
                    }
                }
                else
                {
                    referenceno = branchcode + "FT" + DateTime.Today.Year + "000" + "1";
                }
                //string msender = Session["username"].ToString();
                //string ForwardedTo = txtForwardTo.Text;
                int i = dre.CreateTraceFile(branchcode, referenceno, txtLoanName.Text,loantype, Convert.ToDecimal(txtLimit.Text), txtRemarks.Text, "C", msender, txtForwardTo.Text,limittype,Convert.ToDecimal(txtLimit1.Text),nature);
                if (i > 0)
                {
                    string branch = ddlBranchCode.SelectedItem.ToString();
                    string Subject = "New Loan Request from:" + branchcode;
                    string Body = "New Loan Request Registered:" +
                        Environment.NewLine + "Branch:" + " " + branch +
                        Environment.NewLine + "ReferenceNo:" + " " + referenceno +
                        Environment.NewLine + "Loan Name:" + " " + txtLoanName.Text +
                         Environment.NewLine + "Loan Type:" + " " + loantype +
                         Environment.NewLine + "Limit Type:" + " " + limittype +
                         Environment.NewLine + "Funded Limit:" + " " + txtLimit.Text +
                         Environment.NewLine + "Non-Funded Limit:" + " " + txtLimit1.Text +
                         Environment.NewLine + "New/Renew:" + " " + nature +
                         Environment.NewLine +
                         Environment.NewLine +
                        Environment.NewLine + "For Detail Follow: http://nccintanet.nccbank.com.np/TraceFile.aspx";

                    string Alert = "New Loan Request Registered" + "\\n" + "ReferenceNo:" + referenceno + "\\n" + "Forwarded to:" + ForwardedTo;
                    string status = SendMail(msender, txtForwardTo.Text, Subject, Body);
                    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

                    LoadCreateEvent();
                    //lblMessage.Text = "The Risk Event with ReferenceNo:" + txtReferenceNo.Text + " " + "has been Created and Forwarded.";
                }
            }
            else
            {
                //string Alert = "You can't forward yourself";
                string Alert = "Funded Limit or Non-Funded Limit must be Greater than Zero" + "\\n" + "Request Rejected"; 
                    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            }
        }
        if (btnSubmit.Text == "Update")
        {
            //string branchcode = ddlBranchCode.SelectedValue.ToString();
            //string RiskId = hfRiskIdE.Value;
            //int i = dre.UpdateRiskEvent(Convert.ToInt32(RiskId), branchcode, txtReferenceNo.Text, ort, noi, Convert.ToDateTime(txtDateOfIncident.Text), Convert.ToDateTime(txtDateOfFinding.Text), lor, txtBusinessInvolved.Text, Convert.ToDecimal(txtAmount.Text), Convert.ToDecimal(txtPotentialOperationalLoss.Text), Convert.ToDecimal(txtGrossOperationalLoss.Text), txtNearMisses.Text, txtRevenueImplication.Text, txtEventDetail.Text, txtActionTakenTillDate.Text, txtFurtherPlan.Text, txtForwardTo.Text);

            //if (i > 0)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('Change Sucessfully Updated for ReferenceNo:" + referenceno + "');</script>");

            //    LoadCreateEvent();
            //    //lblMessage.Text = "The Risk Event with ReferenceNo:" + txtReferenceNo.Text + " " + "has been Updated and Forwarded.";
            //}
        }
    }



    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (btnCancel.Text == "Reset")
        {
            LoadCreateEvent();
        }
        if (btnCancel.Text == "Cancel")
        {
            //MultiView1.ActiveViewIndex = 0;
            //LoadEvents();
        }
    }
    //----------autocomplete-----------

    protected void gvApprovedTraceFile_SelectedIndexChanged(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 2;
        string ReferenceNo = gvApprovedTraceFile.SelectedDataKey.Value.ToString();

        DataTable dt = dre.GetTraceFileByRefNo(ReferenceNo);
        lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();
        lblReferenceNo.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblLoanName.Text = dt.Rows[0]["LoanName"].ToString();
        lblLoanType.Text = dt.Rows[0]["LoanType"].ToString();
        lblLimitType.Text = dt.Rows[0]["LimitType"].ToString();
        lblLimit.Text = dt.Rows[0]["Limit"].ToString();
        lblLimit1.Text = dt.Rows[0]["NLimit"].ToString();
        lblRenew.Text = dt.Rows[0]["Nature"].ToString();
        lblRemarks.Text = dt.Rows[0]["Remarks"].ToString();
        lblCreatedOn.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
        lblCreatedBy.Text = dt.Rows[0]["CreatedBy"].ToString();

        lblForwardTo.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        lblStatus.Text = dt.Rows[0]["Status"].ToString();
        if (lblStatus.Text == "C")
        {
            lblStatus.Text = "Initialized/Created";
        }
        lblApprovedBy.Text = dt.Rows[0]["Approved/RejectedBy"].ToString();
        lblApprovedOn.Text = dt.Rows[0]["Approved/RejectedOn"].ToString();
        gvFileTraceHistory.DataSource = dre.GetFileTraceHistory(ReferenceNo);
        gvFileTraceHistory.DataBind();

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        //gvPendingTraceFile.DataSource = null;
        //gvPendingTraceFile.DataBind();
        MultiView1.ActiveViewIndex = 0;
        AFView.ActiveViewIndex = 0;
        LoadEvents();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {

        EditRiskEvent(gvApprovedTraceFile.SelectedDataKey.Value.ToString());

    }

    protected void gvApprovedTraceFile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditItem"))
        {
            GridViewRow clickedRow = ((LinkButton)e.CommandSource).NamingContainer as GridViewRow;

            string RefNo = clickedRow.Cells[2].Text;
            EditRiskEvent(RefNo);
        }
    }

    private void EditRiskEvent(string ReferenceNo)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSubmit.Text = "Update";
        btnCancel.Text = "Cancel";
        DataTable dt = dre.GetTraceFileByRefNoN(ReferenceNo);

        DataTable dbt = dre.GetAllBranch();
        ddlBranchCode.DataSource = dbt;
        ddlBranchCode.DataValueField = "BranchCode";
        ddlBranchCode.DataTextField = "Branch";

        ddlBranchCode.DataBind();
        DataTable dbti = dre.GetBranchByBranchCode(dt.Rows[0]["BranchCode"].ToString());
        ddlBranchCode.SelectedValue = dbti.Rows[0]["BranchCode"].ToString();
        txtLoanName.Text = dt.Rows[0]["LoanName"].ToString();
        ddlLoanType.SelectedValue = dt.Rows[0]["LoanType"].ToString();
        txtLimit.Text = dt.Rows[0]["Limit"].ToString();
        txtRemarks.Text = dt.Rows[0]["Remarks"].ToString();


        txtForwardTo.Text = dt.Rows[0]["LastForwardedTo"].ToString();

        lblCreatedBy.Text = dt.Rows[0]["CreatedBy"].ToString();
        lblCreatedOn.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy");

        lblStatus.Text = dt.Rows[0]["Status"].ToString();
    }

    //Approve/Forward
    protected void gvAF_SelectedIndexChanged(object sender, EventArgs e)
    {

        AFView.ActiveViewIndex = 2;
        string usertype = Session["Status"].ToString();
        string ReferenceNo = gvAF.SelectedDataKey.Value.ToString();
        DataTable dt = dre.GetTraceFileByRefNo(ReferenceNo);
        lblBranchCodeAF.Text = dt.Rows[0]["BranchCode"].ToString();
        lblReferenceNoAF.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblLoanNameAF.Text = dt.Rows[0]["LoanName"].ToString();
        lblLoanTypeAF.Text = dt.Rows[0]["LoanType"].ToString();
        lblLimitTypeAF.Text = dt.Rows[0]["LimitType"].ToString();
        lblLimitAF.Text = dt.Rows[0]["Limit"].ToString();
        lblLimit1AF.Text = dt.Rows[0]["NLimit"].ToString();
        lblRenewAF.Text = dt.Rows[0]["Nature"].ToString();
        lblRemarksAF.Text = dt.Rows[0]["Remarks"].ToString();
        lblCreatedOnAF.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
        lblCreatedByAF.Text = dt.Rows[0]["CreatedBy"].ToString();

        DataTable ddpt = dusert.GetAllDepartments();
        ddlDepartment.DataSource = ddpt;
        ddlDepartment.DataValueField = "Department";
        ddlDepartment.DataTextField = "Department";
        ddlDepartment.DataBind();
        if (usertype != "CRO")
        {
            ddlDepartment.Items.Insert(0, "Choose Department");
        }
        else
        {
            ddlDepartment.Items.Insert(0, "DCEO");
        }
        lblForwardToAF.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        lblStatusAF.Text = dt.Rows[0]["Status"].ToString();
        if (lblStatusAF.Text == "C")
        {
            lblStatusAF.Text = "Initialized/Created";
        }

        else if (lblStatusAF.Text == "A")
        {
            lblStatusAF.Text = "Approved";
        }
        gvFileTraceHistoryAF.DataSource = dre.GetFileTraceHistory(ReferenceNo);
        gvFileTraceHistoryAF.DataBind();
        
        
        string dept=ddlDepartment.SelectedValue.ToString();
        if (dept != "Choose Department")
        {
        DataTable dur = dusert.GetUserByDepartment(dept);
        ddlForwardToAF.DataSource = dur;
        ddlForwardToAF.DataValueField = "Email";
        ddlForwardToAF.DataTextField = "Email";
        ddlForwardToAF.DataBind();
        if (usertype != "CRO")
        {
            ddlForwardToAF.Items.Insert(0, "Choose Email");
        }
        else
        {
            ddlForwardToAF.Items.Insert(0, "rewanta.dahal@nccbank.com.np");
        }

        }

    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dept = ddlDepartment.SelectedValue.ToString();
        if (dept != "Choose Department")
        {
            DataTable dur = dusert.GetUserByDepartment(dept);
            ddlForwardToAF.DataSource = dur;
            ddlForwardToAF.DataValueField = "Email";
            ddlForwardToAF.DataTextField = "Email";
            ddlForwardToAF.DataBind();
            ddlForwardToAF.Items.Insert(0, "Choose Email");
        }

    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        string msender = Session["username"].ToString();
        int i = dre.ApproveTraceFile(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, txtRemarksAF.Text, "A");
        if (i > 0)
        {
            string Subject = "Loan Approved" + " " + lblBranchCodeAF.Text;
            string Body = "New Loan Request: Approved" +
                Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
                 Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
                 Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +
                 Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                 Environment.NewLine +
                Environment.NewLine + "For Detail Follow: http://nccintranet.nccbank.com.np/TraceFile.aspx";

            string Alert = "Loan Request Approved" + "\\n" + "ReferenceNo:" + lblReferenceNoAF.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            LoadEvents();

        }
        
        txtRemarksAF.Text = "";
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        string msender = Session["username"].ToString();
        int i = dre.ApproveTraceFile(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, txtRemarksAF.Text, "R");
        if (i > 0)
        {
            string Subject = "Loan Request Rejected" + " " + lblBranchCodeAF.Text;
            string Body = "New Loan Request: Rejected" +
                Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
                 Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
                 Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +
                 Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                 Environment.NewLine +
                Environment.NewLine + "For Detail Follow: http://nccintranet.nccbank.com.np/TraceFile.aspx";

            string Alert = "Loan Request Rejected" + "\\n" + "ReferenceNo:" + lblReferenceNoAF.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            LoadEvents();

        }
       
        txtRemarksAF.Text = "";
    }
    protected void btnForward_Click(object sender, EventArgs e)
    {
        string depart = ddlDepartment.SelectedValue.ToString();
        string forwardAF = ddlForwardToAF.SelectedValue.ToString();
        if (depart != "Choose Department" && forwardAF != "Choose Email")
        {

            string msender = Session["username"].ToString();
            int i = dre.ForwardTraceFile(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, ddlForwardToAF.SelectedValue.ToString(), txtRemarksAF.Text);

            if (i > 0)
            {
                string Subject = "Loan Forwarded" + " " + lblBranchCodeAF.Text;
                string Body = "New Loan Request: Forwarded" +
                    Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                    Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
                     Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
                     Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +
                     Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                     Environment.NewLine +
                    Environment.NewLine + "For Detail Follow: http://nccintranet.nccbank.com.np/TraceFile.aspx";

                string Alert = "Loan Request Forwarded" + "\\n" + "ReferenceNo:" + lblReferenceNoAF.Text + "\\n" + "Forwarded to:" + ddlForwardToAF.SelectedValue.ToString();
                string status = SendMail(msender, ddlForwardToAF.SelectedValue.ToString(), Subject, Body);
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

                LoadEvents();

            }

            txtRemarksAF.Text = "";
        }
        else
        {
            string Alert = "Loan Request Forwarded Failed" + "\\n" + "Please Check Department or Email Before Proceed";

            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            LoadEvents();
        }
    }

    protected void gvPending_SelectedIndexChanged(object sender, EventArgs e)
    {

        PendingView.ActiveViewIndex = 2;
        string ReferenceNo = gvPending.SelectedDataKey.Value.ToString();
        DataTable dt = dre.GetTraceFileByRefNo(ReferenceNo);
        lblBranchCodePending.Text = dt.Rows[0]["BranchCode"].ToString();
        lblReferenceNoPending.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblLoanNamePending.Text = dt.Rows[0]["LoanName"].ToString();
        lblLoanTypePending.Text = dt.Rows[0]["LoanType"].ToString();
        lblLimitTypePending.Text = dt.Rows[0]["LimitType"].ToString();
        lblLimitPending.Text = dt.Rows[0]["Limit"].ToString();
        lblLimit1Pending.Text = dt.Rows[0]["NLimit"].ToString();
        lblRenewPending.Text = dt.Rows[0]["Nature"].ToString();
        lblRemarksPending.Text = dt.Rows[0]["Remarks"].ToString();
        lblCreatedOnPending.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
        lblCreatedByPending.Text = dt.Rows[0]["CreatedBy"].ToString();

        lblForwardToPending.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        lblStatusPending.Text = dt.Rows[0]["Status"].ToString();
        //if (lblStatusPending.Text == "C")
        //{
        //    lblStatusPending.Text = "Initialized/Created";
        //}

        //else if (lblStatusPending.Text == "A")
        //{
        //    lblStatusPending.Text = "Approved";
        //}
        gvFileTraceHistoryPending.DataSource = dre.GetFileTraceHistory(ReferenceNo);
        gvFileTraceHistoryPending.DataBind();

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TabContainer1.Visible = false;
       
        string ReferenceNo = txtSearchByReferenceNo.Text;
        DataTable dt = dre.GetTraceFileByRefNo(ReferenceNo);
        if (dt.Rows.Count > 0)
        {
            SearchView.ActiveViewIndex = 1;
            lblBranchCodeSearch.Text = dt.Rows[0]["BranchCode"].ToString();
            lblReferenceNoSearch.Text = dt.Rows[0]["ReferenceNo"].ToString();
            lblLoanNameSearch.Text = dt.Rows[0]["LoanName"].ToString();
            lblLoanTypeSearch.Text = dt.Rows[0]["LoanType"].ToString();
            lblLimitSearch.Text = dt.Rows[0]["Limit"].ToString();
            lblRemarksSearch.Text = dt.Rows[0]["Remarks"].ToString();
            lblCreatedOnSearch.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
            lblCreatedBySearch.Text = dt.Rows[0]["CreatedBy"].ToString();

            lblForwardToSearch.Text = dt.Rows[0]["LastForwardedTo"].ToString();
            lblStatusSearch.Text = dt.Rows[0]["Status"].ToString();
            gvFileTraceHistorySearch.DataSource = dre.GetFileTraceHistory(ReferenceNo);
            gvFileTraceHistorySearch.DataBind();
        }
        else
        {
            SearchView.ActiveViewIndex = 0;
            string Alert = "Sorry Wrong ReferenceNo";
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

        }
    }
    protected void btnbacksearch_Click(object sender, EventArgs e)
    {
        TabContainer1.Visible = true;
        SearchView.ActiveViewIndex = 0;

    }

    protected void btnAdvSearch_Click(object sender, EventArgs e)
    {
        // Response.Redirect("~/Search.aspx");
    }

    protected void ddlLimitType_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlLimitType.Text == "Non-Funded" || ddlLimitType.Text == "Both")
          {
              txtLimit1.Visible = true;
          }
        else
        {
            txtLimit1.Visible = false;
        }

        if (ddlLimitType.Text == "Funded" || ddlLimitType.Text == "Both")
        {
            txtLimit.Visible = true;
           
        }
        else
        {
            txtLimit.Visible = false;
        }
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {

    }
}