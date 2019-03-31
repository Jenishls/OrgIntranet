using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBOpRiskAssess
/// </summary>
public class DBOpRiskAssess
{
	public DBOpRiskAssess()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int CreateOpRiskAssess(string BranchCode, string Year, string Month,decimal TotalRWE,
        string A1, string A2, string A3, string A4,
        string B1, string B2, string B3, string B4, string B5,
        string C1, string C2, string C3, string C4, string C5, string C6,
        string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8,
        string E1, string E2, string E3, string E4, string E5, string E6, string E7, string E8,
        string F1, string F2, string F3, string F4, string F5, string F6, string F7,
        string G1, string G2, 
        string H1, string H2, string H3, string H4, string H5, string H6,
        string I1, string I2, string I3,
        string J1, string J2,
        string K1, string K2,
        string CreatedBy, string Status, string OpId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",BranchCode),
             new SqlParameter("@b",Year),
              new SqlParameter("@c",Month),
               new SqlParameter("@d",TotalRWE),
                    new SqlParameter("@A1",A1),
                    new SqlParameter("@A2",A2),
                    new SqlParameter("@A3",A3),
                    new SqlParameter("@A4",A4),
                    //new SqlParameter("@A5",A5),
                        new SqlParameter("@B1",B1),
                        new SqlParameter("@B2",B2),
                        new SqlParameter("@B3",B3),
                        new SqlParameter("@B4",B4),
                        new SqlParameter("@B5",B5),
                    new SqlParameter("@C1",C1),
                    new SqlParameter("@C2",C2),
                    new SqlParameter("@C3",C3),
                    new SqlParameter("@C4",C4),
                    new SqlParameter("@C5",C5),
                    new SqlParameter("@C6",C6),
                    //new SqlParameter("@C7",C7),
                        new SqlParameter("@D1",D1),
                        new SqlParameter("@D2",D2),
                        new SqlParameter("@D3",D3),
                        new SqlParameter("@D4",D4),
                        new SqlParameter("@D5",D5),
                        new SqlParameter("@D6",D6),
                        new SqlParameter("@D7",D7),
                        new SqlParameter("@D8",D8),
                    new SqlParameter("@E1",E1),
                    new SqlParameter("@E2",E2),
                    new SqlParameter("@E3",E3),
                    new SqlParameter("@E4",E4),
                    new SqlParameter("@E5",E5),
                    new SqlParameter("@E6",E6),
                    new SqlParameter("@E7",E7),
                    new SqlParameter("@E8",E8),
                        new SqlParameter("@F1",F1),
                        new SqlParameter("@F2",F2),
                        new SqlParameter("@F3",F3),
                        new SqlParameter("@F4",F4),
                        new SqlParameter("@F5",F5),
                        new SqlParameter("@F6",F6),
                        new SqlParameter("@F7",F7),
                    new SqlParameter("@G1",G1),
                    new SqlParameter("@G2",G2),
                        new SqlParameter("@H1",H1),
                        new SqlParameter("@H2",H2),
                        new SqlParameter("@H3",H3),
                        new SqlParameter("@H4",H4),
                        new SqlParameter("@H5",H5),
                        new SqlParameter("@H6",H6),
                    new SqlParameter("@I1",I1),
                    new SqlParameter("@I2",I2),
                    new SqlParameter("@I3",I3),
                        new SqlParameter("@J1",J1),
                        new SqlParameter("@J2",J2),
                    new SqlParameter("@K1",K1),
                    new SqlParameter("@K2",K2),
                        new SqlParameter("@w",CreatedBy),
                        new SqlParameter("@x",Status),
                        new SqlParameter("@y",OpId)
        };

        return DAO.IUD(param, @"insert into OpRiskAssess 
                       (BranchCode,Year,Month,TotalRWE,
                        A1,A2,A3,A4,
                        B1,B2,B3,B4,B5,
                        C1,C2,C3,C4,C5,C6,
                        D1,D2,D3,D4,D5,D6,D7,D8,
                        E1,E2,E3,E4,E5,E6,E7,E8,
                        F1,F2,F3,F4,F5,F6,F7,
                        G1,G2,
                        H1,H2,H3,H4,H5,H6,
                        I1,I2,I3,
                        J1,J2,
                        K1,K2,
                        CreatedBy,CreatedOn,Status,OpId)                                                                                                                                                                                                           
                     values(@a,@b,@c,@d,
                        @A1,@A2,@A3,@A4,
                        @B1,@B2,@B3,@B4,@B5,
                        @C1,@C2,@C3,@C4,@C5,@C6,
                        @D1,@D2,@D3,@D4,@D5,@D6,@D7,@D8,
                        @E1,@E2,@E3,@E4,@E5,@E6,@E7,@E8,
                        @F1,@F2,@F3,@F4,@F5,@F6,@F7,
                        @G1,@G2,
                        @H1,@H2,@H3,@H4,@H5,@H6,
                        @I1,@I2,@I3,
                        @J1,@J2,
                        @K1,@K2,
                        @w,GETDATE(),@x,@y)", CommandType.Text);
    }

