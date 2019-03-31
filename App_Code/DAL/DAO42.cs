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
public static class DAO42
{
	static DAO42()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string ConnectionStr42 = WebConfigurationManager.ConnectionStrings["myconnection42"].ConnectionString;

    public static SqlConnection GetConnection42()
    {
        SqlConnection con = new SqlConnection(ConnectionStr42);
        if (con.State != ConnectionState.Open)
        {
            con.Open();
        }
        return con;
    }

    public static int IUD(SqlParameter[] param, string sql, CommandType cmdType)
    {
        using (SqlConnection con = GetConnection42())
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
    public static DataTable GetTable(SqlParameter[] param, string sql, CommandType cmdType)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = GetConnection42())
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

}