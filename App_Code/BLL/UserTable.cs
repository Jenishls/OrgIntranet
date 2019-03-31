using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserTable
/// </summary>
public class UserTable
{
	public UserTable()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetAllUser()
    {
        return DAO.GetTable(null, "select * from UserTable", CommandType.Text);
    }
    public DataTable GetUserByUserName(string username)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",username)
        };
        return DAO.GetTable(param, "select * from UserTable where UserId=@a", CommandType.Text);
    }

    public DataTable GetUserByBranch(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",branchcode)
        };
        return DAO.GetTable(param, "select * from UserTable where BranchCode=@a", CommandType.Text);
    }

    public DataTable GetUserByDepartment(string department)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",department)
        };
        return DAO.GetTable(param, "select * from UserTable where Department=@a", CommandType.Text);
    }
    public DataTable GetBranchBM(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",branch)
        };
        return DAO.GetTable(param, "select * from UserTable where BranchCode=@a and Status='IsBM'", CommandType.Text);
    }
    public DataTable GetUserByUserNamePassword(string username,string password)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",username),
             new SqlParameter("@b",password)
        };
        return DAO.GetTable(param, "select * from UserTable where UserId=@a and Password=@b", CommandType.Text);
    }
    public int CreateUser(string BranchCode,string Department,string UserId, string Password,string FullName,string Email,string Gender,string Designation,string StaffId,string Status,string MobileNo,string Level)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
            new SqlParameter("@b",Department),
            new SqlParameter("@c",UserId),
            new SqlParameter("@d",Password),
            new SqlParameter("@e",FullName),
            new SqlParameter("@f",Email),
            new SqlParameter("@g",Gender),
            new SqlParameter("@h",Designation),
            new SqlParameter("@i",StaffId),
            new SqlParameter("@j",Status),
            new SqlParameter("@k",MobileNo),
            new SqlParameter("@l",Level),
        };
        return DAO.IUD(param, "Insert into UserTable Values(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l)", CommandType.Text);
    }

    public int GetIp(string userid , string ip)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userid),
            new SqlParameter("@b",ip)
            
        };
        return DAO.IUD(param, "Insert into LoginTable (UserId,LoginTime,LoginIP) Values(@a,GETDATE(),@b)", CommandType.Text);
    }
    public int UpdateUser(string BranchCode, string Department, string UserId, string FullName, string Email, string Gender, string Designation, string StaffId, string Status, string MobileNo, string Level)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
            new SqlParameter("@b",Department),
            new SqlParameter("@c",UserId),
           // new SqlParameter("@d",Password),
            new SqlParameter("@e",FullName),
            new SqlParameter("@f",Email),
            new SqlParameter("@g",Gender),
            new SqlParameter("@h",Designation),
            new SqlParameter("@i",StaffId),
            new SqlParameter("@j",Status),
            new SqlParameter("@k",MobileNo),
            new SqlParameter("@l",Level)
        };
        return DAO.IUD(param, @"Update  UserTable set BranchCode=@a,Department=@b,
    FullName=@e,Email=@f,Gender=@g,Designation=@h,StaffId=@i,Status=@j,MobileNo=@k,Level=@l where UserId=@c", CommandType.Text);
    }
    public int ResetPassword(string username,string password)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",username),
             new SqlParameter("@b",password)
        };
        return DAO.IUD(param, "Update UserTable set Password=@b where UserId=@a", CommandType.Text);
    }

    public DataTable GetAllDepartments()
    {
        
        return DAO.GetTable(null, "select * from DepartmentTable", CommandType.Text);
    }

    public int Logout(string userid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userid)
            
            
        };
        return DAO.IUD(param, "Delete from LoginTable where UserId=@a", CommandType.Text);
    }

    public int menuclick(string userid, string menu)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userid),
            new SqlParameter("@b",menu)
            
            
        };
        return DAO.IUD(param, "Update LoginTable set ActiveMenu=@b where UserId=@a", CommandType.Text);
    }

    public DataTable GetDesignation()
    {

        return DAO.GetTable(null, "SELECT * FROM dbo.Designation", CommandType.Text);
    }

    public int UpdateExam(string userid, int status)
    {
        SqlParameter[] param = new SqlParameter[]
        {
           
             new SqlParameter("@a",userid),
             new SqlParameter("@b",status)
        };

        return DAO.IUD(param, "UPDATE dbo.OTexams SET examstatus=@b WHERE UserId=@a AND examstatus NOT IN (0,2)", CommandType.Text);
    }

    public DataTable GetExam(string userid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userid)
        };
        return DAO.GetTable(param, "SELECT * FROM dbo.OTexams WHERE UserId=@a AND examstatus='1'", CommandType.Text);
    }
}