using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RiskEvent : System.Web.UI.Page
{
    DBRiskEvent dre = new DBRiskEvent();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                LoadEvents();
            }
            else
            {
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
        DataTable driskevents = dre.GetAllRiskEvents();
        gvRiskEvents.DataSource = driskevents;
        gvRiskEvents.DataBind();
    }

    private void LoadCreateEvent()
    {
         
        DataTable dt = dre.GetAllRiskType();
        ddlOperationRiskType.DataSource = dt;
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


        //DataTable dbt = dre.GetAllBranch();
        //ddlBranchCode.DataSource = dbt;
        //ddlBranchCode.DataValueField = "BranchCode";
        //ddlBranchCode.DataTextField = "Branch";
        //ddlBranchCode.DataBind();
        //ddlBranchCode.Items.Insert(0, "Choose Branch");

         string branch = Session["BranchCode"].ToString();
         if (branch == "000")
         {
             DataTable dtb = dbt.GetAllBranch();
             ddlBranchCode.DataSource = dtb;
             ddlBranchCode.DataValueField = "BranchCode";
             ddlBranchCode.DataTextField = "Branch";
             ddlBranchCode.DataBind();
             ddlBranchCode.Items.Insert(0, "Choose Branch");
         }
         else
         {
             DataTable dtb = dbt.GetBranchByBranchCode(branch);
             ddlBranchCode.DataSource = dtb;
             ddlBranchCode.DataValueField = "BranchCode";
             ddlBranchCode.DataTextField = "Branch";
             ddlBranchCode.DataBind();
         }

        txtAmount.Text = "0.00";
        txtPotentialOperationalLoss.Text = "0.00";
        txtGrossOperationalLoss.Text = "0.00";
        txtEventDetail.Text = "";
        txtBusinessInvolved.Text = "";
        txtActionTakenTillDate.Text = "";
        txtDateOfFinding.Text = "";
        txtDateOfIncident.Text = "";
        txtEventDetail.Text = "";
        DataTable dbm = dusert.GetBranchBM(branch);
        if (dbm.Rows.Count > 0)
        {
            txtForwardTo.Text = dbm.Rows[0]["Email"].ToString();
        }
        //txtForwardTo.Text = "";
        txtFurtherPlan.Text = "";
        txtNearMisses.Text = "";
        txtRevenueImplication.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Create")
        {
            string branchcode = ddlBranchCode.SelectedValue.ToString();
            string ort = ddlOperationRiskType.SelectedValue.ToString();
            string noi = ddlNatureOfIncident.SelectedValue.ToString();
            string lor = ddlOperationRiskLevel.SelectedValue.ToString();
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
            string msender = Session["username"].ToString();
            string ForwardedTo = txtForwardTo.Text;
            int i = dre.CreateRiskEvent(branchcode, referenceno, ort, noi, Convert.ToDateTime(txtDateOfIncident.Text), Convert.ToDateTime(txtDateOfIncident.Text), lor, txtBusinessInvolved.Text,
                Convert.ToDecimal(txtAmount.Text), Convert.ToDecimal(txtPotentialOperationalLoss.Text), Convert.ToDecimal(txtGrossOperationalLoss.Text), txtNearMisses.Text,
                txtRevenueImplication.Text, txtEventDetail.Text, txtActionTakenTillDate.Text, txtFurtherPlan.Text, ForwardedTo, "C", msender);
            //int i = dre.CreateRiskEvent(branchcode, referenceno, ort, noi, Convert.ToDateTime(txtDateOfIncident.Text), Convert.ToDateTime(txtDateOfFinding.Text), 
            //    lor, txtBusinessInvolved.Text, Convert.ToDecimal(txtAmount.Text), Convert.ToDecimal(txtPotentialOperationalLoss.Text), 
            //    Convert.ToDecimal(txtGrossOperationalLoss.Text), txtNearMisses.Text, txtRevenueImplication.Text, txtEventDetail.Text, txtActionTakenTillDate.Text, 
            //    txtFurtherPlan.Text, txtForwardTo.Text, "C", msender);
            if (i > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('New Risk Event Created"+"\\n"+" ReferenceNo:" + referenceno +"\\n"+ " Forwarded to:" + ForwardedTo + "');</script>");
               
                LoadCreateEvent();
                //lblMessage.Text = "The Risk Event with ReferenceNo:" + txtReferenceNo.Text + " " + "has been Created and Forwarded.";
            }
        }
        if (btnSubmit.Text == "Update")
        {
            string branchcode = ddlBranchCode.SelectedValue.ToString();
            string ort = ddlOperationRiskType.SelectedValue.ToString();
            string noi = ddlNatureOfIncident.SelectedValue.ToString();
            string lor = ddlOperationRiskLevel.SelectedValue.ToString();
            string RiskId = hfRiskIdE.Value;
            string referenceno = lblReferenceNo.ToString();
            int i = dre.UpdateRiskEvent(Convert.ToInt32(RiskId), branchcode, referenceno, ort, noi, Convert.ToDateTime(txtDateOfIncident.Text), Convert.ToDateTime(txtDateOfFinding.Text), lor, txtBusinessInvolved.Text, Convert.ToDecimal(txtAmount.Text), Convert.ToDecimal(txtPotentialOperationalLoss.Text), Convert.ToDecimal(txtGrossOperationalLoss.Text), txtNearMisses.Text, txtRevenueImplication.Text, txtEventDetail.Text, txtActionTakenTillDate.Text, txtFurtherPlan.Text, txtForwardTo.Text);

            if (i > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('Change Sucessfully Updated for ReferenceNo:" + referenceno + "');</script>");
               
                LoadCreateEvent();
                //lblMessage.Text = "The Risk Event with ReferenceNo:" + txtReferenceNo.Text + " " + "has been Updated and Forwarded.";
            }
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSubmit.Text = "Create";
        btnCancel.Text = "Reset";
        LoadCreateEvent();
        //lblHeading.Text = "New Student";
    }

    protected void btnViewEvents_Click(object sender, EventArgs e)
    {
        
        MultiView1.ActiveViewIndex = 0;
        LoadEvents();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (btnCancel.Text == "Reset")
        {
            LoadCreateEvent();
        }
        if (btnCancel.Text == "Cancel")
        {
            MultiView1.ActiveViewIndex = 0;
            LoadEvents();
        }
    }
    //----------autocomplete-----------

    protected void gvRiskEvents_SelectedIndexChanged(object sender, EventArgs e)
    {
            btnCreate.Visible = false;
            btnview1.Visible = false;
            MultiView1.ActiveViewIndex = 2;
            int riskid = Convert.ToInt32(gvRiskEvents.SelectedDataKey.Value.ToString());
            DataTable dt = dre.GetRiskEventsByRiskId(riskid);
            lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();
            lblReferenceNo.Text = dt.Rows[0]["ReferenceNo"].ToString();
            lblRiskType.Text = dt.Rows[0]["ORT"].ToString();
            lblNatureOfIncident.Text = dt.Rows[0]["NOI"].ToString();
            lblDateOfIncident.Text = Convert.ToDateTime(dt.Rows[0]["DOI"]).ToString("dd/MM/yyyy");
            lblDateOfFinding.Text = Convert.ToDateTime(dt.Rows[0]["DIIF"]).ToString("dd/MM/yyyy");
            lblOperationRiskLevel.Text = dt.Rows[0]["LOR"].ToString();
            lblBusinessInvolved.Text = dt.Rows[0]["BFI"].ToString();
            lblAmount.Text = dt.Rows[0]["AIR"].ToString();
            lblPotentialOperationalLoss.Text = dt.Rows[0]["POL"].ToString();
            lblGrossOperationalLoss.Text = dt.Rows[0]["GOLYTD"].ToString();
            lblNearMisses.Text = dt.Rows[0]["NM"].ToString();
            lblRevenueImplication.Text = dt.Rows[0]["RI"].ToString();
            lblEventDetail.Text = dt.Rows[0]["ED"].ToString();

            lblActionTakenTillDate.Text = dt.Rows[0]["ATTD"].ToString();
            lblFurtherPlan.Text = dt.Rows[0]["FPRC"].ToString();

            lblForwardTo.Text = dt.Rows[0]["LastForwardedTo"].ToString();

            lblCreatedBy.Text = dt.Rows[0]["CreatedBy"].ToString();
            lblCreatedOn.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
            lblNotedBy.Text = dt.Rows[0]["NotedBy"].ToString();
            lblNotedOn.Text = Convert.ToDateTime(dt.Rows[0]["NotedOn"]).ToString();

            lblStatus.Text = dt.Rows[0]["Status"].ToString();
            if (lblStatus.Text == "C")
            {
                lblStatus.Text = "Initialized/Created";
                btnNoted.Text = "Forward";
                btnEdit.Visible = false;
                lblNotedBy.Text = "";
                lblNotedOn.Text = "";
            }
            if (lblStatus.Text == "F")
            {
                lblStatus.Text = "Forwarded";
                btnEdit.Visible = false;
                lblNotedBy.Text = "";
                lblNotedOn.Text = "";
            }
            if (lblStatus.Text == "N")
            {
                lblStatus.Text = "Noted";
                btnNoted.Visible = false;
                btnEdit.Visible = false;
                
            }
            hfriskid.Value = riskid.ToString();
        }


    protected void btnOK_Click(object sender, EventArgs e)
    {
        gvRiskEvents.DataSource = null;
        gvRiskEvents.DataBind();
        MultiView1.ActiveViewIndex = 0;
        LoadEvents();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {


        EditRiskEvent(hfriskid.Value);

    }

    protected void gvRiskEvents_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditItem"))
        {
            GridViewRow clickedRow = ((LinkButton)e.CommandSource).NamingContainer as GridViewRow;
            string RiskId = ((HiddenField)clickedRow.FindControl("hfRiskId")).Value;
            EditRiskEvent(RiskId);
        }
    }

    private void EditRiskEvent(string RiskId)
    {
        MultiView1.ActiveViewIndex = 1;
        btnSubmit.Text = "Update";
        btnCancel.Text = "Cancel";
        DataTable dt = dre.GetRiskEventsByRiskIdN(Convert.ToInt32(RiskId));
        hfRiskIdE.Value = RiskId.ToString();

        DataTable dbt = dre.GetAllBranch();
        ddlBranchCode.DataSource = dbt;
        ddlBranchCode.DataValueField = "BranchCode";
        ddlBranchCode.DataTextField = "Branch";
        ddlBranchCode.DataBind();
        DataTable dbti = dre.GetBranchByBranchCode(dt.Rows[0]["BranchCode"].ToString());
        ddlBranchCode.SelectedValue = dbti.Rows[0]["BranchCode"].ToString();

        lblReferenceNo.Text = dt.Rows[0]["ReferenceNo"].ToString();

        DataTable drt = dre.GetAllRiskType();
        ddlOperationRiskType.DataSource = drt;
        ddlOperationRiskType.DataValueField = "RiskId";
        ddlOperationRiskType.DataTextField = "RiskType";
        ddlOperationRiskType.DataBind();
        DataTable drti = dre.GetRiskTypeById(Convert.ToInt32(dt.Rows[0]["ORT"].ToString()));
        ddlOperationRiskType.SelectedValue = drti.Rows[0]["RiskId"].ToString();

        DataTable dni = dre.GetAllNatureOfIncident();
        ddlNatureOfIncident.DataSource = dni;
        ddlNatureOfIncident.DataValueField = "IncidentId";
        ddlNatureOfIncident.DataTextField = "IncidentNature";
        ddlNatureOfIncident.DataBind();
        DataTable dnii = dre.GetNatureOfIncidentById(Convert.ToInt32(dt.Rows[0]["NOI"].ToString()));
        ddlNatureOfIncident.SelectedValue = dnii.Rows[0]["IncidentId"].ToString();


        txtDateOfIncident.Text = Convert.ToDateTime(dt.Rows[0]["DOI"]).ToString("dd/MM/yyyy");
        txtDateOfFinding.Text = Convert.ToDateTime(dt.Rows[0]["DIIF"]).ToString("dd/MM/yyyy");

        DataTable drl = dre.GetAllRiskLevel();
        ddlOperationRiskLevel.DataSource = drl;
        ddlOperationRiskLevel.DataValueField = "LevelId";
        ddlOperationRiskLevel.DataTextField = "RiskLevelType";
        ddlOperationRiskLevel.DataBind();
        DataTable drli = dre.GetRiskLevelById(Convert.ToInt32(dt.Rows[0]["LOR"].ToString()));
        ddlOperationRiskLevel.SelectedValue = drli.Rows[0]["LevelId"].ToString();


        txtBusinessInvolved.Text = dt.Rows[0]["BFI"].ToString();
        txtAmount.Text = dt.Rows[0]["AIR"].ToString();
        txtPotentialOperationalLoss.Text = dt.Rows[0]["POL"].ToString();
        txtGrossOperationalLoss.Text = dt.Rows[0]["GOLYTD"].ToString();
        txtNearMisses.Text = dt.Rows[0]["NM"].ToString();
        txtRevenueImplication.Text = dt.Rows[0]["RI"].ToString();
        txtEventDetail.Text = dt.Rows[0]["ED"].ToString();

        txtActionTakenTillDate.Text = dt.Rows[0]["ATTD"].ToString();
        txtFurtherPlan.Text = dt.Rows[0]["FPRC"].ToString();

        txtForwardTo.Text = dt.Rows[0]["LastForwardedTo"].ToString();

        lblCreatedBy.Text = dt.Rows[0]["CreatedBy"].ToString();
        lblCreatedOn.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy");

        lblStatus.Text = dt.Rows[0]["Status"].ToString();
    }

    protected void btnNoted_Click(object sender, EventArgs e)
    {
        string msender = Session["username"].ToString();
        int i = dre.NotedRiskEvent(lblBranchCode.Text, lblReferenceNo.Text, msender, "N");
        if (i > 0)
        {
            //string Subject = "Risk Event Noted" + " " + lblBranchCode.Text;
            //string Body = "New Loan Request: Approved" +
            //    Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
            //    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
            //    Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
            //     Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
            //     Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +

            //     Environment.NewLine +
            //    Environment.NewLine + "For Detail Follow: http://192.168.103.13/TraceFile.aspx";

            string Alert = "Risk Event Noted" + "\\n" + "ReferenceNo:" + lblReferenceNo.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            Response.Redirect("~/RiskEvent.aspx");

        }
        else
        {
            string Alert = "Ooops, Something went wrong !" + "\\n" + "Request Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
        }
    }

    protected void btnForward_Click(object sender, EventArgs e)
    {
        if(btnNoted.Text == "Forward")
        { 
        string msender = Session["username"].ToString();
        int i = dre.ForwardRiskEvent(lblBranchCode.Text, lblReferenceNo.Text, msender, "F");
        if (i > 0)
        {
            //string Subject = "Risk Event Noted" + " " + lblBranchCode.Text;
            //string Body = "New Loan Request: Approved" +
            //    Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
            //    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
            //    Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
            //     Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
            //     Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +

            //     Environment.NewLine +
            //    Environment.NewLine + "For Detail Follow: http://192.168.103.13/TraceFile.aspx";

            string Alert = "Risk Event Forwarded" + "\\n" + "ReferenceNo:" + lblReferenceNo.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            Response.Redirect("~/RiskEvent.aspx");

        }
        else
        {
            string Alert = "Ooops, Something went wrong !" + "\\n" + "Request Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
        }
        }
    }
}