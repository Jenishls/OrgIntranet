using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using System.Configuration;

public partial class AddQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //if(btnUpload.Text=="Upload")
        //{ 
        int qid;
        String question;
        String ans1;
        String ans2;
        String ans3;
        String ans4;
        String cans;
        int sid;
        string path = Path.GetFileName(FileUpload1.FileName);
        path = path.Replace(" ", "");
        FileUpload1.SaveAs(Server.MapPath("~/Question/") + path);
        String ExcelPath = Server.MapPath("~/Question/") + path;
        OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
        mycon.Open();
        OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
        OleDbDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            // Response.Write("<br/>"+dr[0].ToString());
            qid = Convert.ToInt32(dr[0].ToString());
            question = dr[1].ToString();
            ans1 = dr[2].ToString();
            ans2 = dr[3].ToString();
            ans3 = dr[4].ToString();
            ans4 = dr[5].ToString();
            cans = dr[6].ToString();
            sid = Convert.ToInt32(dr[7].ToString());
            savedata(qid, question, ans1, ans2, ans3, ans4, cans, sid);
            System.IO.File.Delete(FileUpload1.FileName);

        }
        lblMsg.Text = "Data Has Been Saved Successfully";
        lblMsg.ForeColor = System.Drawing.Color.Green;
        
        //btnUpload.Text = "Show Data";
        
    }

    private void savedata(int qid1, String question1, String ans11, String ans12, String ans13, String ans14, String cans1, int sid1)
    {
        String query = "insert into OTquestions(qid,question,ans1,ans2,ans3,ans4,cans,sid) values(" + qid1 + ",'" + question1 + "','" + ans11 + "','" + ans12 + "','" + ans13 + "','" + ans14 + "','" + cans1 + "','" + sid1 + "')";
        //String mycon = "data source=IT2; initial Catalog=Intranet; Password=software; User ID=sa;";
        String mycon = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
    }
}