using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBUserTableT
/// </summary>
public class DBUserTableT
{
	public DBUserTableT()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int CreateUser(string username, string password)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",username),
             new SqlParameter("@b",password)
              
        };

        return DAO.IUD(param, "insert into UserTableTest values(@a,@b)", CommandType.Text);
    }
    public DataTable GetAllUser()
    {
        return DAO.GetTable(null, "select * from UserTableTest", CommandType.Text);
    }
    public DataTable GetUserByUserId(int userid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userid)
        };
        return DAO.GetTable(param, "select * from UserTableTest where UserId=@a", CommandType.Text);
    }

    public int UpdateStudent(int userid,string username, string password)
    {
        SqlParameter[] param = new SqlParameter[]
        {
           new SqlParameter("@a",username),
             new SqlParameter("@b",password),
              new SqlParameter("@c",userid),
               
        };

        return DAO.IUD(param, "update UserTableTest set UserName=@a,Password=@b where UserId=@c", CommandType.Text);
    }

    public DataTable GetCertificate(string username)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@i",username)
        };
        DataTable dt = DAO.GetTable(param, @"
                SELECT UserId,U.BranchCode,FullName,B.BranchName 
                INTO #Temp
                FROM dbo.UserTable U LEFT JOIN dbo.BranchTable B ON U.BranchCode=B.BranchCode WHERE UserId=@i

                SELECT UserId,examid,nocans,sid,stdate AS SDate, (SELECT TOP 1 enddate) AS EDate 
                INTO #Temp1
                FROM dbo.OTexams WHERE UserId=@i
				ORDER BY enddate DESC

                SELECT L.sid,T.UserId,T.BranchCode,T.BranchName,UPPER(T.FullName) as FullName,nocans,
				'Grade'=CASE WHEN L.nocans>=35 THEN 'Excellent' WHEN L.nocans BETWEEN 30 AND 34 THEN 'Good' ELSE 'Poor' END,S.sname,L.SDate,L.EDate 
                FROM #Temp T LEFT JOIN #Temp1 L ON T.UserId=L.UserId
                LEFT JOIN dbo.OTsubjects S ON L.sid=S.sid

                DROP TABLE #Temp,#Temp1", CommandType.Text);
        return dt;
    }
   }