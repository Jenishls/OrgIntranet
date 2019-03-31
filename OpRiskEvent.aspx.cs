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

public partial class OpRiskEvent : System.Web.UI.Page
{
    DBEventRisk dre = new DBEventRisk();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        string usertype = Session["Status"].ToString();
        string userid = Session["username"].ToString();
        if (usertype == "CRO" || usertype == "DCEO" || usertype == "CEO")
        {
            btnApprove.Text = "Noted";
            btnApprove.Visible = true;
            btnPrint.Visible = true;
        }

        {

            if (userid == "tripti" || userid == "ashim" || userid == "sameer" || userid == "mukunda" || userid != "mohan" || userid == "uresh")
            {
                //btnReport.Visible = true;
            }
        }

        if (usertype == "IntraUser")
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
        string status = Session["Status"].ToString();
        string username = Session["UserId"].ToString();
        if (LoginBranch == "000" || status == "IsBM")
        {
            TabPanelAF.Visible = true;
            if (LoginBranch == "000")
            {
                DataTable PTraceFile = dre.GetAllRiskEvents();
                gvAF.DataSource = PTraceFile;
                gvAF.DataBind();
                gvPending.DataSource = PTraceFile;
                gvPending.DataBind();
                DataTable dTraceFile = dre.GetAllApprovedRiskEvent();
                gvNotedEvent.DataSource = dTraceFile;
                gvNotedEvent.DataBind();
            }
            else
            {
                int Lbranch = Int32.Parse(LoginBranch);
                if (Lbranch > 990)
                {
                    DataTable PTraceFile = dre.GetAllPendingRiskEventProvinceWise(LoginBranch);
                    gvAF.DataSource = PTraceFile;
                    gvAF.DataBind();
                    gvPending.DataSource = PTraceFile;
                    gvPending.DataBind();
                    DataTable dTraceFile = dre.GetAllApprovedRiskEventProvinceWise(LoginBranch);
                    gvNotedEvent.DataSource = dTraceFile;
                    gvNotedEvent.DataBind();
                }
                else
                {
                    DataTable PTraceFile = dre.GetAllPendingRiskEventBranchWise(LoginBranch);
                    gvAF.DataSource = PTraceFile;
                    gvAF.DataBind();
                    gvPending.DataSource = PTraceFile;
                    gvPending.DataBind();
                    DataTable dTraceFile = dre.GetAllApprovedRiskEventBranchWise(LoginBranch);
                    gvNotedEvent.DataSource = dTraceFile;
                    gvNotedEvent.DataBind();
                }
                
            }
        }
        else
        {
            TabPanelAF.Visible = false;
            DataTable PTraceFile = dre.GetAllPendingRiskEventBranchWise(LoginBranch);
            gvAF.DataSource = PTraceFile;
            gvAF.DataBind();
            gvPending.DataSource = PTraceFile;
            gvPending.DataBind();
            DataTable dTraceFile = dre.GetAllApprovedRiskEventBranchWise(LoginBranch);
            gvNotedEvent.DataSource = dTraceFile;
            gvNotedEvent.DataBind();
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

        DataTable drt = dre.GetAllRiskType();
        ddlOperationRiskType.DataSource = drt;
        ddlOperationRiskType.DataValueField = "RiskId";
        ddlOperationRiskType.DataTextField = "RiskType";
        ddlOperationRiskType.DataBind();
        ddlOperationRiskType.Items.Insert(0, "Choose Operational Risk Type");

        DataTable dni = dre.GetAllNatureOfIncident();
        ddlNatureOfIncident.DataSource = dni;
        ddlNatureOfIncident.DataValueField = "IncidentId";
        ddlNatureOfIncident.DataTextField = "IncidentNature";
        ddlNatureOfIncident.DataBind();
        ddlNatureOfIncident.Items.Insert(0, "Choose Nature Of Incident");

        DataTable drl = dre.GetAllRiskLevel();
        ddlOperationRiskLevel.DataSource = drl;
        ddlOperationRiskLevel.DataValueField = "LevelId";
        ddlOperationRiskLevel.DataTextField = "RiskLevelType";
        ddlOperationRiskLevel.DataBind();
        ddlOperationRiskLevel.Items.Insert(0, "Choose Risk Level");

        txtDateOfIncident.Text = "";
        txtDateOfFinding.Text = "";
        txtBusinessInvolved.Text = "";
        txtAmount.Text = "0";
        txtPotentialOperationalLoss.Text = "0";
        txtNearMisses.Text = "";
        txtGrossOperationalLoss.Text = "0";
        txtEventDetail.Text = "";
        txtRevenueImplication.Text = "";
        txtActionTakenTillDate.Text = "";
        txtFurtherPlan.Text = "";
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
            //int amount = Convert.ToInt32(txtAmount.Text);
            //int pol = Convert.ToInt32(txtPotentialOperationalLoss.Text);
            //int golytd = Convert.ToInt32(txtGrossOperationalLoss.Text);
            if ( msender != ForwardedTo)
            {

                string branchcode = ddlBranchCode.SelectedValue.ToString();
                string risktype = ddlOperationRiskType.SelectedValue.ToString();
                string nature = ddlNatureOfIncident.SelectedValue.ToString();
                string level = ddlOperationRiskLevel.SelectedValue.ToString();
                DataTable dt = dre.CreateRefNo(branchcode);
                string referenceno = "";
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToInt32(dt.Rows[0]["RefNo"]) < 10)
                    {
                        referenceno = branchcode + "RE" + DateTime.Today.Year + "000" + dt.Rows[0]["RefNo"];
                    }
                    else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 10 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 100)
                    {
                        referenceno = branchcode + "RE" + DateTime.Today.Year + "00" + dt.Rows[0]["RefNo"];
                    }
                    else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 100 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 1000)
                    {
                        referenceno = branchcode + "RE" + DateTime.Today.Year + "0" + dt.Rows[0]["RefNo"];
                    }
                    else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 1000)
                    {
                        referenceno = branchcode + "RE" + DateTime.Today.Year + dt.Rows[0]["RefNo"];
                    }
                }
                else
                {
                    referenceno = branchcode + "RE" + DateTime.Today.Year + "000" + "1";
                }
                //string msender = Session["username"].ToString();
                //string ForwardedTo = txtForwardTo.Text;
                int i = dre.CreateRiskEvent(branchcode, referenceno, risktype, nature, Convert.ToDateTime(txtDateOfIncident.Text), Convert.ToDateTime(txtDateOfFinding.Text), 
                    level, txtBusinessInvolved.Text, Convert.ToDecimal(txtAmount.Text), Convert.ToDecimal(txtPotentialOperationalLoss.Text), Convert.ToDecimal(txtGrossOperationalLoss.Text), 
                    txtNearMisses.Text, txtRevenueImplication.Text, txtEventDetail.Text, txtActionTakenTillDate.Text, txtFurtherPlan.Text, txtForwardTo.Text, "C", msender,txtRemarks.Text);
                if (i > 0)
                {
                    string branch = ddlBranchCode.SelectedItem.ToString();
                    string nature1 = ddlNatureOfIncident.SelectedItem.Text;
                    string level1 = ddlOperationRiskLevel.SelectedItem.Text;
                    string Subject = "New Operation Risk Event from:" + branchcode;
                    string Body = "New Risk Event Created:" +
                        Environment.NewLine + "Branch:" + " " + branch +
                        Environment.NewLine + "ReferenceNo:" + " " + referenceno +
                        Environment.NewLine + "Nature Of Incident:" + " " + nature1 +
                        Environment.NewLine + "Risk Type:" + " " + level1 +
                         //Environment.NewLine + "Risk Level:" + " " + ddlOperationRiskLevel +
                         //Environment.NewLine + "Amount Of IR:" + " " + txtAmount.Text +
                         //Environment.NewLine + "Potential Operational Loss:" + " " + txtPotentialOperationalLoss.Text +
                         //Environment.NewLine + "Gross OperationalLossYTD:" + " " + txtGrossOperationalLoss.Text +
                         Environment.NewLine +
                         Environment.NewLine +
                        Environment.NewLine + "For Detail Follow: http://192.168.103.13/OpRiskEvent.aspx";

                    string Alert = "New Risk Event Created" + "\\n" + "ReferenceNo:" + referenceno + "\\n" + "Forwarded to:" + ForwardedTo;
                    string status = SendMail(msender, txtForwardTo.Text, Subject, Body);
                    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

                    LoadCreateEvent();
                    //lblMessage.Text = "The Risk Event with ReferenceNo:" + txtReferenceNo.Text + " " + "has been Created and Forwarded.";
                }
            }
            else
            {
                //string Alert = "You can't forward yourself";
                string Alert = "Fill All the required field" + "\\n" + "Request Rejected";
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

    protected void gvNotedEvent_SelectedIndexChanged(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 2;
        string ReferenceNo = gvNotedEvent.SelectedDataKey.Value.ToString();

        DataTable dt = dre.GetEventByRefNo(ReferenceNo);
        lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();
        lblReferenceNo.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblORT.Text = dt.Rows[0]["ORT"].ToString();
        lblNOI.Text = dt.Rows[0]["NOI"].ToString();
        lblDOI.Text = Convert.ToDateTime(dt.Rows[0]["DOI"]).ToShortDateString();
        lblDOF.Text = Convert.ToDateTime(dt.Rows[0]["DIIF"]).ToShortDateString();
        lblORL.Text = dt.Rows[0]["LOR"].ToString();
        lblBFI.Text = dt.Rows[0]["BFI"].ToString();
        lblAIR.Text = Convert.ToDecimal(dt.Rows[0]["AIR"]).ToString("0.00");
        lblPOL.Text = Convert.ToDecimal(dt.Rows[0]["POL"]).ToString("0.00");
        lblGOLYTD.Text = Convert.ToDecimal(dt.Rows[0]["GOLYTD"]).ToString("0.00");
        lblRI.Text = dt.Rows[0]["RI"].ToString();
        lblED.Text = dt.Rows[0]["ED"].ToString();
        lblATTD.Text = dt.Rows[0]["ATTD"].ToString();
        lblFP.Text = dt.Rows[0]["FPRC"].ToString();
        //lblRemarks.Text = dt.Rows[0]["Remarks"].ToString();
        lblCreatedOn.Text = dt.Rows[0]["CreatedOn"].ToString();
        lblCreatedBy.Text = dt.Rows[0]["CreatedBy"].ToString();

        lblForwardTo.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        lblStatus.Text = dt.Rows[0]["Status"].ToString();
        //if (lblStatus.Text == "C")
        //{
        //    lblStatus.Text = "Initialized/Created";
        //}
        lblApprovedBy.Text = dt.Rows[0]["NotedBy"].ToString();
        lblApprovedOn.Text = dt.Rows[0]["NotedOn"].ToString();
        gvEventHistory.DataSource = dre.GetEventHistory(ReferenceNo);
        gvEventHistory.DataBind();

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

        EditRiskEvent(gvNotedEvent.SelectedDataKey.Value.ToString());

    }

    protected void gvNotedEvent_RowCommand(object sender, GridViewCommandEventArgs e)
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
        DataTable dt = dre.GetEventByRefNoN(ReferenceNo);

        DataTable dbt = dre.GetAllBranch();
        ddlBranchCode.DataSource = dbt;
        ddlBranchCode.DataValueField = "BranchCode";
        ddlBranchCode.DataTextField = "Branch";

        ddlBranchCode.DataBind();
        DataTable dbti = dre.GetBranchByBranchCode(dt.Rows[0]["BranchCode"].ToString());
        ddlBranchCode.SelectedValue = dbti.Rows[0]["BranchCode"].ToString();
        ddlOperationRiskType.SelectedValue = dt.Rows[0]["ORT"].ToString();
        ////txtLoanName.Text = dt.Rows[0]["LoanName"].ToString();
        ////ddlLoanType.SelectedValue = dt.Rows[0]["LoanType"].ToString();
        ////txtLimit.Text = dt.Rows[0]["Limit"].ToString();
        ////txtRemarks.Text = dt.Rows[0]["Remarks"].ToString();


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
        DataTable dt = dre.GetEventByRefNo(ReferenceNo);
        lblBranchCodeAF.Text = dt.Rows[0]["BranchCode"].ToString();
        lblReferenceNoAF.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblORTAF.Text = dt.Rows[0]["ORT"].ToString();
        lblNOIAF.Text = dt.Rows[0]["NOI"].ToString();
        lblDOIAF.Text = Convert.ToDateTime(dt.Rows[0]["DOI"]).ToShortDateString();
        lblDOFAF.Text = Convert.ToDateTime(dt.Rows[0]["DIIF"]).ToShortDateString();
        lblORLAF.Text = dt.Rows[0]["LOR"].ToString();
        lblBFIAF.Text = dt.Rows[0]["BFI"].ToString();
        lblAIRAF.Text = Convert.ToDecimal(dt.Rows[0]["AIR"]).ToString("0.00");
        lblPOLAF.Text = Convert.ToDecimal(dt.Rows[0]["POL"]).ToString("0.00");
        lblGOLYTDAF.Text = Convert.ToDecimal(dt.Rows[0]["GOLYTD"]).ToString("0.00");
        lblEDAF.Text = dt.Rows[0]["ED"].ToString();
        lblRIAF.Text = dt.Rows[0]["RI"].ToString();
        lblATTDAF.Text = dt.Rows[0]["ATTD"].ToString();
        lblFPAF.Text = dt.Rows[0]["FPRC"].ToString();
        lblCreatedOnAF.Text = dt.Rows[0]["CreatedOn"].ToString();
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
            ddlDepartment.Items.Insert(0, "CEO");
        }
        lblForwardToAF.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        lblStatusAF.Text = dt.Rows[0]["Status"].ToString();
        if (lblStatusAF.Text == "C")
        {
            lblStatusAF.Text = "Initialized/Created";
        }
        if (lblStatusAF.Text == "F")
        {
            lblStatusAF.Text = "Forwarded";
        }

        else if (lblStatusAF.Text == "N")
        {
            lblStatusAF.Text = "Noted";
        }
        gvFileTraceHistoryAF.DataSource = dre.GetEventHistory(ReferenceNo);
        gvFileTraceHistoryAF.DataBind();


        string dept = ddlDepartment.SelectedValue.ToString();
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
        int i = dre.ApproveRiskEvent(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, txtRemarksAF.Text, "N");
        if (i > 0)
        {
            string Subject = "Loan Noted" + " " + lblBranchCodeAF.Text;
            string Body = "New Risk Event Request: Noted" +
                Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                //Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
                // Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
                // Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +
                 //Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                 Environment.NewLine +
                Environment.NewLine + "For Detail Follow: http://192.168.103.13/OpRiskEvent.aspx";

            string Alert = "Risk Event Noted" + "\\n" + "ReferenceNo:" + lblReferenceNoAF.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            LoadEvents();

        }

        txtRemarksAF.Text = "";
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        string msender = Session["username"].ToString();
        int i = dre.ApproveRiskEvent(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, txtRemarksAF.Text, "R");
        if (i > 0)
        {
            string Subject = "Risk Event Rejected" + " " + lblBranchCodeAF.Text;
            string Body = "Risk Event Request: Rejected" +
                Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                //Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
                // Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
                // Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +
                 //Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                 Environment.NewLine +
                Environment.NewLine + "For Detail Follow: http://192.168.103.13/TraceFile.aspx";

            string Alert = "Risk Event Request Rejected" + "\\n" + "ReferenceNo:" + lblReferenceNoAF.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
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
            int i = dre.ForwardRiskEvent(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, ddlForwardToAF.SelectedValue.ToString(), txtRemarksAF.Text);

            if (i > 0)
            {
                string Subject = "Risk Event Forwarded" + " " + lblBranchCodeAF.Text;
                string Body = "Risk Event Request: Forwarded" +
                    Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                    Environment.NewLine + "Forwarded By:" + " " + msender +
                    
                    Environment.NewLine +
                    Environment.NewLine + "For Detail Follow: http://192.168.103.13/OpRiskEvent.aspx";

                string Alert = "Risk Event Request Forwarded" + "\\n" + "ReferenceNo:" + lblReferenceNoAF.Text + "\\n" + "Forwarded to:" + ddlForwardToAF.SelectedValue.ToString();
                string status = SendMail(msender, ddlForwardToAF.SelectedValue.ToString(), Subject, Body);
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

                LoadEvents();

            }

            txtRemarksAF.Text = "";
        }
        else
        {
            string Alert = "Risk Event Request Forwarded Failed" + "\\n" + "Please Check Department or Email Before Proceed";

            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            LoadEvents();
        }
    }

    protected void gvPending_SelectedIndexChanged(object sender, EventArgs e)
    {

        PendingView.ActiveViewIndex = 2;
        string ReferenceNo = gvPending.SelectedDataKey.Value.ToString();
        DataTable dt = dre.GetEventByRefNo(ReferenceNo);
        lblBranchCodePending.Text = dt.Rows[0]["BranchCode"].ToString();
        lblReferenceNoPending.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblORTPending.Text = dt.Rows[0]["ORT"].ToString();
        lblNOIPending.Text = dt.Rows[0]["NOI"].ToString();
        lblDOIPending.Text = Convert.ToDateTime(dt.Rows[0]["DOI"]).ToShortDateString();
        lblDOFPending.Text = Convert.ToDateTime(dt.Rows[0]["DIIF"]).ToShortDateString();
        lblORLPending.Text = dt.Rows[0]["LOR"].ToString();
        lblCreatedOnPending.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToShortDateString();
        lblCreatedByPending.Text = dt.Rows[0]["CreatedBy"].ToString();

        lblForwardToPending.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        lblStatusPending.Text = dt.Rows[0]["Status"].ToString();
        if (lblStatusPending.Text == "C")
        {
            lblStatusPending.Text = "Initialized/Created";
        }
        if (lblStatusPending.Text == "F")
        {
            lblStatusPending.Text = "Forwarded";
        }

        else if (lblStatusPending.Text == "N")
        {
            lblStatusPending.Text = "Noted";
        }
        gvEventHistoryPending.DataSource = dre.GetEventHistory(ReferenceNo);
        gvEventHistoryPending.DataBind();

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //TabContainer1.Visible = false;

        //string ReferenceNo = txtSearchByReferenceNo.Text;
        //DataTable dt = dre.GetTraceFileByRefNo(ReferenceNo);
        //if (dt.Rows.Count > 0)
        //{
        //    SearchView.ActiveViewIndex = 1;
        //    lblBranchCodeSearch.Text = dt.Rows[0]["BranchCode"].ToString();
        //    lblReferenceNoSearch.Text = dt.Rows[0]["ReferenceNo"].ToString();
        //    //lblLoanNameSearch.Text = dt.Rows[0]["LoanName"].ToString();
        //    //lblLoanTypeSearch.Text = dt.Rows[0]["LoanType"].ToString();
        //    //lblLimitSearch.Text = dt.Rows[0]["Limit"].ToString();
        //    //lblRemarksSearch.Text = dt.Rows[0]["Remarks"].ToString();
        //    lblCreatedOnSearch.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
        //    lblCreatedBySearch.Text = dt.Rows[0]["CreatedBy"].ToString();

        //    lblForwardToSearch.Text = dt.Rows[0]["LastForwardedTo"].ToString();
        //    lblStatusSearch.Text = dt.Rows[0]["Status"].ToString();
        //    gvEventHistorySearch.DataSource = dre.GetEventHistory(ReferenceNo);
        //    gvEventHistorySearch.DataBind();
        //}
        //else
        //{
        //    SearchView.ActiveViewIndex = 0;
        //    string Alert = "Sorry Wrong ReferenceNo";
        //    ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

        //}
    }
    protected void btnbacksearch_Click(object sender, EventArgs e)
    {
        //TabContainer1.Visible = true;
        //SearchView.ActiveViewIndex = 0;

    }

    protected void btnAdvSearch_Click(object sender, EventArgs e)
    {
        // Response.Redirect("~/Search.aspx");
    }

    protected void ddlLimitType_SelectedIndexChanged(object sender, EventArgs e)
    {

        //if (ddlLimitType.Text == "Non-Funded" || ddlLimitType.Text == "Both")
        //{
        //    txtLimit1.Visible = true;
        //}
        //else
        //{
        //    txtLimit1.Visible = false;
        //}

        //if (ddlLimitType.Text == "Funded" || ddlLimitType.Text == "Both")
        //{
        //    txtLimit.Visible = true;

        //}
        //else
        //{
        //    txtLimit.Visible = false;
        //}
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {

    }
}