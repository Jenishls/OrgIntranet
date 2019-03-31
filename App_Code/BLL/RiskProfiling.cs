using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

/// <summary>
/// Summary description for RiskProfiling
/// </summary>
public class RiskProfiling
{

    public int SIZE = 2;
    public string userid;
    public string sid;
    public String sname;
    public int ncans;
    public List<RiskIndicator> questions;
    public DateTime StartTime;
    public int curpos = 0;
    public int time = 2700;
    public int examid;
    public RiskProfiling(string userid, string rid, String sname)
    {
        this.userid = userid;
        this.sid = rid;
        this.sname = sname;
        StartTime = DateTime.Now;
    }

    

    public void GetQuestions()
    {
        // get questions from OE_QUESTIONS table
        SqlConnection con = new SqlConnection(DAO.ConnectionStr);
        SqlDataAdapter da = new SqlDataAdapter("Indicators,ans1,ans2,ans3,ans4,ans5,ans6,ans7,ans8,ans9,ans10 from ProfileIndicator", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "questions");
        int nquestions = ds.Tables[0].Rows.Count;

        // get N no. of random number
        Random r = new Random();
        int[] positions = new int[SIZE];
        int num;
        for (int pos = 0; pos < SIZE; )
        {
            num = Math.Abs(r.Next(nquestions));
            // check whether the number is already in the array
            bool found = false;
            for (int i = 0; i < pos; i++)
                if (num == positions[i]) { found = true; break; }

            if (!found)
            {
                positions[pos] = num;
                pos++;
            }
        } // end of for

        // load data from DataSet into Question Objects
        questions = new List<RiskIndicator>();
        DataRow dr;
        RiskIndicator q;
        foreach (int pos in positions)
        {
            dr = ds.Tables[0].Rows[pos];
            q = new RiskIndicator(dr["Indicators"].ToString(), dr["ans1"].ToString(), dr["ans2"].ToString(), dr["ans3"].ToString(), dr["ans4"].ToString(), dr["ans5"].ToString(),
                dr["ans6"].ToString(), dr["ans7"].ToString(), dr["ans8"].ToString(), dr["ans9"].ToString(), dr["ans10"].ToString(), dr["RId"].ToString());
            questions.Add(q);
        }

    } // end of GetQuestions()

    public Exam InsertExam(Examination exam)
    {

        SqlConnection con = new SqlConnection(DAO.ConnectionStr);
        con.Open();
        SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from OTexams", con);
        int examid = (Int32)cmd.ExecuteScalar();
        cmd.CommandText = "insert into OTexams(examid,UserId,sid,noq,nocans,stdate,enddate,examstatus)  values(@examid,@userid,@sid,@noq,@ncans,@stdate,getdate(),@examstatus)";
        cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = exam.userid;
        cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.Parameters.Add("@examstatus", SqlDbType.Int).Value = 1;
        cmd.ExecuteNonQuery();
        Exam currentExam = new Exam();
        currentExam.examid = examid;
        currentExam.sid = exam.sid;
        currentExam.examstatus = 1;
        currentExam.userid = exam.userid;
        currentExam.runningtime = 0;
        currentExam.noofQuestion = exam.SIZE;
        con.Close();
        return currentExam;
    }

    
}