using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;

public partial class Profiling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //remaining.Checked = true;
        DisplayQuestion();
    }

    public void DisplayQuestion()
    {
        // get data from session object
        RiskProfiling e = (RiskProfiling)Session["questions"];


        RiskIndicator q = e.questions[e.curpos];
        // display details of question
        question.InnerHtml = q.question;
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;
        ans5.InnerHtml = q.ans5;
        ans6.InnerHtml = q.ans6;
        ans7.InnerHtml = q.ans7;
        ans8.InnerHtml = q.ans8;
        ans9.InnerHtml = q.ans9;
        ans10.InnerHtml = q.ans10;

        // reset all radio buttons
        //if(IsPostBack)
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;
        rbAns5.Checked = false;
        rbAns6.Checked = false;
        rbAns7.Checked = false;
        rbAns8.Checked = false;
        rbAns9.Checked = false;
        rbAns10.Checked = false;

        string ans = q.answer;
        if (!String.IsNullOrEmpty(ans))
        {
            switch (ans)
            {
                case "1":
                    rbAns1.Checked = true;
                    break;
                case "2":
                    rbAns2.Checked = true;
                    break;
                case "3":
                    rbAns3.Checked = true;
                    break;
                case "4":
                    rbAns4.Checked = true;
                    break;
                case "5":
                    rbAns5.Checked = true;
                    break;
                case "6":
                    rbAns6.Checked = true;
                    break;
                case "7":
                    rbAns7.Checked = true;
                    break;
                case "8":
                    rbAns8.Checked = true;
                    break;
                case "9":
                    rbAns9.Checked = true;
                    break;
                case "10":
                    rbAns10.Checked = true;
                    break;
                default:
                    rbAns10.Checked = false;
                    break;
            }
        }
        // disable and enable buttons
        if (e.curpos == 0)
            btnPrev.Enabled = false;
        else
            btnPrev.Enabled = true;

    }

    public void ProcessQuestion()
    {
        RiskProfiling exam = (RiskProfiling)Session["questions"];
        RiskIndicator q = exam.questions[exam.curpos];
        ExamQuestion eq = new ExamQuestion();
        Exam currentExam = (Exam)Session["CurrentExam"];
        String answer;
        // find out the answer and assign it to 
        if (rbAns1.Checked)
            answer = "1";
        else
            if (rbAns2.Checked)
                answer = "2";
            else
                if (rbAns3.Checked)
                    answer = "3";
                else
                    if (rbAns4.Checked)
                        answer = "4";
                    else
                        answer = "0";  // error
        q.answer = answer;
        //eq.Save(new ExamQuestion { ExamId = currentExam.examid, QuestionId = q.qid, Answer = answer });
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        RiskProfiling exam = (RiskProfiling)Session["questions"];
        exam.curpos--;
        Session.Add("questions", exam);
        DisplayQuestion();
        btnNext.Text = "Next";
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        btnCancel.Visible = false;
        ProcessQuestion();
        RiskProfiling exam = (RiskProfiling)Session["questions"];

        if (remaining.Checked)
        {
            CheckAndDisplayRemaining(exam);
        }
        else if (exam.curpos == exam.SIZE - 1)
        {
            CheckAndDisplayRemaining(exam);
        }
        else
        {
            exam.curpos++;
            if (exam.curpos == exam.SIZE - 1)
            {
                var rem = exam.questions.Where(x => x.answer == "0" || x.answer == null).Count();
                if (rem == 1) //1
                    btnNext.Text = "Finish";
            }
            Session.Add("questions", exam);
            DisplayQuestion();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("questions");

        Response.Redirect("Default.aspx");
    }

    void CheckAndDisplayRemaining(RiskProfiling exam)
    {
        var remcount = exam.questions.Where(x => x.answer == "0" || x.answer == null || x.answer == "").Count();
        if (remcount == 0)
        {
            remaining.Checked = false;
            //exam.curpos = exam.SIZE
            // btnNext.Text = "Finish";
            //int c = exam.indicators.Where(x => x.cans == x.answer).Count();
            //Exam currentexam = (Exam)Session["CurrentExam"];
            //DAO.IUD(string.Format("UPDATE dbo.OTexams SET examstatus=0,enddate=GETDATE(),nocans={0} WHERE examid={1}", c, currentexam.examid));

            Response.RedirectPermanent("ExamResult.aspx", true);
            Session["CurrentExam"] = null;
            Session.Remove("indicators");
            return;
        }
        if (exam.curpos == exam.SIZE - 1 && remcount > 0)
            remaining.Checked = true;
        if (remcount == 1 && remaining.Checked == false)  //1
        {
            btnNext.Text = "Finish"; //
            exam.curpos++;
            DisplayQuestion();
            return;
        }
        var remainingQuestion = exam.questions.Where(x => x.answer == "0" || String.IsNullOrEmpty(x.answer)).FirstOrDefault();
        exam.curpos = exam.questions.IndexOf(remainingQuestion);
        if (remcount <= 1)
        {
            btnNext.Text = "Finish";
        }
        else
            btnNext.Text = "Next";
        Session.Add("questions", exam);
        DisplayQuestion();
        //btnNext.Text = "Finish";

    }

    private bool HasRemainging(List<RiskIndicator> que)
    {
        var rem = que.Where(x => x.answer == "0").ToList();

        if (rem == null || rem.Count <= 0)
            return false;
        return true;
    }
}