    public DataTable GetRestMonth(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
       
        DataTable dt = DAO.GetTable(param, @"SELECT Month FROM dbo.Month WHERE Month NOT IN (SELECT Month FROM dbo.OpRiskAssess WHERE Year=2075 and BranchCode=@a)", CommandType.Text);
        return dt;
    }

    public DataTable GetAllPendingOpRiskBranchWise(string branch)
    {

        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                    SELECT R.OpId,
                    'BranchName'=R.BranchCode + ':'+(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
                    Year,Month,
                    'Status'=Case when R.Status='P' then 'Pending'
		                     when R.Status='A' then 'Approved'
		                     when R.Status='R' then 'Rejected'
                             else 'UnKnown' end,
                    'Wighted'=R.TotalRWE,
					'RiskLevel'=CASE WHEN R.TotalRWE<='6' THEN 'Inherent Risk Level'
			                        WHEN R.TotalRWE BETWEEN '6.01' AND '12' THEN 'Low Risk Level'
			                        WHEN R.TotalRWE BETWEEN '12.01' AND '20' THEN 'Medium Risk Level'
			                        WHEN R.TotalRWE BETWEEN '20.01' AND '30' THEN 'High Risk Level'
			                        WHEN R.TotalRWE >30 THEN 'Catastrophic Risk Level' END
                    
                    FROM dbo.OpRiskAssess R(NOLOCK),UserTable U(NOLOCK)
                    WHERE R.CreatedBy=U.Email AND R.BranchCode=@a
                    and R.Status in('A','P') order by CreatedOn ASC", CommandType.Text);
                            return dt;
    }
    
    public DataTable GetAllPendingOpRiskProvinceWise(string branch)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",branch)
        };
        DataTable dt = DAO.GetTable(param, @"
                    SELECT R.OpId,
                    'BranchName'=R.BranchCode + ':'+(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
                    Year,Month,
                    'Status'=Case when R.Status='P' then 'Pending'
		                     when R.Status='A' then 'Approved'
		                     when R.Status='R' then 'Rejected'
                             else 'UnKnown' end,
                    'Wighted'=R.TotalRWE,
					'RiskLevel'=CASE WHEN R.TotalRWE<='6' THEN 'Inherent Risk Level'
			                        WHEN R.TotalRWE BETWEEN '6.01' AND '12' THEN 'Low Risk Level'
			                        WHEN R.TotalRWE BETWEEN '12.01' AND '20' THEN 'Medium Risk Level'
			                        WHEN R.TotalRWE BETWEEN '20.01' AND '30' THEN 'High Risk Level'
			                        WHEN R.TotalRWE >30 THEN 'Catastrophic Risk Level' END
                    
                    FROM dbo.OpRiskAssess R(NOLOCK),UserTable U(NOLOCK)
                    WHERE R.CreatedBy=U.Email AND 
                    R.BranchCode in (select BranchCode from BranchTable where Province = (select Province from BranchTable where BranchCode = @a))
                    and R.Status in('A','P') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }

    public DataTable GetAllPendingOpRisk()
    {

       
        DataTable dt = DAO.GetTable(null, @"
                    SELECT R.OpId,
                    'BranchName'=R.BranchCode + ':'+(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
                    Year,Month,
                    'Status'=Case when R.Status='P' then 'Pending'
		                     when R.Status='A' then 'Approved'
		                     when R.Status='R' then 'Rejected'
                             else 'UnKnown' end,
                    'Wighted'=R.TotalRWE,
					'RiskLevel'=CASE WHEN R.TotalRWE<='6' THEN 'Inherent Risk Level'
			                        WHEN R.TotalRWE BETWEEN '6.01' AND '12' THEN 'Low Risk Level'
			                        WHEN R.TotalRWE BETWEEN '12.01' AND '20' THEN 'Medium Risk Level'
			                        WHEN R.TotalRWE BETWEEN '20.01' AND '30' THEN 'High Risk Level'
			                        WHEN R.TotalRWE >30 THEN 'Catastrophic Risk Level' END
                    
                    FROM dbo.OpRiskAssess R(NOLOCK),UserTable U(NOLOCK)
                    WHERE R.CreatedBy=U.Email
                    and R.Status in('A','P') order by CreatedOn ASC", CommandType.Text);
        return dt;
    }

    public DataTable GetAllApprovedOpRisk()
    {


        DataTable dt = DAO.GetTable(null, @"
                    SELECT R.OpId,R.BranchCode,
                    'BranchName'=(SELECT BranchName FROM dbo.BranchTable B WHERE R.BranchCode=B.BranchCode),
                    Year,Month,
                    'Status'=Case when R.Status='P' then 'Created/Pending'
		                     when R.Status='A' then 'Approved'
		                     when R.Status='R' then 'Rejected'
                             else 'UnKnown' end,
                    'CreatedBy'=U.FullName,
                    CreatedOn 
                    FROM dbo.OpRiskAssess R(NOLOCK),UserTable U(NOLOCK)
                    WHERE R.CreatedBy=U.Email
                    and R.Status='A' order by CreatedOn ASC", CommandType.Text);
        return dt;
    }

    public DataTable GetFileByOpId(string OpId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",OpId)
        };
        DataTable dt = DAO.GetTable(param, @"
                        SELECT R.OpId,BT.BranchCode,BT.BranchName,
                        [Year],[Month],
                        'TotalRWE'=R.TotalRWE,
                        'RiskLevel'=CASE WHEN R.TotalRWE<='6' THEN 'Inherent Risk Level'
			                        WHEN R.TotalRWE BETWEEN '6.01' AND '12' THEN 'Low Risk Level'
			                        WHEN R.TotalRWE BETWEEN '12.01' AND '20' THEN 'Medium Risk Level'
			                        WHEN R.TotalRWE BETWEEN '20.01' AND '30' THEN 'High Risk Level'
			                        WHEN R.TotalRWE >30 THEN 'Catastrophic Risk Level' END, 
                        'Status'=Case when R.Status='P' then 'Created/Pending'
		                         when R.Status='A' then 'Approved'
		                         when R.Status='R' then 'Rejected'
		                         end,

                        'CreatedBy'=(select FullName from UserTable where R.CreatedBy=Email),
                        CreatedOn,
                        'Approved/RejectedBy'=(select FullName from UserTable where R.ApprovedBy=Email),
                        R.ApprovedOn
                        FROM dbo.OpRiskAssess R(NOLOCK),dbo.BranchTable BT(NOLOCK),UserTable U(NOLOCK)
                        WHERE R.BranchCode=BT.BranchCode 
                        AND R.BranchCode=U.BranchCode
                        AND R.OpId=@a", CommandType.Text);
                                return dt;
    }

    public DataTable GetFileByOpIdAll(string OpId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",OpId)
        };


        DataTable dt = DAO.GetTable(param, @"
                        SELECT *
                        INTO #Temp
                        FROM dbo.OpRiskAssess
                        UNPIVOT (
                            value FOR RId IN (A1,A2,A3,A4,B1,B2,B3,B4,B5,C1,C2,C3,C4,C5,C6,
	                        D1,D2,D3,D4,D5,D6,D7,D8,E1,E2,E3,E4,E5,E6,E7,E8,
                        F1,F2,F3,F4,F5,F6,F7,G1,G2,H1,H2,H3,H4,H5,H6,I1,I2,I3,J1,J2,K1,K2 )
                        ) unpiv

                        SELECT T.OpId,R.RiskIndicators, T.RId,T.BranchCode,T.[Year],T.[Month], T.value,
						'Option'=T.value /(SELECT R.Weight FROM dbo.RiskIndicators R WHERE T.RId=R.RId) 
                        INTO #Temp1
						FROM #Temp T INNER JOIN dbo.RiskIndicators R ON R.RId= T.RId
                        WHERE T.OpId=@a

						SELECT T.RId ,RiskIndicators,MAX(O.SelectedText) AS Selected,T.value AS Score 
						FROM #Temp1 T INNER JOIN dbo.OpRiskValue O ON T.RId=O.RId
						AND O.TextValue = T.[Option]
						GROUP BY T.RId ,RiskIndicators,T.value
						
						

                        ORDER BY 1,2,3,4

                        DROP TABLE #Temp,#Temp1
                        ", CommandType.Text);
        return dt;
    }

    public int ApproveOpRiskAssess(string BranchCode, string OpId, string ApprovedBy, string StatusTo)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@OpId",OpId),
              new SqlParameter("@ApprovedBy",ApprovedBy),
                 new SqlParameter("@StatusTo",StatusTo)
        };

        return DAO.IUD(param, "sp_ApproveOpRiskAssess", CommandType.StoredProcedure);
    }

    public int DeleteOpRiskAssess(string BranchCode, string OpId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@OpId",OpId)
              
        };

        return DAO.IUD(param, "sp_DeleteOpRiskAssess", CommandType.StoredProcedure);
    }

    public DataTable GetReportAll(string BranchCode, string Year, string Month, string RId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@Year",Year),
             new SqlParameter("@Month",Month),
             new SqlParameter("@RId",RId)
             
        };


        DataTable dt = DAO.GetTable(param, @"
                        SELECT *
                        INTO #Temp
                        FROM dbo.OpRiskAssess
                        UNPIVOT (
                            value FOR RId IN (A1,A2,A3,A4,B1,B2,B3,B4,B5,C1,C2,C3,C4,C5,C6,
	                        D1,D2,D3,D4,D5,D6,D7,D8,E1,E2,E3,E4,E5,E6,E7,E8,
                        F1,F2,F3,F4,F5,F6,F7,G1,G2,H1,H2,H3,H4,H5,H6,I1,I2,I3,J1,J2,K1,K2 )
                        ) unpiv

                        SELECT R.RiskIndicators, T.RId,T.BranchCode,T.[Year],T.[Month], T.value,
						'Option'=T.value /(SELECT R.Weight FROM dbo.RiskIndicators R WHERE T.RId=R.RId) 
                        INTO #Temp1
						FROM #Temp T INNER JOIN dbo.RiskIndicators R ON R.RId= T.RId
                        WHERE T.RId=CASE WHEN UPPER(@RId)='ALL' THEN T.RId ELSE @RId END 
                        AND T.BranchCode=CASE WHEN UPPER(@BranchCode)='ALL' THEN T.BranchCode ELSE @BranchCode END
                        AND T.Year = CASE WHEN UPPER(@Year)='ALL' THEN T.Year ELSE @Year END
                        AND T.Month = CASE WHEN UPPER(@Month)='ALL' THEN T.Month ELSE @Month END

						SELECT T.BranchCode,Year,Month, T.RId ,RiskIndicators,MAX(O.SelectedText) AS Selected,T.value AS Score 
						FROM #Temp1 T INNER JOIN dbo.OpRiskValue O ON T.RId=O.RId
						AND O.TextValue = T.[Option]
						GROUP BY T.BranchCode,Year,Month,T.RId ,RiskIndicators,T.value
						
						

                        ORDER BY 1,2,3,4

                        DROP TABLE #Temp,#Temp1
                        ", CommandType.Text);
        return dt;
    }

    public DataTable GetReportProvince(string BranchCode, string Year, string Month, string RId, string BranchCodeUser)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@BranchCode",BranchCode),
             new SqlParameter("@Year",Year),
             new SqlParameter("@Month",Month),
             new SqlParameter("@RId",RId),
             new SqlParameter("@BranchCodeUser",BranchCodeUser)
        };


