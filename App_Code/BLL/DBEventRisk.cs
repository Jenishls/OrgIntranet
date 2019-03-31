using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLStudent
/// </summary>
public class DBEventRisk
{
	public DBEventRisk()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int CreateRiskEvent(string BranchCode, string refno, string ORT, string NOI, DateTime DOI, DateTime DIIF, string LOR,
        string BFI, decimal AIR, decimal POL, decimal GOLYTD, string NM, string RI, string ED, string ATTD, string FPRC, 
        string LastforwardedTo, string Status, string CreatedBy, string Remarks)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",ORT),
               new SqlParameter("@d",NOI),
                new SqlParameter("@e",DOI),
                 new SqlParameter("@f",DIIF),
                  new SqlParameter("@g",LOR),
                  new SqlParameter("@h",BFI),
             new SqlParameter("@i",AIR),
              new SqlParameter("@j",POL),
               new SqlParameter("@k",GOLYTD),
                new SqlParameter("@l",NM),
                 new SqlParameter("@m",RI),
                  new SqlParameter("@n",ED),
                   new SqlParameter("@o",ATTD),
                  new SqlParameter("@p",FPRC),
                   new SqlParameter("@q",LastforwardedTo),
                   new SqlParameter("@r",Status),
                    new SqlParameter("@s",CreatedBy),
                     new SqlParameter("@t",Remarks)
                   
