using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class PEP : System.Web.UI.Page
{
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnPrint.Visible = false;
        pnl1.Visible = false;
        pnlTable.Visible = false;
        //SearchByTagTB.Text = "";
    }

    protected void SearchByTagButton_Click(object sender, EventArgs e)
    {
        string branch = Session["BranchCode"].ToString();
        string user = Session["FullName"].ToString();
        String strConn = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Select * FROM PepList WHERE UPPER(Name) LIKE UPPER(@SearchByTagTB) +'%' ", conn);

        SqlParameter search = new SqlParameter();
        search.ParameterName = "@SearchByTagTB";
        search.Value = txtForwardTo.Text.Trim();

        cmd.Parameters.Add(search);
        SqlDataReader dr = cmd.ExecuteReader();
        
        if (dr.Read() && txtForwardTo !=null)
        {
            lblPName.Text = dr["Name"].ToString();
            lblORG.Text = dr["Organization"].ToString();
            lblDesignation.Text = dr["Designation"].ToString();
            lblDOB.Text = dr["Dob"].ToString();
            lblTAddress.Text = dr["TAddress"].ToString();
            lblPAddress.Text = dr["Address"].ToString();
            lblId.Text = dr["IdType"].ToString();
            lblIdNumber.Text = dr["IdNumber"].ToString();
            lblGFather.Text = dr["GrandFather"].ToString();
            lblFather.Text = dr["Father"].ToString();
            lblMother.Text = dr["Mother"].ToString();
            lblSon.Text = dr["Son"].ToString();
            lblDaughter.Text = dr["Daughter"].ToString();
            lblSpouse.Text = dr["Spouse"].ToString();
           
            pnlTable.Visible = true;
            
        }
        else 
        {
            lblMsg.Visible = true;
            pnlTable.Visible = false;
            lblMsg.Text = "Sorry, There is No Record To Display !!!";
            lblMsg.BackColor = System.Drawing.Color.Yellow;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        //gvPeps.DataSource = dt;
        //gvPeps.DataBind();
        dr.Close();
        dr.Dispose();
        conn.Close();
        btnPrint.Visible = true;
        pnl1.Visible = true;
        lblBranch.Text = branch;
        lblName.Text = user;
        lblDate.Text = DateTime.Now.ToString();
        
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PEP.aspx");
    }
}