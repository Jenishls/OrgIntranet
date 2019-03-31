using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

public class Examination
{
    public int SIZE = 40;
    public string userid;
    public int sid;
    public String sname;
    public int ncans;
    public List<Question> questions;
    public List<QofDay> qofday;
    public DateTime StartTime;
    public int curpos = 0;
    public int time = 2700;
    public int examid;
  
    //public int time = 2700;
    
    public Examination(string userid, int sid, String sname)
    {
        this.userid = userid;
        this.sid = sid;
        this.sname = sname;
        StartTime = DateTime.Now;
    }

    public void GetPrevious(int examid)
    {
        DataTable dt = DAO.GetTable(string.Format("select * from OTExamQuestion where examid = {0}",examid));
        DataTable question =new DataTable();
        questions = new List<Question>();
        if(dt.Rows.Count>0)
        {
            foreach(DataRow dr in dt.Rows)
            {
               question=DAO.GetTable(string.Format("select qid,question,ans1,ans2,ans3,ans4,cans from OTquestions where qid ={0}", dr["questionid"].ToString()));
               if (question.Rows.Count>0)
                {
                    Question q = new Question(question.Rows[0]["question"].ToString(), question.Rows[0]["ans1"].ToString(), question.Rows[0]["ans2"].ToString(), question.Rows[0]["ans3"].ToString(), question.Rows[0]["ans4"].ToString(), question.Rows[0]["cans"].ToString(), (int)question.Rows[0]["qid"]);
                    q.answer  = dr["ans"].ToString();
                    questions.Add(q);
                }
               question.Clear();
            }
        }
    }

    public void GetQuestions()
    {
        // get questions from OE_QUESTIONS table
        SqlConnection con = new SqlConnection(DAO.ConnectionStr );
        SqlDataAdapter da = new SqlDataAdapter("select qid,question,ans1,ans2,ans3,ans4,cans from OTquestions where sid = " + sid,con);
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
            for( int i = 0; i < pos ; i ++)
                if (num == positions[i]) { found = true; break; }

            if (!found)
            {   positions[pos] = num;
                pos++;
            }
        } // end of for

        // load data from DataSet into Question Objects
        questions = new List<Question>();
        DataRow dr;
        Question q;
        foreach (int pos in positions)
        {
            dr = ds.Tables[0].Rows[pos];
            q = new Question(dr["question"].ToString(), dr["ans1"].ToString(), dr["ans2"].ToString(), dr["ans3"].ToString(), dr["ans4"].ToString(), dr["cans"].ToString(),Convert.ToInt32(dr["qid"]));
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
    public Exam GetPreviousExam(string userid)
    {

        SqlConnection con = new SqlConnection(DAO.ConnectionStr);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select examid,UserId,sid,noq,nocans,stdate,enddate,examstatus,runningtime from OTexams where examstatus=@examstatus and UserId=@userid";
        cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = userid;
        cmd.Parameters.Add("@examstatus", SqlDbType.Int).Value = 2;
        SqlDataReader dr = cmd.ExecuteReader();
        Exam currentExam = new Exam();
        if (dr.Read())
        {
            currentExam.examid = Convert.ToInt32(dr["examid"]);
            currentExam.sid = Convert.ToInt32(dr["sid"]);
            currentExam.examstatus = 1;
            currentExam.userid = dr["UserId"].ToString();
            currentExam.runningtime = Convert.ToInt32(dr["runningtime"].ToString());
            currentExam.noofQuestion = this.SIZE;
        }
        dr.Close();
        dr.Dispose();
        DAO.IUD("update OTexams set examstatus=1 where examid=" + currentExam.examid);
        con.Close();
        return currentExam;
    }
    public DataTable GetCount(string UserId, string ExamId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",UserId),
             new SqlParameter("@b",ExamId)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT COUNT(*) AS Count FROM dbo.OTExamAtmt WHERE ExamId=@b AND UserId=@a", CommandType.Text);
        return dt;
    }
    
    public int Atmt(string ExamId, string UserId )
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",ExamId),
             new SqlParameter("@b",UserId)
        };

        return DAO.IUD(param, @"insert into OTExamAtmt 
                       (ExamId,UserId,AtmtDate)                                                                                                                                                                                                           
                     values(@a,@b,GETDATE())", CommandType.Text);
    }

    public DataTable GetCertificate(string UserId, string ExamId)
    {
        SqlParameter[] param = new SqlParameter[]
        {
             new SqlParameter("@a",UserId),
             new SqlParameter("@b",ExamId)
        };
        DataTable dt = DAO.GetTable(param, @"
        SELECT TOP 1 UserId,sid,nocans,enddate FROM dbo.OTexams WHERE UserId=@
        ORDER BY enddate DESC", CommandType.Text);
        return dt;
    }
    
   
} // end of Class
