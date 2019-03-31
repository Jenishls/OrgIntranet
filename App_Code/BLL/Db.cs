using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Db
/// </summary>
public class Db
    
{
     SqlConnection cn = null;
	public Db()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public  SqlConnection GetConnection()
    {
        cn = new SqlConnection();
        cn.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["myconnection"].ToString();
        if (cn.State == ConnectionState.Closed)
        {
            cn.Open();
        }
        return cn;
    }
    public SqlCommand getCommand(string query)
    {
        SqlCommand cmdques = new SqlCommand(query);
        cmdques.CommandType = CommandType.StoredProcedure;
        cmdques.Connection = GetConnection();
        return cmdques;
    }
    public void closeConnection() 
    {

        cn.Close();
        cn = null;
    }

   public DataTable getAnsweredUser(string userid, string qid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userid),
            new SqlParameter("@b",qid)
        };
        return DAO.GetTable(param, "SELECT DISTINCT QId,UserId FROM dbo.QAnswer WHERE UserId=@a AND QId=@b", CommandType.Text);
    }

   public DataTable getCorrectAns(string  qid)
   {
       SqlParameter[] param = new SqlParameter[]
        {
           
            new SqlParameter("@b",qid)
        };
       return DAO.GetTable(param, "SELECT  QId,CorrectAns FROM dbo.Ques WHERE QId=@b", CommandType.Text);
   }
}
