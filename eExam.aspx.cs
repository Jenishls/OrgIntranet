using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class eExam : System.Web.UI.Page
{
    DBBranchTable bt = new DBBranchTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (System.DateTime.UtcNow.ToLocalTime().Hour >= 15 || System.DateTime.UtcNow.ToLocalTime().Hour <= 9)
            {
                string branchcode = Session["BranchCode"].ToString();
                DataTable dt = bt.GetBranchByBranchCode(branchcode);
                string branchname = dt.Rows[0]["BranchName"].ToString();
                string username = Session["FullName"].ToString();
                string designation = Session["Designation"].ToString();
                string level = Session["Level"].ToString();
                lblName.Text = username + " " + "(" + branchname + "-" + branchcode + ")";
               
                if(branchcode=="000")
                { 
                DataTable dt1 = bt.GetAllDepartments();
                ddlDepartment.DataSource = dt1;
                ddlDepartment.DataValueField = "Department";
                ddlDepartment.DataTextField = "Department";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, "Choose One");
                ddlDepartment.Items.Remove("Branch");
                }
                else
                {
                    ddlDepartment.Items.Add("Branch");
                }
                lblposition.Text = designation;
                //ddlFPosition.Items.Insert(0, "Choose One");

                string branch ="";
                DataTable dt3 = bt.SelectedBranch();
                foreach(DataRow dr in dt3.Rows)
                {
                    if (branchcode == dr["BranchCode"].ToString())
                        branch = branchcode;
                }
                string userid = Session["UserId"].ToString();
                DataTable dt2 = bt.GetAllSubjects(level,branch,userid);
                ddlSubjects.DataSource = dt2;
                ddlSubjects.DataValueField = "sid";
                ddlSubjects.DataTextField = "sname";
                ddlSubjects.DataBind();
                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC KEEP','Please wait till 3:00 pm.');</script>");
                pnlExam.Visible = false;
                return;
               
            }

        }
    }
    public bool HasBlocked(string user)
    {
        string query = string.Format("SELECT * FROM dbo.OTexams WHERE UserId='{0}' AND examstatus=1", user);
        DataTable dt = DAO.GetTable(query);
        if (dt.Rows.Count > 0)
            return true;
        return false;
    }
    public bool HasRemaningExam(string user)
    {
        string query = string.Format("SELECT * FROM dbo.OTexams WHERE UserId='{0}' AND examstatus=2", user);
        DataTable dt = DAO.GetTable(query);
        if (dt.Rows.Count > 0)
            return true;
        return false;
    }
    protected void btnStart_Click(object sender, EventArgs e)
    {
        string level = Session["Level"].ToString();
        string username = Session["FullName"].ToString();
        string sid = ddlSubjects.SelectedItem.Value;
        string user = Session["UserId"].ToString();
        DateTime mindate = DateTime.UtcNow;
        DataTable dt = bt.GetMinDate(user, sid);
        if(dt.Rows.Count>0)
        { 
         mindate =Convert.ToDateTime(dt.Rows[0]["StartDate"].ToString());
        }
        
        DateTime now = DateTime.UtcNow;
        int days = (now.Date - mindate.Date).Days;
        Page.Validate("a");
        if(Page.IsValid)
        {
            if(days <90)
            { 
            if(HasBlocked(user))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC KEEP','Your examintion has been blocked please contact administrator.');</script>");
                return;
            }
            else if (HasRemaningExam(user))
            {
                LoadPrevious();
            }
            else
                StartNew();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC KEEP','Your 4 Weeks completed for this Subject. Try another Subject if available!');</script>");
                return;
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC KEEP','" + username + " <br /> <br />  You are not allowed to attempt this test. <br /> <br /> Please wait till next notice.');</script>");
            return;
        }
        
        
    }
    internal void LoadPrevious()
    {
        String sid, sname, userid;
        sid = ddlSubjects.SelectedItem.Value;
        sname = ddlSubjects.SelectedItem.Text;
        userid = Session["UserId"].ToString();
        Examination exam = new Examination(userid, Int32.Parse(sid), sname);
        var currentexam = exam.GetPreviousExam(userid);
        Session["Timer"] = currentexam.runningtime;
        Session["CurrentExam"] = currentexam;
        Session["isNew"] = 0; 
        exam.GetPrevious(currentexam.examid);
        Session.Add("questions", exam);
        Response.Redirect("ProExamination.aspx");
    }
    internal void StartNew()
    {
        String sid, sname, userid;

        sid = ddlSubjects.SelectedItem.Value;
        sname = ddlSubjects.SelectedItem.Text;
        userid = Session["UserId"].ToString();

        Examination exam = new Examination(userid, Int32.Parse(sid), sname);

        DataTable dt = exam.GetCount(userid, sid);

        int count = Convert.ToInt32(dt.Rows[0]["Count"].ToString());
        Session["isNew"] = 1;
        if (count < 4)
        {
            int i = exam.Atmt(sid, userid);
            var currentexam = exam.InsertExam(exam);
            Session["CurrentExam"] = currentexam;
            exam.GetQuestions();
            foreach(Question question in exam.questions )
            {
                
                DAO.IUD(String.Format(@"INSERT INTO dbo.OTExamQuestion(examid,questionid)VALUES( {0},{1} )",currentexam.examid,question.qid));
            }
            Session.Add("questions", exam);
            Response.RedirectPermanent("ProExamination.aspx", true);
        }
        else
        {
//            string Alert = "You have already attend this exam for 4 times" + "\\n" + "Subject" + ":" + sname + "\\n" + "Please try Next Subject if available";
//            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','" + Alert + @"', function(){
//                alertify.message('OK');
//              });</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC KEEP','You have already attend this test for 4 times <br /> Please try Next Subject if available.');</script>");
            return;
        }
    }
    
   
}

 