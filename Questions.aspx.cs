using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Timers;

public partial class Questions : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
    SqlCommand comm = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CountdownTimer"] == null)
        {
            Session["CountdownTimer"] = new CountDown(TimeSpan.Parse("00:00:50"));
            (Session["CountdownTimer"] as CountDown).Start();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected string GetID(object ob)
    {
        return DataBinder.Eval(ob, "Id").ToString() + ".";
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {

    }
}