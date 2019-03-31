using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBMemo
/// </summary>
public class DBMemo
{
	public DBMemo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int CreateMemo(string branchcode, string refno,string to, string depart, string through, string from, string subject, string memo, string comment, string forward, string createby, string status)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",branchcode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",to),
               new SqlParameter("@d",depart),
               new SqlParameter("@e",through),
                new SqlParameter("@f",from),
                 new SqlParameter("@g",subject),
                  new SqlParameter("@h",memo),
                  //new SqlParameter("@i",image),
                  new SqlParameter("@j",comment),
                  new SqlParameter("@k",forward),
                  new SqlParameter("@l",createby),
                  new SqlParameter("@m",status)
        };

        return DAO.IUD(param, @"insert into OnlineMemo(BranchCode,ReferenceNo,ToName,InDepartment,Through,FromName,Subject,FreeMemo,Comment,ForwardTo,CreatedBy,CreatedOn,Status) 
                                values(@a,@b,@c,@d,@e,@f,@g,@h,@j,@k,@l,GETDATE(),@m)", CommandType.Text);
    }

    public DataTable MCreateRefNo(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",branchcode)
        };
        DataTable dt = DAO.GetTable(param, "sp_MCreateReferenceNo", CommandType.StoredProcedure);
        return dt;
    }

    public int ApproveMemo(string BranchCode, string refno, string ApprovedBy, string Comments, string StatusTo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",refno),
              new SqlParameter("@ApprovedBy",ApprovedBy),
                new SqlParameter("@Comments",Comments),
                 new SqlParameter("@StatusTo",StatusTo)
        };

        return DAO.IUD(param, "sp_ApproveMemo", CommandType.StoredProcedure);
    }
    public int ForwardMemo(string BranchCode, string refno, string ForwardedBy, string ForwardedTo, string Comments)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",refno),
              new SqlParameter("@ForwardedBy",ForwardedBy),
                new SqlParameter("@ForwardedTo",ForwardedTo),
                new SqlParameter("@Comments",Comments)
        };

        return DAO.IUD(param, "sp_ForwardMemo", CommandType.StoredProcedure);
    }

    public DataTable GetAllMemo()
    {
        return DAO.GetTable(null, "select * from OnlineMemo", CommandType.Text);
    }

    public DataTable GetMemoByRefNo(string refno)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",refno)
        };
        return DAO.GetTable(param, "select * from OnlineMemo where ReferenceNo=@a", CommandType.Text);
    }

    public DataTable GetMemoHistory(string RefNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@RefNo",RefNo)
        };
        DataTable dt = DAO.GetTable(param, @"
                        select Date,
                        'ForwardedBy'=(select FullName from UserTable U(NOLOCK) where R.ForwardedBy=U.Email ),
                        'ForwardedTo'=Case when ForwardedTo='' then ''
                        when ForwardedTo not in(select P.Email from UserTable P(NOLOCK) )then ForwardedTo
                        else (select FullName from UserTable P(NOLOCK) where R.ForwardedTo=P.Email )end,
                        Comments 
                        from MemoHistory R(NOLOCK)
                                Where ReferenceNo=@RefNo order by 1 asc ", CommandType.Text);
        return dt;
    }

    //public DataTable GetAllUser()
    //{
    //    return DAO.GetTable(null, "select * from UserTable", CommandType.Text);
    //}
}