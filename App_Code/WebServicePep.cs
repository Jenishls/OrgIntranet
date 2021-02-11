using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WebServicePep
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebServicePep : System.Web.Services.WebService {

    public WebServicePep () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetPepList(string prefix)
    {
        //var pepList = new List<Pep>();
        List<string> Users = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["myconnection"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
               // cmd.CommandText = "select Name, Address from PepList where " +
                //"Name like UPPER(@SearchText) + '%'";
                cmd.CommandText = "select top 20 Name as MatchedName ,'Self' as Relation, Name, Id from PepList where Name COLLATE SQL_Latin1_General_CP1_CI_AS like  @SearchText + '%' UNION select top 10 Father as MatchedName ,'Father' as Relation, Name, Id from PepList where Father COLLATE SQL_Latin1_General_CP1_CI_AS like @SearchText + '%' UNION select top 10 Mother as MatchedName ,'Mother' as Relation, Name, Id from PepList where Mother COLLATE SQL_Latin1_General_CP1_CI_AS like  @SearchText + '%' UNION select top 10 Son as MatchedName ,'Son' as Relation, Name, Id from PepList WHERE Son COLLATE SQL_Latin1_General_CP1_CI_AS like @SearchText + '%' UNION select top 10 Daughter as MatchedName ,'Daughter' as Relation, Name, Id from PepList WHERE Daughter COLLATE SQL_Latin1_General_CP1_CI_AS like  @SearchText + '%' UNION select top 10 Spouse as MatchedName ,'Spouse' as Relation, Name, Id from PepList WHERE Spouse COLLATE SQL_Latin1_General_CP1_CI_AS like  @SearchText + '%' order by Id";

                cmd.Parameters.AddWithValue("@SearchText", prefix);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        Users.Add(string.Format("{0}-{1}-{2}-{3}",sdr["Id"], sdr["Name"], sdr["MatchedName"], sdr["Relation"]) );
                        //Users.add('',sdr['MatchedName']);
                        //pepList.Add(new Pep { Id = sdr["Id"].ToString() , Name = sdr["Name"].ToString() , MatchedName = sdr["MatchedName"].ToString() , Relation = sdr["Relation"].ToString() });
                    }
                }
                conn.Close();
            }
            return Users.ToArray();
            //return pepList.ToArray();
         }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public String GetPepDetail(string prefix)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@prefix",prefix)
        };
        DataTable dt = DAO.GetTable(param, @"
                    SELECT * from PepList where Name = @prefix order by Id DESC", CommandType.Text);

        //return dt;
        return convertToJson(dt);
    }

   public string convertToJson(DataTable table) {  
        string JSONString=string.Empty;  
        JSONString = JsonConvert.SerializeObject(table);  
        return JSONString;  
    } 
    
}
