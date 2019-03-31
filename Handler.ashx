<%@ WebHandler Language="C#" Class="FileCS" %>
 
using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class FileCS : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int id = int.Parse(context.Request.QueryString["Id"]);
        byte[] bytes;
        string fileName, contentType;
        string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@FileID", id);
                cmd.CommandText = "SELECT Name, Data, ContentType FROM tblFiles WHERE Id=@FileID";
                using (SqlDataReader sdr2 = cmd.ExecuteReader())
                {
                    sdr2.Read();
                    bytes = (byte[])sdr2["Data"];
                    contentType = sdr2["ContentType"].ToString();
                    fileName = sdr2["Name"].ToString();
                }
                con.Close();
            }
        }
        context.Response.Buffer = true;
        context.Response.Charset = "";
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (contentType.ToLower() == "application/pdf")
        {
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            context.Response.ContentType = "application/octet-stream";
        }
        else
        {
            context.Response.ContentType = "text/plain";
        }
        context.Response.BinaryWrite(bytes);
        context.Response.Flush();
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}