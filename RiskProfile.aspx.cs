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

public partial class RiskProfile : System.Web.UI.Page
{
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    DBYear dy = new DBYear();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string branch = Session["BranchCode"].ToString();
            //string year = ddlYear.SelectedValue.ToString();
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

                DataTable dbm = dusert.GetBranchBM(branch);
                if (dbm.Rows.Count > 0)
                {
                    lblBM.Text = dbm.Rows[0]["FullName"].ToString();
                }
                DataTable dty = dy.GetAllYear();
                ddlYear.DataSource = dty;
                ddlYear.DataValueField = "Year";
                ddlYear.DataTextField = "Year";
                ddlYear.DataBind();
                ddlYear.Items.Insert(0, "Choose Year");

                //string year = ddlYear.SelectedItem.Text;
                DataTable dtm = dy.GetRestMonth(branch);
                ddlMonth.DataSource = dtm;
                ddlMonth.DataValueField = "Month";
                ddlMonth.DataTextField = "Month";
                ddlMonth.DataBind();
                ddlMonth.Items.Insert(0, "Choose Month");

            }
        }
    }
    protected void btnStart_Click(object sender, EventArgs e)
    {
        Page.Validate("a");
        if (Page.IsValid)
        {
            //Session.Add("indicators", exam);
            Response.RedirectPermanent("Profiling.aspx", true);
        }
    }
}