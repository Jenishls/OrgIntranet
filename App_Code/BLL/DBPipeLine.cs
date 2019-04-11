using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBPipeLine
/// </summary>
public class DBPipeLine
{
	public DBPipeLine()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int CreatePipeLine1(string BranchCode, string refno, string Name, string BusinessType, DateTime visitdate, string visitby, string LoanType,
       string Nature, decimal ExpAmt, DateTime ExpRDate, string ExpIntRate, string ServiceCharge,
       string Bank, string Commission, string Probability, string remarks, string status,
       string CreatedBy)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",Name),
               new SqlParameter("@d",BusinessType),
                new SqlParameter("@e",visitdate),
                 new SqlParameter("@f",visitby),
                 new SqlParameter("@g",LoanType),
                    
                    new SqlParameter("@i",Nature),
                    
                    new SqlParameter("@k",ExpAmt),
                    
                    new SqlParameter("@m",ExpRDate),
                    
                    new SqlParameter("@o",ExpIntRate),
                    
                    new SqlParameter("@q",ServiceCharge),
                    
                    new SqlParameter("@s",Bank),
                    
                    new SqlParameter("@u",Commission),
                    
                    new SqlParameter("@w",Probability),
                    
                    new SqlParameter("@y",remarks),
                    new SqlParameter("@z",status),
                    new SqlParameter("@1",CreatedBy),
                    //new SqlParameter("@1",CreatedBy),
                    //new SqlParameter("@2",CreatedBy),
        };

        return DAO.IUD(param, @"insert into PipeLineLoan 
                       (BranchCode,ReferenceNo,Name,BusinessType,VisitDate,VisitBy,ProductType,Nature,
                        ExpectedAmt,ExpRDate,ExpIntRate,ServiceCharge,Bank,Commission,Probability,Remarks,Status,CreatedOn,CreatedBy)                                                                                                                                                                                                           
                       values(@a,@b,@c,@d,@e,@f,@g,@i,@k,@m,@o,@q,@s,@u,@w,@y,@z,GETDATE(),@1)", CommandType.Text);
    }
    public int CreatePipeLine2(string BranchCode, string refno, string Name, string BusinessType, DateTime visitdate, string visitby, string LoanType,
       string Nature, decimal ExpAmt, DateTime ExpRDate, string ExpIntRate, string ServiceCharge,
       string Bank, string Commission, string Probability, string remarks, string status,
       string CreatedBy, string LoanType1,
       string Nature1, decimal ExpAmt1, DateTime ExpRDate1, string ExpIntRate1, string ServiceCharge1,
       string Bank1, string Commission1, string Probability1)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",Name),
               new SqlParameter("@d",BusinessType),
                new SqlParameter("@e",visitdate),
                 new SqlParameter("@f",visitby),
                 new SqlParameter("@g",LoanType),
                    new SqlParameter("@h",LoanType1),
                    new SqlParameter("@i",Nature),
                    new SqlParameter("@j",Nature1),
                    new SqlParameter("@k",ExpAmt),
                    new SqlParameter("@l",ExpAmt1),
                    new SqlParameter("@m",ExpRDate),
                    new SqlParameter("@n",ExpRDate1),
                    new SqlParameter("@o",ExpIntRate),
                    new SqlParameter("@p",ExpIntRate1),
                    new SqlParameter("@q",ServiceCharge),
                    new SqlParameter("@r",ServiceCharge1),
                    new SqlParameter("@s",Bank),
                    new SqlParameter("@t",Bank1),
                    new SqlParameter("@u",Commission),
                    new SqlParameter("@v",Commission1),
                    new SqlParameter("@w",Probability),
                    new SqlParameter("@x",Probability1),
                    new SqlParameter("@y",remarks),
                    new SqlParameter("@z",status),
                    new SqlParameter("@1",CreatedBy),
                    //new SqlParameter("@1",CreatedBy),
                    //new SqlParameter("@2",CreatedBy),
        };

        return DAO.IUD(param, @"insert into PipeLineLoan 
                       (BranchCode,ReferenceNo,Name,BusinessType,VisitDate,VisitBy,ProductType,Nature,
                        ExpectedAmt,ExpRDate,ExpIntRate,ServiceCharge,Bank,Commission,Probability,Remarks,Status,CreatedOn,CreatedBy,
                        ProductType1,Nature1,ExpectedAmt1,ExpRDate1,ExpIntRate1,ServiceCharge1,Bank1,Commission1,Probability1)                                                                                                                                                                                                           
                       values(@a,@b,@c,@d,@e,@f,@g,@i,@k,@m,@o,@q,@s,@u,@w,@y,@z,GETDATE(),@1,@h,@j,@l,@n,@p,@r,@t,@v,@x)", CommandType.Text);
    }

    
    public DataTable PCreateRefNo(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",branchcode)
        };
        DataTable dt = DAO.GetTable(param, "sp_PCreateReferenceNo", CommandType.StoredProcedure);
        return dt;
    }

    public DataTable GetDetailsByRefNo(string ReferenceNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",ReferenceNo)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,'BranchCode'=BT.BranchCode+':'+' '+BT.BranchName,
                        Name,R.BusinessType,R.VisitDate,R.VisitBy,R.ProductType,R.Nature,R.ExpectedAmt,R.ExpRDate,R.ExpIntRate,
                        R.ServiceCharge,R.Bank,R.Commission,R.Probability,R.CreatedOn,R.Status,R.ProductType1,R.Nature1,isnull(R.ExpectedAmt1,0) as ExpectedAmt1 ,R.ExpRDate1,R.ExpIntRate1,
                        R.ServiceCharge1,R.Bank1,R.Commission1,R.Probability1,R.ProductType2,R.Nature2,isnull(R.ExpectedAmt2,0) as ExpectedAmt2 ,R.ExpRDate2,R.ExpIntRate2,
                        R.ServiceCharge2,R.Bank2,R.Commission2,R.Probability2,
                        
                        'CreatedBy'=(select FullName from UserTable where R.CreatedBy=Email)
                        
                        FROM dbo.PipeLineLoan R(NOLOCK),dbo.BranchTable BT(NOLOCK),UserTable U(NOLOCK)

                        WHERE R.BranchCode=BT.BranchCode and R.ReferenceNo=@a", CommandType.Text);
        return dt;
    }

    public DataTable GetRefnoByName(string name, string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",name),
             new SqlParameter("@b",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,BranchCode,Name,BusinessType
                        
                        FROM dbo.PipeLineLoan

                        WHERE UPPER(Name) like '%' + (@a) + '%' OR LOWER(Name) LIKE '%' + (@a) + '%' AND BranchCode=CASE WHEN @b='000' THEN BranchCode ELSE @b END", CommandType.Text);
        return dt;
    }

    public DataTable GetRefnoByBranch(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            
             new SqlParameter("@b",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,BranchCode,Name,BusinessType
                        
                        FROM dbo.PipeLineLoan

                        WHERE BranchCode=CASE WHEN @b='000' THEN BranchCode ELSE @b END", CommandType.Text);
        return dt;
    }

    public DataTable GetReportALL()
    {
       
        DataTable dt = DAO.GetTable(null, @"
                        SELECT BranchName,ReferenceNo,CONVERT(VARCHAR(Max),Name) AS Name,BusinessType,
                        REPLACE(convert(varchar,convert(Money, ISNULL(P.ExpectedAmt,0)+ISNULL(P.ExpectedAmt1,0)+ISNULL(P.ExpectedAmt2,0)),1),'.00','') AS ExpectedAmt,Probability,
                        CONVERT(NVARCHAR(max),CreatedOn,101) AS CreatedOn,Status FROM dbo.PipeLineLoan P, dbo.BranchTable B
                        WHERE P.BranchCode=B.BranchCode
                        ORDER BY CreatedOn DESC", CommandType.Text);
        return dt;
    }

    public DataTable GetReportByBranch(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            
             new SqlParameter("@b",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT BranchName,ReferenceNo,CONVERT(VARCHAR(Max),Name) AS Name,BusinessType,
                        REPLACE(convert(varchar,convert(Money, ISNULL(P.ExpectedAmt,0)+ISNULL(P.ExpectedAmt1,0)+ISNULL(P.ExpectedAmt2,0)),1),'.00','') AS ExpectedAmt,Probability,
                        CONVERT(NVARCHAR(max),CreatedOn,101) AS CreatedOn,Status FROM dbo.PipeLineLoan P, dbo.BranchTable B
                        WHERE P.BranchCode=B.BranchCode
                        AND P.BranchCode=@b
                        ORDER BY CreatedOn DESC", CommandType.Text);
                                return dt;
    }

    public DataTable GetReportByProvince(string province)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            
             new SqlParameter("@b",province)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT Province,BranchName,ReferenceNo,CONVERT(VARCHAR(Max),Name) AS Name,BusinessType,
                        REPLACE(convert(varchar,convert(Money, ISNULL(P.ExpectedAmt,0)+ISNULL(P.ExpectedAmt1,0)+ISNULL(P.ExpectedAmt2,0)),1),'.00','') AS ExpectedAmt,Probability,
                        CONVERT(NVARCHAR(max),CreatedOn,101) AS CreatedOn,Status FROM dbo.PipeLineLoan P, dbo.BranchTable B
                        WHERE P.BranchCode=B.BranchCode
                        AND B.Province=@b
                        ORDER BY CreatedOn DESC", CommandType.Text);
        return dt;
    }

    public int Canceled(string refno)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",refno),
              
        };

        return DAO.IUD(param, "UPDATE dbo.PipeLineLoan SET Status='Canceled' where ReferenceNo=@a AND Status<>'Executed'", CommandType.Text);
    }

    public int Execute(string refno, decimal execamt)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",execamt),
             new SqlParameter("@b",refno),
              
        };

        return DAO.IUD(param, "UPDATE dbo.PipeLineLoan SET Status='Executed',ExecutedAmt=@a,ExecutedDate=GETDATE() WHERE ReferenceNo=@b AND Status<>'Executed'", CommandType.Text);
    }

    public int Transfer(string refno, string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch),
             new SqlParameter("@b",refno),
              
        };

        return DAO.IUD(param, "UPDATE dbo.PipeLineLoan SET Status='Transfered',BranchToForward=@a where ReferenceNo=@b AND Status<>'Executed'", CommandType.Text);
    }

    //Deposit //

    public int CreatePipeLineD(string BranchCode, string refno, string Name, string BusinessType, DateTime visitdate, string visitby, decimal ExpAmt, DateTime ExpRDate, string ExpIntRate,
      string Bank, decimal ReceivedAmt, string Probability, string remarks, string status,
      string CreatedBy)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",Name),
               new SqlParameter("@d",BusinessType),
                new SqlParameter("@e",visitdate),
                 new SqlParameter("@f",visitby),
                 new SqlParameter("@g",ExpAmt),
                    new SqlParameter("@h",ExpRDate),
                    
                    new SqlParameter("@i",ExpIntRate),
                    
                    new SqlParameter("@j",Bank),
                    
                    new SqlParameter("@k",ReceivedAmt),
                    
                    new SqlParameter("@l",Probability),
                    
                    new SqlParameter("@m",remarks),
                    new SqlParameter("@n",status),
                    new SqlParameter("@o",CreatedBy)
                    
        };

        return DAO.IUD(param, @"insert into PipeLineDeposit 
                       (BranchCode,ReferenceNo,Name,DepositType,VisitDate,VisitBy,
                        ExpectedAmt,ExpRDate,ExpIntRate,Bank,RecivedAmt,Probability,Remarks,Status,CreatedOn,CreatedBy)                                                                                                                                                                                                           
                       values(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l,@m,@n,GETDATE(),@o)", CommandType.Text);
    }

    public DataTable PDCreateRefNo(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",branchcode)
        };
        DataTable dt = DAO.GetTable(param, "sp_PDCreateReferenceNo", CommandType.StoredProcedure);
        return dt;
    }

    public DataTable GetDetailByRefNo(string ReferenceNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",ReferenceNo)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,'BranchCode'=BT.BranchCode+':'+' '+BT.BranchName,
                        Name,R.DepositType,R.VisitDate,R.VisitBy,R.ExpectedAmt,R.RecivedAmt,R.ExpRDate,R.ExpIntRate,
                        R.Bank,R.Probability,R.CreatedOn,R.Status,
                        
                        'CreatedBy'=(select FullName from UserTable where R.CreatedBy=Email)
                        
                        FROM dbo.PipeLineDeposit R(NOLOCK),dbo.BranchTable BT(NOLOCK),UserTable U(NOLOCK)

                        WHERE R.BranchCode=BT.BranchCode and R.ReferenceNo=@a", CommandType.Text);
        return dt;
    }

    public DataTable GetRefnoByNameD(string name, string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",name),
             new SqlParameter("@b",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,BranchCode,Name,DepositType
                        
                        FROM dbo.PipeLineDeposit

                        WHERE UPPER(Name) like '%' + (@a) + '%' OR LOWER(Name) LIKE '%' + (@a) + '%' AND BranchCode=CASE WHEN @b='000' THEN BranchCode ELSE @b END", CommandType.Text);
        return dt;
    }

    public DataTable GetRefnoByBranchD(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            
             new SqlParameter("@b",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT ReferenceNo,BranchCode,Name,DepositType
                        
                        FROM dbo.PipeLineDeposit

                        WHERE BranchCode=CASE WHEN @b='000' THEN BranchCode ELSE @b END", CommandType.Text);
        return dt;
    }

    public DataTable GetDReportALLD()
    {

        DataTable dt = DAO.GetTable(null, @"
                        SELECT BranchCode,ReferenceNo,CONVERT(VARCHAR(Max),Name) AS Name,DepositType,replace(convert(varchar,convert(Money, ExpectedAmt),1),'.00','') AS ExpectedAmt,Probability,CONVERT(NVARCHAR(max),CreatedOn,101) AS CreatedOn,Status FROM dbo.PipeLineDeposit 
                        ORDER BY BranchCode", CommandType.Text);
        return dt;
    }

    public DataTable GetReportByBranchD(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            
             new SqlParameter("@b",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT BranchCode,ReferenceNo,CONVERT(VARCHAR(Max),Name) AS Name,DepositType,replace(convert(varchar,convert(Money, ExpectedAmt),1),'.00','') AS ExpectedAmt,
                        Probability,CONVERT(NVARCHAR(max),CreatedOn,101) AS CreatedOn,Status FROM dbo.PipeLineDeposit 
                        Where BranchCode= @b", CommandType.Text);
        return dt;
    }
}