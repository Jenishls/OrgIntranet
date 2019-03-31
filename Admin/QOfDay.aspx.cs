using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Admin_QOfDay : System.Web.UI.Page
{
    Db ff = new Db();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }


    protected void btnSAve_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmdins = ff.getCommand("sp_InsQues");
            cmdins.Parameters.AddWithValue("@ques", txtQues.Text);
            cmdins.Parameters.AddWithValue("@cans", txtCans.Text);
            cmdins.ExecuteNonQuery();
            //we have to insert each answer so split it by ; to seperate answer
            String[] ans = txtAns.Text.Split(new String[] { ";" }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string ss in ans)
            {
                cmdins = ff.getCommand("sp_InsAnswers");
                cmdins.Parameters.AddWithValue("@anstext", ss);
                cmdins.ExecuteNonQuery();
            }
            cmdins.Connection.Close();
            txtAns.Text = "";
            txtCans.Text = "";
            txtQues.Text = "";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowStatus", "javascript:alert('Saved');", true);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}