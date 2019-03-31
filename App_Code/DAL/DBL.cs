using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class DBL
{
    static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
    private static  SqlCommand com = new SqlCommand();
    private static SqlDataAdapter da;

    /// <summary>
    /// Retrieves all field from dbo.Cat Table
    /// </summary>
    public static DataTable getCategory()
    {
        com = new SqlCommand {CommandText = "Select * from dbo.cat"};
        da = new SqlDataAdapter(com.CommandText, con.ConnectionString);
        var dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public static string addNewCategory(string tabName)
    {
        string _returnStatement = "";
        try
        {
            con.Open();
           
            com = new SqlCommand {CommandText = "create_new_ques_cat", CommandType = CommandType.StoredProcedure};
            com.Parameters.AddWithValue("@tabName", tabName);
            com.Parameters.Add(new SqlParameter()
            {
                Direction = ParameterDirection.Output,
                ParameterName = "@success",
                Value = false,
                SqlDbType = SqlDbType.Bit
            });
            com.Connection = con;
            com.ExecuteNonQuery();

            con.Close();
        }
        catch(SqlException sx)
        {
            _returnStatement = sx.Message;
        }
        finally
        {
            con.Close();
        }

        if (string.IsNullOrEmpty(_returnStatement) && (bool)com.Parameters["@success"].Value)
        {
            _returnStatement = "Successful";
        }

        return _returnStatement;
        
    }


}