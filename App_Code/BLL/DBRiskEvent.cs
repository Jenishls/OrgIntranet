using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBRiskEvent
/// </summary>
public class DBRiskEvent
{
	public DBRiskEvent()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int CreateRiskEvent(string BranchCode, string refno, string ORT, string NOI, DateTime DOI, DateTime DIIF, string LOR, string BFI, decimal AIR, decimal POL, 
        decimal GOL_YTD, string NM, string RI, string ED, string ATTD, string FPRC, string lastforwardedto, string status, string createdby)
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
               new SqlParameter("@k",GOL_YTD),
                new SqlParameter("@l",NM),
                 new SqlParameter("@m",RI),
                  new SqlParameter("@n",ED),
                   new SqlParameter("@o",ATTD),
                  new SqlParameter("@p",FPRC),
                   new SqlParameter("@q",lastforwardedto),
                   new SqlParameter("@r",status),
                    new SqlParameter("@s",createdby),
                     //new SqlParameter("@t",createdon)
                   
                    //new SqlParameter("@u",lastforwardedon),
                    //new SqlParameter("@v",approvedby),
                    //new SqlParameter("@w",approvedon)
        };

        return DAO.IUD(param, @"insert into RiskEvent 
                       (BranchCode,ReferenceNo,ORT,NOI,DOI,DIIF,LOR,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,LastForwardedTo,Status,CreatedBy,CreatedOn)                                                                                                                                                                                                           
                     values(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l,@m,@n,@o,@p,@q,@r,@s,GETDATE())", CommandType.Text);
    }
    public DataTable GetAllRiskEvents()
    {
        DataTable dt = DAO.GetTable(null, @"
                        SELECT R.RiskId,'BranchCode'=BT.BranchCode+':'+' '+BT.BranchName,ReferenceNo,
                        'ORT'=RT.RiskType,'NOI'=NI.IncidentNature,DOI,DIIF,
                        'LOR'=RL.RiskLevelType,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,LastForwardedTo,Status,
                        CreatedBy,
                        CreatedOn
 
                        FROM RiskEvent R(NOLOCK),dbo.RiskLevel RL(NOLOCK),
                        dbo.OperationRiskType RT(NOLOCK),dbo.BranchTable BT(NOLOCK),
                        dbo.NatureOfIncident NI(NOLOCK)

                        WHERE R.BranchCode=BT.BranchCode
                        AND RT.RiskId=R.ORT
                        AND NI.IncidentId=R.NOI
                        AND RL.LevelId=R.LOR order by 1", CommandType.Text);
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
                        'LOR'=RL.RiskLevelType,BFI,AIR,POL,GOLYTD,NM,RI,ED,ATTD,FPRC,Status,
						'LastForwardedTo'=(select FullName from UserTable where R.LastForwardedTo=Email),
                        'CreatedBy'=(select FullName from UserTable where R.CreatedBy=Email),
                        CreatedOn,'NotedBy'=(select FullName from UserTable where R.ApprovedBy=Email),'NotedOn'=isnull(ApprovedOn,'')
                        FROM RiskEvent R(NOLOCK),dbo.RiskLevel RL(NOLOCK),
                        dbo.OperationRiskType RT(NOLOCK),dbo.BranchTable BT(NOLOCK),
                        dbo.NatureOfIncident NI(NOLOCK)

                        WHERE R.BranchCode=BT.BranchCode
                        AND RT.RiskId=R.ORT
                        AND NI.IncidentId=R.NOI
                        AND RL.LevelId=R.LOR AND R.RiskId=@a", CommandType.Text);
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

        return DAO.IUD(param,"sp_UpdateRiskEvent" , CommandType.StoredProcedure);
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

    public int NotedRiskEvent(string BranchCode, string ReferenceNo, string ApprovedBy, string StatusTo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",ReferenceNo),
              new SqlParameter("@ApprovedBy",ApprovedBy),
                 new SqlParameter("@StatusTo",StatusTo)
        };

        return DAO.IUD(param, "sp_NotedRiskEvent", CommandType.StoredProcedure);
    }

    public int ForwardRiskEvent(string BranchCode, string ReferenceNo, string LastForwadedBy, string StatusTo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@ReferenceNo",ReferenceNo),
              new SqlParameter("@ApprovedBy",LastForwadedBy),
                 new SqlParameter("@StatusTo",StatusTo)
        };

        return DAO.IUD(param, "sp_ForwardRiskEvent", CommandType.StoredProcedure);
    }
}