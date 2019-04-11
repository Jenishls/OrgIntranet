using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class PipeLine : System.Web.UI.Page
{
    DBPipeLine dpl = new DBPipeLine();
    DBBranchTable bt = new DBBranchTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string branch = Session["BranchCode"].ToString();
        int Lbranch = Int32.Parse(branch); 
        if(branch == "000" || Lbranch > 990 )
        {
            ddlType.Items.Remove("Deposit");
            ddlType.Items.Remove("Loan");
        }
        else
        {
            Head.Visible = false;
        }
        if(!IsPostBack)
        {
            ddlRpt.Items.Insert(0, "Choose Report");
            ddlType.Items.Insert(0, "Choose Type");
        }
       
    }
    protected void btnGo_Click(object sender, EventArgs e)
    {
        if (ddlType.SelectedItem.ToString() == "Loan")
        {
            Response.Redirect("BusinessPipeLine.aspx", false);
            
        }
        else if (ddlType.SelectedItem.ToString() == "Resolution-Loan")
        { 
            Response.Redirect("Resolution.aspx", false);
        }
        else if(ddlType.SelectedItem.ToString() == "Deposit")
        {
            Response.Redirect("DepositPipeLine.aspx", false);
        }
        else if(ddlType.SelectedItem.ToString() == "Resolution-Deposit")
        {
            Response.Redirect("ResolutionDeposit.aspx", false);
        }


    }

    protected void ddlRpt_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlRpt.SelectedValue == "ALL")
        {
            GetReportALL();
            Branch.Visible = false;
        }
        else if (ddlRpt.SelectedValue == "Branch Wise")
        {
            //txtBranch.Visible = true;
            GetReportByBranch();
            Branch.Visible = false;
        }
        else
        {
            GetReportByProvince();
            Branch.Visible = false;
        }
        
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {

    }

    private void GetReportALL()
    {
        DataTable dt = dpl.GetReportALL();
        gvReportALL.DataSource = dt;
        gvReportALL.DataBind();
    }

    private void GetReportByBranch()
    {

        string branch1 = txtBranch.Text;
        DataTable dt = dpl.GetReportByBranch(branch1);
        gvReportALL.DataSource = dt;
        gvReportALL.DataBind();
        
    }

    private void GetReportByProvince()
    {

        string province = txtBranch.Text;
        DataTable dt = dpl.GetReportByProvince(province);
        gvReportALL.DataSource = dt;
        gvReportALL.DataBind();

    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment; filename=Business Pipeline.xls");
        Response.ContentType = "application/excel";
        System.IO.StringWriter stringWriter = new System.IO.StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
        gvReportALL.HeaderRow.Style.Add("background-color", "#FFFFFF");
        foreach (TableCell tableCell in gvReportALL.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }
        foreach (GridViewRow gridViewRow in gvReportALL.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }

        gvReportALL.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void gvReportALL_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //gvReportALL.PageIndex = e.NewPageIndex;
        //this.GetReportALL();
    }
    
}