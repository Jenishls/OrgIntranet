using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void GetFile_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        
        {
         
                string username = Session["UserId"].ToString();
                string Command = @"SELECT ReferenceNo,R.BranchCode,
                            'F.Limit'=Limit,'N.Limit'=NLimit,LoanName,
                            'Status'=Case when R.Status='C' then 'Created/Initialized'
		                             when R.Status='A' then 'Approved'
		                             when R.Status='R' then 'Rejected'
		                             when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                     else 'UnKnown' end,
                            'LastForwardedTo'=(select UserId from UserTable where R.LastForwardedTo=Email),
                            'CreatedBy'=U.FullName,
                            CreatedOn 
                            FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)

                            WHERE R.CreatedBy=U.Email
                            and R.Status not in('A','R') 
                            AND R.BranchCode=CASE WHEN @BranchCode='ALL' THEN R.BranchCode ELSE @BranchCode END Order By 2,1";
                
                SqlCommand cmd = new SqlCommand(Command,con);

                cmd.Parameters.AddWithValue("@BranchCode", TextBox1.Text);
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                
        }

        

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TraceFile.aspx");

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
   
}