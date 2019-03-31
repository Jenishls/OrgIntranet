using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBBranchTable
/// </summary>
public class DBBranchTable
{
	public DBBranchTable()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetAllBranch()
    {
        DataTable dt = DAO.GetTable(null, "select BranchCode,BranchName,'Branch'=BranchCode+':'+BranchName from BranchTable", CommandType.Text);
        return dt;
    }
    public DataTable SelectedBranch()
    {

        DataTable dt = DAO.GetTable(null, "sp_SelectedBranch", CommandType.StoredProcedure);
        return dt;
    }
    public DataTable GetBranchByBranchCode(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branchcode)
        };
        DataTable dt = DAO.GetTable(param, "select BranchCode,BranchName,'Branch'=BranchCode+':'+BranchName from BranchTable where BranchCode=@a", CommandType.Text);
        return dt;
    }

    public DataTable GetAllDepartments()
    {

        return DAO.GetTable(null, "select * from OTDepartment order by Department", CommandType.Text);
    }

    public DataTable GetAllSubjects(string level, string branch, string userid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",level),
             new SqlParameter("@b",branch),
             new SqlParameter("@c",userid)
             
        };
        DataTable dt = DAO.GetTable(param, @"select sid,sname,U.UserId,U.Designation from OTsubjects S LEFT JOIN dbo.UserTable U ON U.Level=S.Level 
                                            WHERE sid IN (SELECT sid FROM dbo.OTquestions Q WHERE Q.sid=S.sid) AND (U.BranchCode=@b or S.IsAll = 1)
                                            AND U.Level=@a and UserId=@c", CommandType.Text);
        return dt;
        //return DAO.GetTable(null, "select sid,sname from OTsubjects S WHERE sid IN (SELECT sid FROM dbo.OTquestions Q WHERE Q.sid=S.sid)", CommandType.Text);
    }
    public DataTable GetMinDate(string UserId, string Sid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",UserId),
             new SqlParameter("@b",Sid)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT sid, MIN(stdate) AS StartDate FROM dbo.OTexams WHERE UserId=@a AND sid=@b
        GROUP BY sid", CommandType.Text);
        return dt;
    }
}