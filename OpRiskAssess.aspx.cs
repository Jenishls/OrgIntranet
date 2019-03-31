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

public partial class OpRiskAssess : System.Web.UI.Page
{
   
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
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

            DataTable dbm = dusert.GetBranchBM(branch);
            if (dbm.Rows.Count > 0)
            {
                lblBM.Text = dbm.Rows[0]["FullName"].ToString();
            }

        }
    }

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        string validate = Page.GetValidators("a").ToString();
        if (e.NextStepIndex == 1 &&  lblYear.Text != "Choose One")
        {
            lblBrName.Text = ddlBranchCode.SelectedItem.Text;
            lblYear.Text = ddlYear.SelectedItem.Text;
            lblMonth.Text = ddlMonth.SelectedItem.Text;
            lblNameBM.Text = lblBM.Text;
            lblA1.Text = ddlA1.SelectedItem.Text;
            lblWA1.Text = Convert.ToInt32(lblWA1.Text).ToString();
            A1RWE.Text = ((Convert.ToInt32(ddlA1.SelectedValue.ToString())) * (Convert.ToInt32(lblWA1.Text))).ToString();
            lblA2.Text = ddlA2.SelectedItem.Text;
            lblWA2.Text = Convert.ToInt32(lblWA2.Text).ToString();
            A2RWE.Text = ((Convert.ToInt32(ddlA2.SelectedValue.ToString())) * (Convert.ToInt32(lblWA2.Text))).ToString();
            lblA3.Text = ddlA3.SelectedItem.Text;
            lblWA3.Text = Convert.ToInt32(lblWA3.Text).ToString();
            A3RWE.Text = ((Convert.ToInt32(ddlA3.SelectedValue.ToString())) * (Convert.ToInt32(lblWA3.Text))).ToString();
            lblA4.Text = ddlA4.SelectedItem.Text;
            lblWA4.Text = Convert.ToInt32(lblWA4.Text).ToString();
            A4RWE.Text = ((Convert.ToInt32(ddlA4.SelectedValue.ToString())) * (Convert.ToInt32(lblWA4.Text))).ToString();
            lblA5.Text = ddlA5.SelectedItem.Text;
            lblWA5.Text = Convert.ToInt32(lblWA5.Text).ToString();
            A5RWE.Text = ((Convert.ToInt32(ddlA5.SelectedValue.ToString())) * (Convert.ToInt32(lblWA5.Text))).ToString();
            //double A = Convert.ToDouble(A1RWE.Text) + Convert.ToDouble(A2RWE.Text) + Convert.ToDouble(A3RWE.Text) + Convert.ToDouble(A4RWE.Text) + Convert.ToDouble(A5RWE.Text) * Convert.ToDouble(lblAW.Text) ;
            int A = Convert.ToInt32(A1RWE.Text) + Convert.ToInt32(A2RWE.Text) + Convert.ToInt32(A3RWE.Text) + Convert.ToInt32(A4RWE.Text) + Convert.ToInt32(A5RWE.Text); //* (Convert.ToInt32(lblAW.Text).ToString());
            decimal B = Convert.ToDecimal(lblAW.Text) ;//Convert.ToInt32(lblAW.Text);
            decimal C = A * B;
            lblATW.Text = C.ToString();
                //(((Convert.ToInt32(ddlA1.SelectedValue.ToString())) * (Convert.ToInt32(lblWA1.Text))).ToString() +
                //((Convert.ToInt32(ddlA2.SelectedValue.ToString())) * (Convert.ToInt32(lblWA2.Text))).ToString() +
                //((Convert.ToInt32(ddlA3.SelectedValue.ToString())) * (Convert.ToInt32(lblWA3.Text))).ToString() +
                //((Convert.ToInt32(ddlA4.SelectedValue.ToString())) * (Convert.ToInt32(lblWA4.Text))).ToString() +
                //((Convert.ToInt32(ddlA5.SelectedValue.ToString())) * (Convert.ToInt32(lblWA5.Text))).ToString()) / (Convert.ToInt32(lblAW.Text).ToString());
        }
    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Response.Redirect("~/Confirmation.aspx");
    } 
}