using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ExamQuestion
/// </summary>
public class ExamQuestion
{
    public int ExamId { get; set; }
    public int QuestionId { get; set; }
    public string Answer { get; set; }
	public ExamQuestion()
	{
		//
		// TODO: Add constructor logic here
		// 
	}

    public void Save( ExamQuestion eq)
    {
        string query = @"update OTExamQuestion set ans = @ans  where examid= @examid and questionid= @questionid";
        SqlParameter[] param = { 
                                new SqlParameter("@examid",eq.ExamId),
             new SqlParameter("@questionid",eq.QuestionId),
                  new SqlParameter("@ans",eq.Answer)
                               };
        DAO.IUD(param, query, System.Data.CommandType.Text);
        

    }
}

public class Exam
{
    public int examid { get; set; }
    public string userid { get; set; }
    public int sid { get; set; }
    public int noofQuestion { get; set; }
    public int runningtime { get; set; }
    public int examstatus { get; set; }
}