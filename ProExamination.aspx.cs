using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Threading;
using System.Threading.Tasks;

public partial class ProExamination : System.Web.UI.Page
{
    static int time = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((int)Session["isNew"] ==1)
            {
                Session["Timer"] = 1;
            }
            else
                remaining.Checked = true;
            DisplayQuestion();
        }
    }

   
    public void DisplayQuestion()
    {
        // get data from session object
        Examination e = (Examination)Session["questions"];
        if (time == 0)
            time = e.time;
        // display data
        lblSubject.Text = e.sname;
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
        lblCtime.Text = DateTime.Now.ToString();
        lblStime.Text = e.StartTime.ToString();

        Question q = e.questions[e.curpos];
        // display details of question
        question.InnerHtml = q.question;
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;

        answer.InnerHtml = q.qid.ToString();

        // reset all radio buttons
        //if(IsPostBack)
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;

        string ans = q.answer;
        if(!String.IsNullOrEmpty(ans))
        {
            switch(ans)
            {
                case "1":
                   rbAns1.Checked = true;
                    break;
                case "2":
                    rbAns2.Checked=true;
                    break;
                case "3":
                    rbAns3.Checked = true;
                    break;
                case "4":
                    rbAns4.Checked = true;
                    break;
                default:
                    rbAns4.Checked = false;
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
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
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
        eq.Save(new ExamQuestion { ExamId = currentExam.examid, QuestionId = q.qid, Answer = answer });
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }

    
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        
        Examination exam = (Examination)Session["questions"];
        exam.curpos--;
        Session.Add("questions", exam);
        DisplayQuestion();
        btnNext.Text = "Next";
    }
    
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (rbAns1.Checked == true || rbAns2.Checked == true || rbAns3.Checked == true || rbAns4.Checked == true) {
            answer.Visible = true;            
        }
        Task.Delay(5000);

            btnCancel.Visible = false;
            ProcessQuestion();
            Examination exam = (Examination)Session["questions"];
            
            if(remaining.Checked)
            {
                CheckAndDisplayRemaining(exam);
            }
            else if(exam.curpos == exam.SIZE-1)
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
    void CheckAndDisplayRemaining(Examination exam)
    {
        var remcount = exam.questions.Where(x => x.answer == "0" || x.answer == null || x.answer=="").Count();
        if (remcount==0){
            remaining.Checked = false;
            //exam.curpos = exam.SIZE
           // btnNext.Text = "Finish";
            int c = exam.questions.Where(x => x.cans == x.answer).Count();
            Exam currentexam = (Exam)Session["CurrentExam"];
            DAO.IUD(string.Format("UPDATE dbo.OTexams SET examstatus=0,enddate=GETDATE(),nocans={0} WHERE examid={1}",c,currentexam.examid));
           
            Response.RedirectPermanent("ExamResult.aspx", true);
            Session["CurrentExam"] = null;
            Session.Remove("questions");
            return;
        }
        if(exam.curpos==exam.SIZE-1 && remcount>0)
            remaining.Checked = true;
        if (remcount == 1 && remaining.Checked==false)  //1
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

    private bool HasRemainging(List<Question> que)
    {
        var rem = que.Where(x => x.answer=="0" ).ToList();
        
        if (rem == null || rem.Count <= 0)
            return false;
        return true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        
        Session.Remove("questions");
        
        Response.Redirect("Default.aspx");
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (Session["questions"] != null)
        {
            Exam currentexam = (Exam)Session["CurrentExam"];
            if (time == 0)
            {
                Examination exam = (Examination)Session["questions"];
                time = exam.time;
            }
            int running = (int)Session["Timer"];
            
            Session["Timer"] = running + 1;
            if (running % 10 == 0)
            {
                DAO.IUD(string.Format("update OTexams set runningtime ={0} where examid={1}", running,currentexam.examid));
                currentexam.runningtime = running;
            }
            if (time - running > 0)
            {
                litMsg.Text = DisplayClock(time - running);
            }
            else
            {
                Session["Timer"] = 1;
                Response.RedirectPermanent("Expiredpage.aspx", true);
            }
        }
    }

    private string DisplayClock(int p)
    {
        int min = p / 60;
        int sec = p - (min * 60);
        return String.Format("{0:00} : {1:00}", min, sec);
    }
}