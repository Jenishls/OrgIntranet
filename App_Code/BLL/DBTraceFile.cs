using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBTraceFile
/// </summary>
public class DBTraceFile
{
	public DBTraceFile()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int CreateTraceFile(string BranchCode, string refno, string LoanName, string LoanType,
        decimal Limit, string remarks, string status, string createdby, string lastforwardedto, string LimitType, decimal NLimit, string Nature)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",LoanName),
               new SqlParameter("@d",LoanType),
                new SqlParameter("@e",Limit),
                 new SqlParameter("@f",remarks),
                 
                   new SqlParameter("@g",status),
                    new SqlParameter("@h",createdby),
                    new SqlParameter("@i",lastforwardedto),
                    new SqlParameter("@j",LimitType),
                    new SqlParameter("@k",NLimit),
                    new SqlParameter("@l",Nature)
                    //new SqlParameter("@u",lastforwardedon),
                    //new SqlParameter("@v",approvedby),
                    //new SqlParameter("@w",approvedon)
        };

        return DAO.IUD(param, @"insert into TraceFile 
                       (BranchCode,ReferenceNo,LoanName,LoanType,Limit,Remarks,Status,CreatedBy,CreatedOn,LastForwardedTo,LimitType,NLimit,Nature)                                                                                                                                                                                                           
                     values(@a,@b,@c,@d,@e,@f,@g,@h,GETDATE(),@i,@j,@k,@l)", CommandType.Text);
    }
    
    public DataTable GetAllPendingTraceFile(string username)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@i",username)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,R.BranchCode,
                        'BranchName'=(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
                        Limit,Remarks,LoanName,
                        'Status'=Case when R.Status='C' then 'Created/Initialized'
		                         when R.Status='A' then 'Approved'
		                         when R.Status='R' then 'Rejected'
		                         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                 else 'UnKnown' end,
                        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
                        'CreatedBy'=U.FullName,
                        CreatedOn,NLimit,LimitType,Nature 
                        FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)

                        WHERE R.CreatedBy=U.Email
                        and R.Status not in('A','R')
                        and (select UserId from UserTable where R.LastForwardedTo=Email)=@i
                       AND [CreatedOn] > '2019-1-1'
                        order by CreatedOn DESC", CommandType.Text);
                                return dt;
    }
    public DataTable GetAllPendingTraceFileBranchWise(string branch)
    {

        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,R.BranchCode,
                        'BranchName'=(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
                        Limit,Remarks,LoanName,
                        'Status'=Case when R.Status='C' then 'Created/Initialized'
		                         when R.Status='A' then 'Approved'
		                         when R.Status='R' then 'Rejected'
		                         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                 else 'UnKnown' end,
                        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
                        'CreatedBy'=U.FullName,
                        CreatedOn,NLimit,LimitType,Nature 
                        FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)

                        WHERE R.CreatedBy=U.Email and R.BranchCode=@a 
                        and R.Status not in('A','R') order by CreatedOn ASC", CommandType.Text);
                                return dt;
    }
    public DataTable GetAllApprovedTraceFile()
    {
        DataTable dt = DAO.GetTable(null, @"
                        SELECT ReferenceNo,R.BranchCode,
                        Limit,Remarks,LoanName,
                        'Status'=Case when R.Status='C' then 'Created/Initialized'
		                         when R.Status='A' then 'Approved'
		                         when R.Status='R' then 'Rejected'
		                         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                 else 'UnKnown' end,
                        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
                        'CreatedBy'=U.FullName,
                        CreatedOn,NLimit,LimitType,Nature 
                        FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)
                        
                        WHERE  R.CreatedBy=U.Email
                        AND [CreatedOn] > '2019-1-1'
                        and R.Status in('A','R') order by CreatedOn DESC", CommandType.Text);
                                return dt;
    }
    public DataTable GetAllApprovedTraceFileBranchWise(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        }; 
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,R.BranchCode,
                        Limit,Remarks,LoanName,
                        'Status'=Case when R.Status='C' then 'Created/Initialized'
		                         when R.Status='A' then 'Approved'
		                         when R.Status='R' then 'Rejected'
		                         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                 else 'UnKnown' end,
                        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
                        'CreatedBy'=U.FullName,
                        CreatedOn,NLimit,LimitType,Nature 
                        FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)

                        WHERE  R.CreatedBy=U.Email  and R.BranchCode=@a
                        and R.Status in('A','R') order by CreatedOn ASC", CommandType.Text);
                                return dt;
    }
    public DataTable GetTraceFileByRefNo(string ReferenceNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",ReferenceNo)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,'BranchCode'=BT.BranchCode+':'+' '+BT.BranchName,
                        LoanName,LoanType,
                        'Limit'=Convert(int,Limit) ,Remarks,LoanName,
                        'Status'=Case when R.Status='C' then 'Created/Initialized'
		                         when R.Status='A' then 'Approved'
		                         when R.Status='R' then 'Rejected'
		                         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                 else 'UnKnown' end,
                        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
                        'CreatedBy'=(select FullName from UserTable where R.CreatedBy=Email),
                        CreatedOn,NLimit,LimitType,Nature,
                        'Approved/RejectedBy'=(select FullName from UserTable where R.[Approved/RejectedBy]=Email),
                        R.[Approved/RejectedOn]
                        FROM TraceFile R(NOLOCK),dbo.BranchTable BT(NOLOCK),UserTable U(NOLOCK)

                        WHERE R.BranchCode=BT.BranchCode and R.ReferenceNo=@a", CommandType.Text);
                                return dt;
    }

    public int ApproveTraceFile(string BranchCode, string refno, string ApprovedBy,string Remarks,string StatusTo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",refno),
              new SqlParameter("@ApprovedBy",ApprovedBy),
                new SqlParameter("@Remarks",Remarks),
                 new SqlParameter("@StatusTo",StatusTo)
        };

        return DAO.IUD(param,"sp_ApproveTraceFile" , CommandType.StoredProcedure);
    }
    public int ForwardTraceFile(string BranchCode, string refno, string ForwardedBy,string ForwardedTo, string Remarks)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",refno),
              new SqlParameter("@ForwardedBy",ForwardedBy),
        new SqlParameter("@ForwardedTo",ForwardedTo),
                new SqlParameter("@Remarks",Remarks)
        };

        return DAO.IUD(param, "sp_ForwardTraceFile", CommandType.StoredProcedure);
    }

    public DataTable GetTraceFileByRefNoN(string ReferenceNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",ReferenceNo)
        };
        DataTable dt = DAO.GetTable(param, "SELECT * from TraceFile where ReferenceNo=@a", CommandType.Text);
        return dt;
    }
   
    public DataTable GetAllBranch()
    {
        DataTable dt = DAO.GetTable(null, "select BranchCode,BranchName,'Branch'=BranchCode+':'+BranchName from BranchTable", CommandType.Text);
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

    public DataTable GetAllYear()
    {
        DataTable dt = DAO.GetTable(null, "select * from Year", CommandType.Text);
        return dt;

    }
    public DataTable CreateRefNo(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",branchcode)
        };
        DataTable dt = DAO.GetTable(param, "sp_CreateReferenceNo", CommandType.StoredProcedure);
        return dt;
    }

    public DataTable GetFileTraceHistory(string RefNo)
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
                        Remarks 
                        from TraceFileHistory R(NOLOCK)
                                Where ReferenceNo=@RefNo order by 1 asc ", CommandType.Text);
                                return dt;
    }
    


   
}