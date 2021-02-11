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
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class OpRiskApp : System.Web.UI.Page
{
    DBOpRiskAssess dra = new DBOpRiskAssess();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    DBTraceFile dre = new DBTraceFile();

    DBRiskindicators dbri = new DBRiskindicators();
    DBYear dy = new DBYear();
    public string listFilter = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDropDown();
        string usertype = Session["Status"].ToString();
        string userid = Session["UserId"].ToString();
        string LoginBranch = Session["BranchCode"].ToString();
        string dept = Session["Department"].ToString();
        

        btnExportToExcelFilter.Visible = false;

        int Lbranch = Int32.Parse(LoginBranch); 
        if (usertype == "CRO" || usertype == "DCEO" || usertype == "CEO" || userid == "binod")
            
        {
            //btnApprove.Visible = true;
            //btnReject.Visible = true;
        }

        {
            if (Lbranch > 990 || userid == "sabin1091" || userid == "mohan" || userid == "saroj.bhandari" || userid == "rajeshd" || userid == "kumari9" || dept == "BOD" || dept.Equals("Admin") || dept == "System" || userid == "sonam1468")
            {
                btnRPT.Visible = true;
                h3.Visible = false;
                Panel2.Visible = true;
            }
            else {
                Panel2.Visible = false;
            }
        }

        if (usertype == "IntraUser")
        {
            Response.Redirect("~/Default.aspx");
        }

        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                //btnApprove.Visible = false;
                //btnDelete.Visible = false;
                LoadEvents();
                //LoadCreateEvent();

            }
            else
            {
                //LoadCreateEvent();
                //LoadEvents();
                Response.Redirect("~/Login.aspx");
            }
            
        }

    }
    private void LoadDropDown() {
        //DataTable dbt = dre.GetAllBranch();
        //ddlBranchCode.DataSource = dbt;
        //ddlBranchCode.DataValueField = "BranchCode";
        //ddlBranchCode.DataTextField = "Branch";
        //ddlBranchCode.DataBind();
        //ddlBranchCode.Items.Insert(0, "Choose Branch");

        //DataTable dbt = dre.GetAllYear();
        //ddlYear.DataSource = dbt;
        //ddlYear.DataValueField = "Year";
        //ddlYear.DataTextField = "Year";
        //ddlYear.DataBind();
        //ddlYear.Items.Insert(0, "Choose Year");
    }

    private void LoadEvents()
    {
        string LoginBranch = Session["BranchCode"].ToString();
        
        string status = Session["Status"].ToString();
        string username = Session["UserId"].ToString();
        string msg = "You don't have any pending file";
        //if (LoginBranch == "000")
        //{
        //    //TabPanelAF.Visible = true;
            gvPending.Visible = true;
            Image1.Visible = false;
            pnldata.Visible = false;
            lblmsg.Visible = false;
            var control = gvPending.FindControl("OpId");
            if (LoginBranch == "000")
            {
                DataTable POpRisk = dra.GetAllPendingOpRisk();
                gvPending.DataSource = POpRisk;
                gvPending.DataBind();
                //DataTable AOpRisk = dra.GetAllApprovedOpRisk();
                //gvPending.DataSource = AOpRisk;
                //gvPending.DataBind();
            }
            else
            {
                int Lbranch = Int32.Parse(LoginBranch); 
                if(Lbranch > 990)
                {
                    DataTable POpRisk = dra.GetAllPendingOpRiskProvinceWise(LoginBranch);
                    gvPending.DataSource = POpRisk;
                    gvPending.DataBind();
                }
                else
                {
                    DataTable POpRisk = dra.GetAllPendingOpRiskBranchWise(LoginBranch);
                    gvPending.DataSource = POpRisk;
                    gvPending.DataBind();
                }
                
                

            }
        
    }
    protected void gvPending_SelectedIndexChanged(object sender, EventArgs e)
    {
        string OpId = gvPending.SelectedDataKey.Value.ToString();
        riskView(OpId); 
    }

    protected void gdview_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataTable POpRisk = dra.GetAllPendingOpRisk();
        gvPending.DataSource = POpRisk;
        gvPending.DataBind();
        gvPending.PageIndex = e.NewPageIndex;
        gvPending.DataBind();
    }

    protected void GridViewFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        string OpId = GridViewFilter.SelectedDataKey.Value.ToString();
        riskView(OpId);
    }

    protected void gvPendingDetails_SelectedIndexChanged(object sender, EventArgs e)
    {

        //btnApprove.Visible = true;
        //btnDelete.Visible = true;
        //pnldata.Visible = true;
        //pnlinfo.Visible = false;
        //h3.Visible = false;
        //string OpId = gvPending.SelectedDataKey.Value.ToString();
        //DataTable dt = dra.GetFileByOpId(OpId);
        //lblBranchCodeAF.Text = dt.Rows[0]["BranchCode"].ToString();
        //lblBranchNameAF.Text = dt.Rows[0]["BranchName"].ToString();
        //lblReferenceNoAF.Text = dt.Rows[0]["OpId"].ToString();
        //lblLoanNameAF.Text = dt.Rows[0]["Year"].ToString();
        //lblLoanTypeAF.Text = dt.Rows[0]["Month"].ToString();
        //lblLimitTypeAF.Text = dt.Rows[0]["TotalRWE"].ToString();
        //lblLimitAF.Text = dt.Rows[0]["RiskLevel"].ToString();
        //lblCreatedOnAF.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
        //lblCreatedByAF.Text = dt.Rows[0]["CreatedBy"].ToString();
        //lblStatusAF.Text = dt.Rows[0]["Status"].ToString();
        //if (lblStatusAF.Text == "P")
        //{
        //    lblStatusAF.Text = "Created/Pending";
        //}

        //else if (lblStatusAF.Text == "A")
        //{
        //    lblStatusAF.Text = "Approved";
        //}


    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/RiskAssess.aspx");
    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        string msender = Session["username"].ToString();
        
            int i = dra.ApproveOpRiskAssess(lblBranchCodeAF.Text, lblReferenceNoAF.Text, msender, "A");

            if (i > 0)
            {
                //string Subject = "Loan Approved" + " " + lblBranchCodeAF.Text;
                //string Body = "New Loan Request: Approved" +
                //    Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
                //    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
                //    Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
                //     Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
                //     Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +

                //     Environment.NewLine +
                //    Environment.NewLine + "For Detail Follow: http://192.168.103.13";

                string Alert = "OpRiskAssess Approved" + "\\n" + "OpRiskId:" + lblReferenceNoAF.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
                // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

                Response.Redirect("~/RiskAssess.aspx");

            }
            else
            {
                string Alert = "Ooops, Error???" + "\\n" + "Its Already Approved Or Something went wrong !" + "\\n" + "Request Rejected";
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
            }
        

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //string msender = Session["username"].ToString();
        int i = dra.DeleteOpRiskAssess(lblBranchCodeAF.Text, lblReferenceNoAF.Text);
        if (i > 0)
        {
            //string Subject = "Loan Approved" + " " + lblBranchCodeAF.Text;
            //string Body = "New Loan Request: Approved" +
            //    Environment.NewLine + "Branch:" + " " + lblBranchCodeAF.Text +
            //    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNoAF.Text +
            //    Environment.NewLine + "Loan Name:" + " " + lblLoanNameAF.Text +
            //     Environment.NewLine + "Loan Type:" + " " + lblLoanTypeAF.Text +
            //     Environment.NewLine + "Limit:" + " " + lblLimitAF.Text +

            //     Environment.NewLine +
            //    Environment.NewLine + "For Detail Follow: http://192.168.103.13/TraceFile.aspx";

            string Alert = "OpRiskAssess Deleted" + "\\n" + "OpRiskId:" + lblReferenceNoAF.Text;// +"\\n" + "Forwarded to:" + ForwardedTo;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

            Response.Redirect("~/RiskAssess.aspx");

        }
        else
        {
            string Alert = "Ooops, Something went wrong !" + "\\n" + "Request Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
        }
    }
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        pnldata.Visible = false;
        lblmsg.Visible = false;
        pnlinfo.Visible = false;
        Image1.Visible = false;
        btnBack.Visible = true;
        btnRPT.Visible = false;
        string OpId = gvPending.SelectedDataKey.Value.ToString();
        DataTable dt = dra.GetFileByOpIdAll(OpId);
        GridView1.DataSource = dt;
        GridView1.DataBind();

       
    }

    private void LoadReport()
    {
        string LoginBranch = Session["BranchCode"].ToString();

        string status = Session["Status"].ToString();
        string username = Session["UserId"].ToString();
        string BranchCodeUser = Session["BranchCode"].ToString();
        int Lbranch = Int32.Parse(LoginBranch); 
        if (LoginBranch == "000" || Lbranch > 990)
        {
            pnldata.Visible = false;
            lblmsg.Visible = false;
            pnlinfo.Visible = false;
            Image1.Visible = false;
            btnBack.Visible = false;
            if (LoginBranch == "000")
            {
                string BranchCode = txtBranch.Text;
                string Year = txtYear.Text;
                string Month = txtMonth.Text;
                string RId = txtRId.Text;
                DataTable Rpt = dra.GetReportAll(BranchCode, Year, Month, RId);
                gvReport.DataSource = Rpt;
                gvReport.DataBind();
            }
            else
            {
                string BranchCode = txtBranch.Text;
                string Year = txtYear.Text;
                string Month = txtMonth.Text;
                string RId = txtRId.Text;
                DataTable Rpt = dra.GetReportProvince(BranchCode, Year, Month, RId, BranchCodeUser);
                gvReport.DataSource = Rpt;
                gvReport.DataBind();
                

            }
        }
       
    }
    protected void btnRPT_Click(object sender, EventArgs e)
    {
        pnlReport.Visible = true;
        Panel2.Visible = false;
        btnOK.Visible = true;
        btnBack.Visible = false;
        gvPending.Visible = false;
        btnRPT.Visible = false;
        
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        LoadReport();
        btnRPT.Visible = false;
        btnExportToExcel.Visible = true;
        txtBranch.Text = "";
        txtYear.Text = "";
        txtMonth.Text = "";
        txtRId.Text = "";
        btnBack.Visible = true;
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {

        
        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment; filename=Approved/Pending.xls");

        Response.ContentType = "application/excel";

        System.IO.StringWriter stringWriter = new System.IO.StringWriter();

        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);


        gvReport.HeaderRow.Style.Add("background-color", "#FFFFFF");


        foreach (TableCell tableCell in gvReport.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }


        foreach (GridViewRow gridViewRow in gvReport.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }

        gvReport.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }

    public void btnFilter_Click(object sender, EventArgs e) 
    {
        gvPending.Visible = false;
        GridViewFilter.Visible = true;
        btnExportToExcelFilter.Visible = true;
        string BranchCode = txtBranchCode.Text;
        string Year = ddlYear.Text;
        string Month = ddlMonth.Text;
        DataTable Rpt = dra.GetSummarizedReport(BranchCode, Year, Month);
        GridViewFilter.DataSource = Rpt;
        GridViewFilter.DataBind();

    }

    protected void btnExportToExcel_ClickFilter(object sender, EventArgs e)
    {


        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment; filename=Approved/Pending.xls");

        Response.ContentType = "application/excel";

        System.IO.StringWriter stringWriter = new System.IO.StringWriter();

        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);


        GridViewFilter.HeaderRow.Style.Add("background-color", "#FFFFFF");


        foreach (TableCell tableCell in GridViewFilter.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }


        foreach (GridViewRow gridViewRow in GridViewFilter.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }

        GridViewFilter.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }

    protected void riskView(string OpId) 
    {
        btnApprove.Visible = true;
        btnDelete.Visible = true;
        pnldata.Visible = true;
        Image1.Visible = true;
        pnlinfo.Visible = false;
        Panel2.Visible = false;
        btnBack.Visible = false;
        btnRPT.Visible = false;
        GridViewFilter.Visible = false;
        h3.Visible = false;
        //string OpId = gvPending.SelectedDataKey.Value.ToString();
        string status1 = Session["Status"].ToString();
        string userid1 = Session["UserId"].ToString();
        DataTable dt = dra.GetFileByOpId(OpId);
        string status = dt.Rows[0]["Status"].ToString();
        if (status == "Approved" || status1 != "IsBM" && userid1 != "mukunda" && userid1 != "mohan" && userid1 != "saroj.bhandari" && userid1 != "sonam1468")
        {
            btnApprove.Visible = false;
            btnDelete.Visible = false;
        }
        else
        {
            btnApprove.Visible = true;
            btnDelete.Visible = true;
        }
        lblBranchCodeAF.Text = dt.Rows[0]["BranchCode"].ToString();
        lblBranchNameAF.Text = dt.Rows[0]["BranchName"].ToString();
        lblReferenceNoAF.Text = dt.Rows[0]["OpId"].ToString();
        lblLoanNameAF.Text = dt.Rows[0]["Year"].ToString();
        lblLoanTypeAF.Text = dt.Rows[0]["Month"].ToString();
        lblLimitTypeAF.Text = dt.Rows[0]["TotalRWE"].ToString();
        lblLimitAF.Text = dt.Rows[0]["RiskLevel"].ToString();
        lblCreatedOnAF.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
        lblCreatedByAF.Text = dt.Rows[0]["CreatedBy"].ToString();
        lblStatusAF.Text = dt.Rows[0]["Status"].ToString();
        if (lblStatusAF.Text == "P")
        {
            lblStatusAF.Text = "Created/Pending";


        }

        else if (lblStatusAF.Text == "A")
        {
            lblStatusAF.Text = "Approved";

        }
        
    }

    protected void detailView(string OpId)
    {
        Panel2.Visible = false;
        pnldata.Visible = false;
        lblmsg.Visible = false;
        pnlinfo.Visible = false;
        Image1.Visible = false;
        btnBack.Visible = true;
        btnRPT.Visible = false;
        //string OpId = gvPending.SelectedDataKey.Value.ToString();
        DataTable dt = dra.GetFileByOpIdAll(OpId);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}