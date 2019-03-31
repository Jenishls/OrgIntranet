using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SearchPipeline : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
       SqlCommand cmd = new SqlCommand("select * from [PipeLineLoan]", conn);   
        using (conn)
        {
        conn.Open();
        GridView1.DataSource = cmd.ExecuteReader();
        GridView1.DataBind();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from [PipeLineLoan] where Name = @name", conn);
        try
        {
        using (conn)
        {
        conn.Open();
        SqlParameter Username = new SqlParameter();
        Username.ParameterName = "@name";
        //Username.SqlDbType = System.Data.SqlDbType;
        Username.Value = TextBox1.Text.Trim();
        cmd.Parameters.Add(Username);
        GridView1.DataSource = cmd.ExecuteReader();
        GridView1.DataBind();
        }
        }
        catch (Exception ex)
        {
        Response.Write(ex.Message);
        }
        }
    
}