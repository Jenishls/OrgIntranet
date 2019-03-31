using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;


public partial class Resolution : System.Web.UI.Page
{
    DBPipeLine dpl = new DBPipeLine();
    DBBranchTable dbt = new DBBranchTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoad();
    }

    private void PageLoad()
    {
        //pnlDetails2.Visible = false;
        pnlDetails1.Visible = false;
        pnlResolution.Visible = false;
        ddlStatus.Visible = false;
        pnlRemarks.Visible = false;
        pnlLoan.Visible = false;
        BDetail.Visible = false;
        btnExe.Visible = false;
        btnCancel.Visible = false;
        btnSearch.Visible = false;
        //GridView1.Visible = false;
        DataTable dt = dbt.GetAllBranch();
        ddlBranch.DataSource = dt;
        ddlBranch.DataValueField = "BranchCode";
        ddlBranch.DataTextField = "Branch";
        ddlBranch.DataBind();
        ddlBranch.Items.Insert(0, "Choose Branch");
    }

    
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        GetDetails();
        
    }

    private void GetDetails()
    {
        string ReferenceNo = txtSearch.Text;
        DataTable dt = dpl.GetDetailsByRefNo(ReferenceNo);
        if (dt.Rows.Count > 0)
        {
            //pnlDetails2.Visible = false;
            pnlDetails1.Visible = true;
            pnlResolution.Visible = true;
            ddlStatus.Visible = true;
            pnlRemarks.Visible = true;
            pnlLoan.Visible = true;
            BDetail.Visible = true;
            btnCancel.Visible = true;
            pnlRemarks.Visible = false;

            lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();

            lblCName.Text = dt.Rows[0]["Name"].ToString();
            lblType.Text = dt.Rows[0]["BusinessType"].ToString();
            lblVDate.Text = Convert.ToDateTime(dt.Rows[0]["VisitDate"]).ToString("MM/dd/yyyy");
            lblVBy.Text = dt.Rows[0]["VisitBy"].ToString();
            txtProduct.Text = dt.Rows[0]["ProductType"].ToString();
            txtProduct1.Text = dt.Rows[0]["ProductType1"].ToString();
            txtProduct2.Text = dt.Rows[0]["ProductType2"].ToString();
            txtNature.Text = dt.Rows[0]["Nature"].ToString();
            txtNature1.Text = dt.Rows[0]["Nature1"].ToString();
            txtNature2.Text = dt.Rows[0]["Nature2"].ToString();
            txtExpAmt.Text = Convert.ToDecimal(dt.Rows[0]["ExpectedAmt"]).ToString("0.00");
            txtExpAmt1.Text = Convert.ToDecimal(dt.Rows[0]["ExpectedAmt1"]).ToString("0.00");
            txtExpAmt2.Text = Convert.ToDecimal(dt.Rows[0]["ExpectedAmt2"]).ToString("0.00");
            txtExpDate.Text = Convert.ToDateTime(dt.Rows[0]["ExpRDate"]).ToString("MM/dd/yyyy");
            txtExpDate1.Text = dt.Rows[0]["ExpRDate1"].ToString();
            txtExpDate2.Text = dt.Rows[0]["ExpRDate2"].ToString();
            txtExpRate.Text = dt.Rows[0]["ExpIntRate"].ToString();
            txtExpRate1.Text = dt.Rows[0]["ExpIntRate1"].ToString();
            txtExpRate2.Text = dt.Rows[0]["ExpIntRate2"].ToString();
            txtExpCharge.Text = dt.Rows[0]["ServiceCharge"].ToString();
            txtExpCharge1.Text = dt.Rows[0]["ServiceCharge1"].ToString();
            txtExpCharge2.Text = dt.Rows[0]["ServiceCharge2"].ToString();
            txtBank.Text = dt.Rows[0]["Bank"].ToString();
            txtBank1.Text = dt.Rows[0]["Bank1"].ToString();
            txtBank2.Text = dt.Rows[0]["Bank2"].ToString();
            txtExpComm.Text = dt.Rows[0]["Commission"].ToString();
            txtExpComm1.Text = dt.Rows[0]["Commission1"].ToString();
            txtExpComm2.Text = dt.Rows[0]["Commission2"].ToString();
            txtProbab.Text = dt.Rows[0]["Probability"].ToString();
            txtProbab1.Text = dt.Rows[0]["Probability1"].ToString();
            txtProbab2.Text = dt.Rows[0]["Probability2"].ToString();

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
        //btnCancel.Visible = true;
    }
    protected void btnSearch1_Click(object sender, EventArgs e)
    {
        string branch = Session["BranchCode"].ToString();
        string name = txtSearch.Text;

        if (!string.IsNullOrEmpty(name) && btnSearch1.Text == "Search")
        {
            GridView1.CellPadding = 10;
            DataTable dt = dpl.GetRefnoByName(name,branch);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //btnSearch.Visible = true;
        }
        else if (string.IsNullOrEmpty(name) && btnSearch1.Text == "Search")
        {
            GridView1.CellPadding = 10;
            DataTable dt1 = dpl.GetRefnoByBranch(branch);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        else
        {
            Response.Redirect("~/Resolution.aspx", false);
            //btnSearch1.Text = "Search";
        }
    }
    protected void btnExe_Click(object sender, EventArgs e)
    {
        if(btnExe.Text=="Transfer")
        {
            search.Visible = false;
            pnlExec.Visible = false;
            string referenceno = txtSearch.Text;
            string branch = ddlBranch.SelectedValue.ToString();
            int i = dpl.Transfer(referenceno, branch);
            if (i > 0)
            {
                pnlMsg.Visible = true;
                lblMsg.Text = referenceno + "  " + "has been Transfered to:" +"  "+ branch;
                //ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC KEEP','" + username + " <br /> <br />  You are not allowed to attempt this test. <br /> <br /> Please wait till next notice.');</script>");
                //return;
            }
            else
            {
                pnlMsg.Visible = true;
                lblMsg.Text = "Status of:" + "  " + referenceno + "  " + "is already 'Executed'. Data not transfered.";
            }
        }
        else if(btnExe.Text=="Execute")
        {
            search.Visible = false;
            pnlExec.Visible = false;
            string referenceno = txtSearch.Text;
            string amount = txtExeAmount.Text;
            int i = dpl.Execute(referenceno,Convert.ToDecimal(amount));
            if(i > 0)
            { 
            pnlMsg.Visible = true;
            lblMsg.Text = "Status of:" + "  " + referenceno + "  " + "has been updated.";
            }
            else
            {
                pnlMsg.Visible = true;
                lblMsg.Text = "Status of:" + "  " + referenceno + "  " + "is already 'Executed'. Data not updated.";
            }
        }
        else
        {
            search.Visible = false;
            pnlExec.Visible = false;
            string referenceno = txtSearch.Text;
            int i = dpl.Canceled(referenceno);
            if (i > 0)
            {
                pnlMsg.Visible = true;
                lblMsg.Text = "Status of:" + "  " + referenceno + "  " + "has been updated.";
            }
            else
            {
                pnlMsg.Visible = true;
                lblMsg.Text = "Status of:" + "  " + referenceno + "  " + "is already 'Executed'. Data not updated.";
            }
            
            
        }
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if(ddlStatus.SelectedValue=="Executed")
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
        else if(ddlStatus.SelectedValue=="Canceled")
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
            pnlBranch.Visible = false;
            //ddlBranch.Focus();
            btnExe.Text = "Canceled";
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
    protected void chkEdit_CheckedChanged(object sender, EventArgs e)
    {
        if(chkEdit.Checked==true)
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
            GetDetails();
            btnExe.Text = "Execute";
        }
    }

    public virtual int CellPadding { get; set; }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Resolution.aspx", false);
        
    }
    protected void btnMsg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Resolution.aspx", false);
    }
}