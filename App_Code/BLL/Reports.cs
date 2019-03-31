using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Reports
/// </summary>
public class Reports
{
	public Reports()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable GetSubject()
    {
        DataTable dt = DAO.GetTable(null, "select sid,sname FROM OTsubjects S WHERE sid IN (SELECT sid FROM dbo.OTquestions Q WHERE Q.sid=S.sid)", CommandType.Text);
        return dt;
    }
    public DataTable GetExamBySid(string sid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",sid)
        };
        return DAO.GetTable(param, @"SELECT U.BranchCode,B.BranchName,U.FullName,U.Designation,O.nocans AS NoCans,examstatus AS ExamStatus,O.runningtime AS SpentTime,
                                    O.stdate AS StartDate,O.enddate AS EndDate 
                                    FROM dbo.OTexams O LEFT JOIN dbo.UserTable U 
                                    ON O.UserId=U.UserId LEFT JOIN dbo.BranchTable B ON U.BranchCode=B.BranchCode WHERE sid=@a ", CommandType.Text);
    }
}