using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLNews
/// </summary>
public class BLLNews
{
	public BLLNews()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetAllTop3News()
    {
        return DAO.GetTable(null, "select top 3 Date,SUBSTRING(Description,1,200) as Description, Title,[Date],NewsId from NewsTable order by 1 desc", CommandType.Text);
    }
    public DataTable GetNewsByNewsId(int newsid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",newsid)
        };
        return DAO.GetTable(param, "select NewsId,Title,Description,left(Date,12) as Date from NewsTable where NewsId=@a", CommandType.Text);
    }
}