using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBRiskindicators
/// </summary>
public class DBRiskindicators
{
	public DBRiskindicators()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable GetAllIndicators()
    {
        DataTable dt = DAO.GetTable(null, "SELECT RId,RiskIndicators,[Weight],[Group] FROM RiskIndicators ORDER BY [Group] and RiskVersion = '2' ", CommandType.Text);
        return dt;
    }

    public DataTable GetIndicatorByGroup(string group)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",group)
        };
        DataTable dt = DAO.GetTable(param, "SELECT 'Indicator'= RId+ ' '+ '-'+ ' ' +RiskIndicators,[Weight] FROM RiskIndicators WHERE [Group]=@a and RiskVersion = '2' ", CommandType.Text);
        return dt;
    }

    public DataTable GetIndicatorByRId(string id)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",id)
        };
        DataTable dt = DAO.GetTable(param, "SELECT 'Indicator'= RId+ ' '+ '-'+ ' ' +RiskIndicators FROM RiskIndicators WHERE RId=@a and RiskVersion = '2'", CommandType.Text);
        return dt;
    }

    public DataTable GetWeightByRId(string id)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",id)
        };
        DataTable dt = DAO.GetTable(param, "SELECT [Weight] FROM RiskIndicators WHERE RId=@a and RiskVersion = '2' ", CommandType.Text);
        return dt;
    }
}