                    //new SqlParameter("@u",lastforwardedon),
                    //new SqlParameter("@v",approvedby),
                    //new SqlParameter("@w",approvedon)
        };

        return DAO.IUD(param, @"insert into RiskEvent 
                       (BranchCode,ReferenceNo,ORT,NOI,DOI,DIIF,LOR,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,LastForwardedTo,Status,CreatedBy,CreatedOn,Remarks)                                                                                                                                                                                                           
                     values(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l,@m,@n,@o,@p,@q,@r,@s,GETDATE(),@t)", CommandType.Text);
    }

    public DataTable GetAllRiskEvents()
    {
        DataTable dt = DAO.GetTable(null, @"
        SELECT R.RiskId,'BranchCode'=BT.BranchCode,'BranchName'=BT.BranchName,ReferenceNo,
        'ORT'=RT.RiskType,'NOI'=NI.IncidentNature,DOI,DIIF,
        'LOR'=RL.RiskLevelType,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,LastForwardedTo,Status,
        (select FullName from UserTable where R.CreatedBy=Email) as CreatedBy,
        CONVERT(SMALLDATETIME, CreatedOn,103) AS CreatedOn
 
        FROM RiskEvent R(NOLOCK),dbo.RiskLevel RL(NOLOCK),
        dbo.OperationRiskType RT(NOLOCK),dbo.BranchTable BT(NOLOCK),
        dbo.NatureOfIncident NI(NOLOCK)

        WHERE R.BranchCode=BT.BranchCode
        AND RT.RiskId=R.ORT
        AND NI.IncidentId=R.NOI
        AND RL.LevelId=R.LOR order by 1", CommandType.Text);
                return dt;
    }

    public DataTable GetAllPendingRiskEventBranchWise(string branch)
    {

        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT ReferenceNo,R.BranchCode,
        'BranchName'=(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
        R.ORT,(SELECT N.IncidentNature FROM dbo.NatureOfIncident N WHERE R.NOI=N.IncidentId) AS NOI ,
        'Status'=Case when R.Status='C' then 'Created/Initialized'
		         when R.Status='N' then 'Approved'
		         when R.Status='R' then 'Rejected'
		         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                 else 'UnKnown' end,
        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
        'CreatedBy'=U.FullName,
        CreatedOn 
        FROM dbo.RiskEvent R(NOLOCK),UserTable U(NOLOCK)

        WHERE R.CreatedBy=U.Email and R.BranchCode=@a
        and R.Status not in('N','R') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }

    public DataTable GetAllPendingRiskEventProvinceWise(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT ReferenceNo,R.BranchCode,
        'BranchName'=(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
        R.ORT,(SELECT N.IncidentNature FROM dbo.NatureOfIncident N WHERE R.NOI=N.IncidentId) AS NOI ,
        'Status'=Case when R.Status='C' then 'Created/Initialized'
		         when R.Status='N' then 'Approved'
		         when R.Status='R' then 'Rejected'
		         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                 else 'UnKnown' end,
        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
        'CreatedBy'=U.FullName,
        CreatedOn 
        FROM dbo.RiskEvent R(NOLOCK),UserTable U(NOLOCK)

        WHERE R.CreatedBy=U.Email and
        R.BranchCode in (select BranchCode from BranchTable where Province = (select Province from BranchTable where BranchCode = @a)) 
        and R.Status not in('N','R') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }
    public DataTable GetAllApprovedRiskEvent()
    {
        DataTable dt = DAO.GetTable(null, @"
        SELECT ReferenceNo,R.BranchCode,
        (SELECT O.RiskType FROM dbo.OperationRiskType O where R.ORT=O.RiskId) AS ORT,
		(SELECT N.IncidentNature FROM dbo.NatureOfIncident N WHERE R.NOI=N.IncidentId) AS NOI,
		R.DOI,R.DIIF,
		(SELECT L.RiskLevelType FROM dbo.RiskLevel L WHERE R.LOR=L.LevelId) AS LOR,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,
        'Status'=Case when R.Status='C' then 'Created/Initialized'
		         when R.Status='N' then 'Noted'
		         when R.Status='R' then 'Rejected'
		         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                 else 'UnKnown' end,
        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
        'CreatedBy'=U.FullName,
        CreatedOn,Remarks
        FROM dbo.RiskEvent R(NOLOCK),UserTable U(NOLOCK)

        WHERE  R.CreatedBy=U.Email
        and R.Status in('N','R') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }
    
    public DataTable GetAllApprovedRiskEventBranchWise(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT ReferenceNo,R.BranchCode,
        (SELECT O.RiskType FROM dbo.OperationRiskType O where R.ORT=O.RiskId) AS ORT,
		(SELECT N.IncidentNature FROM dbo.NatureOfIncident N WHERE R.NOI=N.IncidentId) AS NOI,
		R.DOI,R.DIIF,
		(SELECT L.RiskLevelType FROM dbo.RiskLevel L WHERE R.LOR=L.LevelId) AS LOR,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,
        'Status'=Case when R.Status='C' then 'Created/Initialized'
		         when R.Status='N' then 'Noted'
		         when R.Status='R' then 'Rejected'
		         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                 else 'UnKnown' end,
        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
        'CreatedBy'=U.FullName,
        CreatedOn,Remarks
        FROM dbo.RiskEvent R(NOLOCK),UserTable U(NOLOCK)

        WHERE  R.CreatedBy=U.Email  and R.BranchCode=@a
        and R.Status in('N','R') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }

    public DataTable GetAllApprovedRiskEventProvinceWise(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT ReferenceNo,R.BranchCode,
        (SELECT O.RiskType FROM dbo.OperationRiskType O where R.ORT=O.RiskId) AS ORT,
		(SELECT N.IncidentNature FROM dbo.NatureOfIncident N WHERE R.NOI=N.IncidentId) AS NOI,
		R.DOI,R.DIIF,
		(SELECT L.RiskLevelType FROM dbo.RiskLevel L WHERE R.LOR=L.LevelId) AS LOR,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,
        'Status'=Case when R.Status='C' then 'Created/Initialized'
		         when R.Status='N' then 'Noted'
		         when R.Status='R' then 'Rejected'
		         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                 else 'UnKnown' end,
        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
        'CreatedBy'=U.FullName,
        CreatedOn,Remarks
        FROM dbo.RiskEvent R(NOLOCK),UserTable U(NOLOCK)

        WHERE  R.CreatedBy=U.Email  and
        R.BranchCode in (select BranchCode from BranchTable where Province = (select Province from BranchTable where BranchCode = @a))
        and R.Status in('N','R') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }
    public DataTable GetEventByRefNo(string ReferenceNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",ReferenceNo)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT ReferenceNo,'BranchCode'=BT.BranchCode,'BranchName'=BT.BranchName,
        (SELECT O.RiskType FROM dbo.OperationRiskType O where R.ORT=O.RiskId) AS ORT,
		(SELECT N.IncidentNature FROM dbo.NatureOfIncident N WHERE R.NOI=N.IncidentId) AS NOI,
        R.DOI,R.DIIF,
		(SELECT L.RiskLevelType FROM dbo.RiskLevel L WHERE R.LOR=L.LevelId) AS LOR,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,
        'Status'=Case when R.Status='C' then 'Created/Initialized'
		         when R.Status='N' then 'Noted'
		         when R.Status='R' then 'Rejected'
		         when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                 else 'UnKnown' end,
        'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
        'CreatedBy'=(select FullName from UserTable where R.CreatedBy=Email),
        CreatedOn,
        'NotedBy'=(select FullName from UserTable where R.ApprovedBy=Email),
        'NotedOn'=R.ApprovedOn
        FROM dbo.RiskEvent R(NOLOCK),dbo.BranchTable BT(NOLOCK),UserTable U(NOLOCK)

        WHERE R.BranchCode=BT.BranchCode and R.ReferenceNo=@a", CommandType.Text);
        return dt;
    }

    public DataTable GetEventHistory(string RefNo)
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
        from dbo.EventHistory R(NOLOCK)
        Where ReferenceNo=@RefNo order by 1 asc ", CommandType.Text);
        return dt;
    }

    public int ApproveRiskEvent(string BranchCode, string refno, string ApprovedBy, string Remarks, string StatusTo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",refno),
              new SqlParameter("@ApprovedBy",ApprovedBy),
                new SqlParameter("@Remarks",Remarks),
                 new SqlParameter("@StatusTo",StatusTo)
        };

        return DAO.IUD(param, "sp_NotedRiskEvent", CommandType.StoredProcedure);
    }
    public int ForwardRiskEvent(string BranchCode, string refno, string ForwardedBy, string ForwardedTo, string Remarks)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",refno),
              new SqlParameter("@ForwardedBy",ForwardedBy),
        new SqlParameter("@ForwardedTo",ForwardedTo),
                new SqlParameter("@Remarks",Remarks)
        };

        return DAO.IUD(param, "sp_ForwardRiskEvent", CommandType.StoredProcedure);
    }

    public DataTable GetEventByRefNoN(string ReferenceNo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",ReferenceNo)
        };
        DataTable dt = DAO.GetTable(param, "SELECT * from RiskEvent where ReferenceNo=@a", CommandType.Text);
        return dt;
    }

    public DataTable GetRiskEventsByRiskId(int riskid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",riskid)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT R.RiskId,'BranchCode'=BT.BranchCode+':'+' '+BT.BranchName,ReferenceNo,
        'ORT'=RT.RiskType,'NOI'=NI.IncidentNature,DOI,DIIF,
        'LOR'=RL.RiskLevelType,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,Status,LastForwardedTo,
        CreatedBy,
        CreatedOn  
        FROM RiskEvent R(NOLOCK),dbo.RiskLevel RL(NOLOCK),
        dbo.OperationRiskType RT(NOLOCK),dbo.BranchTable BT(NOLOCK),
        dbo.NatureOfIncident NI(NOLOCK)

        WHERE R.BranchCode=BT.BranchCode
        AND RT.RiskId=R.ORT
        AND NI.IncidentId=R.NOI
        AND RL.LevelId=R.LOR and R.RiskId=@a", CommandType.Text);
        return dt;
    }

    public int UpdateRiskEvent(int riskid, string BranchCode, string refno, string ORT, string NOI, DateTime DOI, DateTime DIIF,
       string LOR, string BFI, decimal AIR, decimal POL, decimal GOL_YTD, string NM, string RI, string ED, string ATTD, string FPRC, string lastforwardedto)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@z",riskid),
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",refno),
              new SqlParameter("@c",ORT),
               new SqlParameter("@d",NOI),
                new SqlParameter("@e",DOI),
                 new SqlParameter("@f",DIIF),
                  new SqlParameter("@g",LOR),
                  new SqlParameter("@h",BFI),
             new SqlParameter("@i",AIR),
              new SqlParameter("@j",POL),
               new SqlParameter("@k",GOL_YTD),
                new SqlParameter("@l",NM),
                 new SqlParameter("@m",RI),
                  new SqlParameter("@n",ED),
                   new SqlParameter("@o",ATTD),
                  new SqlParameter("@p",FPRC),
                   new SqlParameter("@q",lastforwardedto),
                   //new SqlParameter("@r",status),
                   // new SqlParameter("@s",createdby),
                   //  new SqlParameter("@t",createdon)
                   
                    //new SqlParameter("@u",lastforwardedon),
                    //new SqlParameter("@v",approvedby),
                    //new SqlParameter("@w",approvedon)
                    //(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l,@m,@n,@o,@p,@q,@z)
        };

        return DAO.IUD(param, "sp_UpdateRiskEvent", CommandType.StoredProcedure);
    }

    public DataTable GetRiskEventsByRiskIdN(int riskid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",riskid)
        };
        DataTable dt = DAO.GetTable(param, "SELECT * from RiskEvent where RiskId=@a", CommandType.Text);
        return dt;
    }
    public DataTable GetAllRiskType()
    {
        DataTable dt = DAO.GetTable(null, "Select * from OperationRiskType", CommandType.Text);
        return dt;
    }
    public DataTable GetRiskTypeById(int riskid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",riskid)
        };
        DataTable dt = DAO.GetTable(param, "Select * from OperationRiskType where RiskId=@a", CommandType.Text);
        return dt;
    }
    public DataTable GetAllNatureOfIncident()
    {
        DataTable dt = DAO.GetTable(null, "Select * from NatureOfIncident", CommandType.Text);
        return dt;
    }
    public DataTable GetNatureOfIncidentById(int incidentid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",incidentid)
        };
        DataTable dt = DAO.GetTable(param, "Select * from NatureOfIncident where IncidentId=@a", CommandType.Text);
        return dt;
    }
    public DataTable GetAllRiskLevel()
    {
        DataTable dt = DAO.GetTable(null, "Select * from RiskLevel", CommandType.Text);
        return dt;
    }
    public DataTable GetRiskLevelById(int levelid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",levelid)
        };
        DataTable dt = DAO.GetTable(param, "Select * from RiskLevel where LevelId=@a", CommandType.Text);
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


    public DataTable CreateRefNo(string branchcode)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",branchcode)
        };
        DataTable dt = DAO.GetTable(param, "sp_RCreateReferenceNo", CommandType.StoredProcedure);
        return dt;
    }
}