using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RiskIndicator
/// </summary>
public class RiskIndicator
{
    public String question;
    public String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9, ans10, answer, cans;
    public string qid;

    public string Qid
    {
        get { return qid; }
    }
    public String QuestionText
    {
        get { return question; }
    }

    public String Answer1
    {
        get { return ans1; }
    }

    public String Answer2
    {
        get { return ans2; }
    }

    public String Answer3
    {
        get { return ans3; }
    }

    public String Answer4
    {
        get { return ans4; }
    }

    public String Answer5
    {
        get { return ans5; }
    }
    public String Answer6
    {
        get { return ans6; }
    }
    public String Answer7
    {
        get { return ans7; }
    }
    public String Answer8
    {
        get { return ans8; }
    }
    public String Answer9
    {
        get { return ans9; }
    }
    public String Answer10
    {
        get { return ans10; }
    }

    public String CorrectAnswer
    {
        get { return cans; }
    }

    public String YourAnswer
    {
        get { return answer; }
    }








    public RiskIndicator(String indicator, String ans1, String ans2, String ans3, String ans4, String ans5, String ans6, String ans7, String ans8, String ans9, String ans10, String qid)
	{
        this.question = question;
        this.ans1 = ans1;
        this.ans2 = ans2;
        this.ans3 = ans3;
        this.ans4 = ans4;
        this.ans5 = ans5;
        this.ans6 = ans6;
        this.ans7 = ans7;
        this.ans8 = ans8;
        this.ans9 = ans9;
        this.ans10 = ans10;
        this.qid = qid;
	}
}