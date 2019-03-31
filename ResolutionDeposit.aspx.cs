using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class ResolutionDeposit : System.Web.UI.Page
{
    DBPipeLine dpl = new DBPipeLine();
    DBBranchTable dbt = new DBBranchTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        //pnlDetails2.Visible = false;
        pnlDetails1.Visible = false;
        pnlResolution.Visible = false;
        ddlStatus.Visible = false;
        pnlRemarks.Visible = false;
        pnlLoan.Visible = false;
        BDetail.Visible = false;
        btnExe.Visible = false;
        btnSearch.Visible = false;
        //GridView1.Visible = false;
        DataTable dt = dbt.GetAllBranch();
        ddlBranch.DataSource = dt;
        ddlBranch.DataValueField = "BranchCode";
        ddlBranch.DataTextField = "Branch";
        ddlBranch.DataBind();
        ddlBranch.Items.Insert(0, "Choose Branch");
    }




    protected void btnSearch1_Click(object sender, EventArgs e)
    {
        string branch = Session["BranchCode"].ToString();
        string name = txtSearch.Text;

        if (!string.IsNullOrEmpty(name) && btnSearch1.Text == "Search")
        {
            GridView1.CellPadding = 10;
            DataTable dt = dpl.GetRefnoByNameD(name, branch);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //btnSearch.Visible = true;
        }
        else if (string.IsNullOrEmpty(name) && btnSearch1.Text == "Search")
        {
            GridView1.CellPadding = 10;
            DataTable dt1 = dpl.GetRefnoByBranchD(branch);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        else
        {
            Response.Redirect("~/Resolution.aspx", false);
            //btnSearch1.Text = "Search";
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string ReferenceNo = txtSearch.Text;
        DataTable dt1 = dpl.GetDetailByRefNo(ReferenceNo);
        if (dt1.Rows.Count > 0)
        {
            //pnlDetails2.Visible = false;
            pnlDetails1.Visible = true;
            pnlResolution.Visible = true;
            ddlStatus.Visible = true;
            pnlRemarks.Visible = true;
            pnlLoan.Visible = true;
            BDetail.Visible = true;
            pnlRemarks.Visible = false;

            lblBranchCode.Text = dt1.Rows[0]["BranchCode"].ToString();
            lblCName.Text = dt1.Rows[0]["Name"].ToString();
            lblType.Text = dt1.Rows[0]["DepositType"].ToString();
            lblVDate.Text = Convert.ToDateTime(dt1.Rows[0]["VisitDate"]).ToString("MM/dd/yyyy");
            lblVBy.Text = dt1.Rows[0]["VisitBy"].ToString();
            txtExpAmt.Text = Convert.ToDecimal(dt1.Rows[0]["ExpectedAmt"]).ToString("0.00");
            txtExpDate.Text = Convert.ToDateTime(dt1.Rows[0]["ExpRDate"]).ToString("MM/dd/yyyy");
            txtExpRate.Text = dt1.Rows[0]["ExpIntRate"].ToString();
            txtBank.Text = dt1.Rows[0]["Bank"].ToString();
            txtProbab.Text = dt1.Rows[0]["Probability"].ToString();
            

            //txtStatus.Text = dt.Rows[0]["Status"].ToString();
            //lblCreatedOnSearch.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString();
            //lblCreatedBySearch.Text = dt.Rows[0]["CreatedBy"].ToString();

            btnSearch1.Visible = true;
            btnSearch1.Text = "Back";
            GridView1.Visible = false;
            btnExe.Visible = true;
        }
        else
        {

            string Alert = "Sorry Wrong ReferenceNo";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','" + Alert + @"', function(){
                alertify.message('OK');
              });</script>");

            //string Alert = "Sorry Wrong ReferenceNo";
            //ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtSearch.Text = GridView1.SelectedRow.Cells[1].Text;
        //btnSearch.Text = "Submit";
        GridView1.Visible = false;
        btnSearch1.Visible = false;
        btnSearch.Visible = true;
    }
    protected void chkEdit_CheckedChanged(object sender, EventArgs e)
    {
        if (chkEdit.Checked == true)
        {
            pnlExec.Visible = false;
            //pnlDetails2.Visible = false;
            pnlDetails1.Visible = true;
            pnlResolution.Visible = true;
            ddlStatus.Visible = false;
            pnlRemarks.Visible = false;
            pnlLoan.Visible = true;
            BDetail.Visible = true;
            btnExe.Visible = true;
            btnExe.Text = "Update";
            btnSearch.Visible = false;
            //pnlBranch.Visible = true;
            //ddlBranch.Focus();

            //txtExpAmt.ReadOnly = false;
            //txtExpAmt.ForeColor = System.Drawing.Color.Red;
            //txtExpAmt1.ReadOnly = false;
            //txtExpAmt2.ReadOnly = false;
        }
        else
        {
            ddlStatus.Visible = false;
            btnSearch.Visible = true;
            txtExpAmt.ReadOnly = true;
            txtExpAmt.ForeColor = System.Drawing.Color.Black;
            btnExe.Text = "Execute";
        }
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlStatus.SelectedValue == "Executed")
        {
            btnExe.Text = "Execute";
            pnlExec.Visible = true;
            //pnlDetails2.Visible = false;
            pnlDetails1.Visible = true;
            pnlResolution.Visible = true;
            ddlStatus.Visible = true;
            pnlRemarks.Visible = false;
            pnlLoan.Visible = true;
            BDetail.Visible = true;
            pnlBranch.Visible = false;
            btnExe.Visible = true;
            btnSearch.Visible = false;
            txtExeAmount.Focus();
        }
        else if (ddlStatus.SelectedValue == "Canceled")
        {
            Response.Redirect("PipeLine.aspx", false);
        }
        else
        {
            pnlExec.Visible = false;
            //pnlDetails2.Visible = false;
            pnlDetails1.Visible = true;
            pnlResolution.Visible = true;
            ddlStatus.Visible = true;
            pnlRemarks.Visible = false;
            pnlLoan.Visible = true;
            BDetail.Visible = true;
            btnExe.Visible = true;
            btnSearch.Visible = false;
            pnlBranch.Visible = true;
            ddlBranch.Focus();
            btnExe.Text = "Transfer";
        }
    }
    protected void btnExe_Click(object sender, EventArgs e)
    {
        if (btnExe.Text == "Transfer")
        {
            //need to write
        }
        else if (btnExe.Text == "Execute")
        {
            //need to write
        }
        else
        {
            //need to write
        }
    }
}