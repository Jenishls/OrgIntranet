using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

/// <summary>
/// Summary description for Vendor
/// </summary>
public class BLLVendor
{
	public BLLVendor()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable GetAllVendor()
    {
        SqlParameter[] param = new SqlParameter[]
        {
            
        };
              DataTable dt = DAO.GetTable(param, @"
                    SELECT * from Vendor where IsDeleted = 0 order by Id DESC", CommandType.Text);
        return dt;
    }

    public int insertVendor(String Name, String Address, String PAN, String Type, String CreatedBy)
    {
        SqlParameter[] param = new SqlParameter[]
        {
           new SqlParameter("@Name",Name),
             new SqlParameter("@Address",Address),
              new SqlParameter("@PAN",PAN),
              new SqlParameter("@Type",Type),
              new SqlParameter("@CreatedBy",CreatedBy),
        };
        return DAO.IUD(param, "insert into Vendor(Name, Address, PAN, Type,CreatedBy) values(@Name, @Address,@PAN,@Type,@CreatedBy)", CommandType.Text);
    }

}