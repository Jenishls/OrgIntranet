using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLProduct
/// </summary>
public class BLLProduct
{
	public BLLProduct()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetProductBycategoryid(int categoryid)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",categoryid)
        };
        return DAO.GetTable(param, "select *from ProductTable where CategoryId=@a", CommandType.Text);
    }
    public DataTable GetAllProduct()
    {
        return DAO.GetTable(null, "select *from ProductTable", CommandType.Text);
    }
    public DataTable GetTotalProductAndCategory()
    {
        return DAO42.GetTable(null, "SELECT BranchCode,'Balance'=SUM(Balance)  FROM Master WHERE Balance>0 AND AcType<'51'GROUP BY BranchCode ORDER BY 1", CommandType.Text);
    }
    
}