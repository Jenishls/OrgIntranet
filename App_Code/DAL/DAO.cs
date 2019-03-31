using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for DAO
/// </summary>
public static class DAO
{
	static DAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string ConnectionStr = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

    public static SqlConnection GetConnection()
    {
        SqlConnection con = new SqlConnection(ConnectionStr);
        if (con.State != ConnectionState.Open)
        {
            con.Open();
        }
        return con;
    }
    //public static int IUD(string sql
    public static int IUD(SqlParameter[] param, string sql, CommandType cmdType)
    {
        using (SqlConnection con = GetConnection())
        {

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = cmdType;
            if (param != null)
            {
                cmd.Parameters.AddRange(param);
            }

            int i = cmd.ExecuteNonQuery();
            return i;

        }

    }
    public static int IUD( string sql)
    {
        using (SqlConnection con = GetConnection())
        {

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
           
            int i = cmd.ExecuteNonQuery();
            return i;

        }

    }
    public static DataTable GetTable(SqlParameter[] param, string sql, CommandType cmdType)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = GetConnection())
        {

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = cmdType;
            if (param != null)
            {
                cmd.Parameters.AddRange(param);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

    }

    public static DataTable GetTable(string sql)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = GetConnection())
        {

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

    }

    public static SqlDataReader GetReader(string sql)
    {
        using (SqlConnection con = GetConnection())
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            return cmd.ExecuteReader();
        }

    }

   
}