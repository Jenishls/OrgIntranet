using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBYear
/// </summary>
public class DBYear
{
	public DBYear()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable GetAllYear()
    {
        DataTable dt = DAO.GetTable(null, "SELECT * FROM [Year] ORDER BY [Year]", CommandType.Text);
        return dt;
    }

    public DataTable GetAllMonth()
    {
        DataTable dt = DAO.GetTable(null, "SELECT * FROM [Month] ", CommandType.Text);
        return dt;
    }
    public DataTable GetRestMonth(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
             
        };
        DataTable dt = DAO.GetTable(param, @"SELECT  Month FROM dbo.Month WHERE Month NOT IN (SELECT Month FROM dbo.OpRiskAssess WHERE Year='2076' AND BranchCode=@a)", CommandType.Text);
        return dt;
    }

    public DataTable GetIYearByYear(string year)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",year)
        };
        DataTable dt = DAO.GetTable(param, "SELECT Year FROM [Year]  WHERE [Year]=@a", CommandType.Text);
        return dt;
    }

    public DataTable GetIMonthByMonth(string month)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",month)
        };
        DataTable dt = DAO.GetTable(param, "SELECT * FROM [Month]  WHERE [Month]=@a", CommandType.Text);
        return dt;
    }

   
}