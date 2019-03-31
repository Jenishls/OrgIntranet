using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class AdminTracefile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }
 
    protected void btnDelete_Click(object sender, EventArgs e)
    {
            string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_DeleteRefNo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ReferenceNo", TextBox1.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Delete Record of:" + TextBox1.Text + "Successfully";
            TextBox1.Text = "";
      
    }
}