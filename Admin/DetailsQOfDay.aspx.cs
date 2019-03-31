using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_DetailsQOfDay : System.Web.UI.Page
{
    Db ff = new Db();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Literal1.Text = getdetails(Request.QueryString["qid"]).ToString();

        }
    }

    private StringBuilder getdetails(string qid)
    {
        StringBuilder sb = new StringBuilder();
        SqlCommand cmd = ff.getCommand("selectResults");
        cmd.Parameters.AddWithValue("@qid", qid);
        SqlParameter sp = cmd.Parameters.Add("@b", SqlDbType.Int);
        sp.Direction = ParameterDirection.Output;
        cmd.ExecuteNonQuery();
        int total = int.Parse(cmd.Parameters["@b"].Value.ToString());
        SqlDataReader dr = cmd.ExecuteReader();
        sb.Append("<table style='border:thin groove silver;height:25px;color:green;font-variant: normal;font-size: 8pt;line-height: normal;font-family: Arial;'>");
        //int =0;

        sb.Append("<tr >");
        sb.Append("<td colspan='3' style='background-color:#DDFFDD;height:25px;'>");
        sb.Append(Request.QueryString["ques"]);
        sb.Append("</td>");

        sb.Append("</tr>");
        while (dr.Read())
        {
            sb.Append("<tr>");
            sb.Append("<td style='border:thin groove silver; height:25px;'>");
            sb.Append(dr["anstext"].ToString());
            sb.Append("</td>");
            sb.Append("<td style='border:thin groove silver;height:25px;'>");
            int widt = int.Parse(dr["anscount"].ToString()) * 100 / total;
            sb.Append(dr["anscount"].ToString() + " Answer");
            sb.Append("</td>");
            sb.Append("<td style='border:thin groove silver;height:25px;'>");
            sb.Append("" + widt + " %");
            sb.Append("</td>");
            sb.Append("</tr>");
        }
        sb.Append("<tr>");

        sb.Append("<td style='background-color:#DDFFDD;border:thin groove silver; height:25px;'>");
        sb.Append("Total");
        sb.Append("</td>");
        sb.Append("<td style='background-color:#DDFFDD;border:thin groove silver;text-align:center;height:25px;'>");
        sb.Append("" + total + " Answer");
        sb.Append("</td>");
        sb.Append("<td style='background-color:#DDFFDD;border:thin groove silver;text-align:center;height:25px;'>");
        sb.Append("");
        sb.Append("</td>");
        sb.Append("</tr>");
        sb.Append("</table>");
        return sb;
    }
}