        DataTable dt = DAO.GetTable(param, @"
                        SELECT *
                        INTO #Temp
                        FROM dbo.OpRiskAssess
                        UNPIVOT (
                            value FOR RId IN (A1,A2,A3,A4,B1,B2,B3,B4,B5,C1,C2,C3,C4,C5,C6,
	                        D1,D2,D3,D4,D5,D6,D7,D8,E1,E2,E3,E4,E5,E6,E7,E8,
                        F1,F2,F3,F4,F5,F6,F7,G1,G2,H1,H2,H3,H4,H5,H6,I1,I2,I3,J1,J2,K1,K2 )
                        ) unpiv

                        SELECT R.RiskIndicators, T.RId,T.BranchCode,T.[Year],T.[Month], T.value,
						'Option'=T.value /(SELECT R.Weight FROM dbo.RiskIndicators R WHERE T.RId=R.RId) 
                        INTO #Temp1
						FROM #Temp T INNER JOIN dbo.RiskIndicators R ON R.RId= T.RId
                        WHERE T.RId=CASE WHEN UPPER(@RId)='ALL' THEN T.RId ELSE @RId END 
                        AND T.BranchCode=CASE WHEN UPPER(@BranchCode)='ALL' THEN T.BranchCode ELSE @BranchCode END
                        AND T.Year = CASE WHEN UPPER(@Year)='ALL' THEN T.Year ELSE @Year END
                        AND T.Month = CASE WHEN UPPER(@Month)='ALL' THEN T.Month ELSE @Month END

						SELECT T.BranchCode,Year,Month, T.RId ,RiskIndicators,MAX(O.SelectedText) AS Selected,T.value AS Score 
						FROM #Temp1 T INNER JOIN dbo.OpRiskValue O ON T.RId=O.RId
						AND O.TextValue = T.[Option]
                        WHERE T.BranchCode in (select BranchCode From BranchTable where Province = (select Province from BranchTable where BranchCode = @BranchCodeUser))
						GROUP BY T.BranchCode,Year,Month,T.RId ,RiskIndicators,T.value
						
						

                        ORDER BY 1,2,3,4

                        DROP TABLE #Temp,#Temp1
                        ", CommandType.Text);
        return dt;
    }
}