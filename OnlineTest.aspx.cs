using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class OnlineTest : System.Web.UI.Page
{
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    public string listFilter = null;
    SqlConnection con;
    SqlCommand cmd;
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    DataTable dt;
    int correct_ans = 0;
    int wrong_ans = 0;
    int select_no = 0;
    int count = 0;
    public OnlineTest()
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["myconnection"].ToString();
        cmd = new SqlCommand();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        btnBack.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        if (!Page.IsPostBack)
        
        {
            //litMsg.Text = "Your Next Test will be start : " +
            //    DateTime.Now.Subtract(Convert.ToDateTime("04/05/2018 11:00:00"));
            Session["Timer"] = DateTime.Now.AddMinutes(3);
            loadgrid();
        }
        
    }

    private void loadgrid()
    {
        
        con.Open();
        cmd.CommandText = "select Top 5 * from [Question] ORDER BY NEWID()";
        cmd.Connection = con;
        SqlDataReader rd = cmd.ExecuteReader();
        GridView1.DataSource = rd;
        GridView1.DataBind();


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Up.Visible = false;
        Label1.Visible = false;
        btnSubmit.Visible = false;

        foreach(GridViewRow row in GridView1.Rows)
        {
            Label l1 = row.FindControl("QuestionId") as Label;
            RadioButton r1 = row.FindControl("ans1") as RadioButton;
            RadioButton r2 = row.FindControl("ans2") as RadioButton;
            RadioButton r3 = row.FindControl("ans3") as RadioButton;
            RadioButton r4 = row.FindControl("ans4") as RadioButton;
            if(r1.Checked)
            {
                select_no = 1;
            }
            else if(r2.Checked)
            {
                select_no = 2;
            }
            else if (r3.Checked)
            {
                select_no = 3;
            }
            else if (r4.Checked)
            {
                select_no = 4;
            }
            con.Close();
            check_number(l1.Text);
        }

        if (DateTime.Compare(DateTime.Now, DateTime.Parse(Session["Timer"].ToString())) < 3)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            btnBack.Visible = true;
            int a = Convert.ToInt32(correct_ans.ToString());
            int b = Convert.ToInt32(wrong_ans.ToString());
            Label1.Text = "Total Question :"+ " " + (a+b);
            Label1.ForeColor = System.Drawing.Color.Blue;
            Label2.Text = "Correct Answer :" + " " + correct_ans.ToString();
            Label2.ForeColor = System.Drawing.Color.Green;
            Label3.Text = "Wrong Answer :" + " " + wrong_ans.ToString();
            Label3.ForeColor = System.Drawing.Color.Red;
            
            
            
        }
        else
        {
            string Alert = "Ooops Time Expired" + "\\n" + "Please Navigate Online Test Again !!!";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
        }
        
    }

    private void check_number(string text)
    {
        con.Open();
        cmd.CommandText = "select * from [Question] where Question_Id=@qid" + count;
        cmd.Parameters.AddWithValue("@qid" + count, text);
        cmd.Connection = con;
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            if(select_no == Convert.ToInt32(rd["correct_ans"]))
            {
                correct_ans = correct_ans + 1;
            }
            else
            {
                wrong_ans = wrong_ans + 1;
            }
        }
        count++;
        con.Close();

    }
   
   protected void Timer1_Tick(object sender, EventArgs e)
       {
          if(DateTime.Compare(DateTime.Now,DateTime.Parse(Session["Timer"].ToString())) <0)
          {
              litMsg.ForeColor = System.Drawing.Color.Green;
              litMsg.Text = "Time Left : " + ((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString() + " "
                  + "Minute" + " " + (((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalSeconds) % 60).ToString() + " "
                  + "Seconds";
          }
       else
          {
              string Alert = "Ooopps Time Expired" + "\\n" + "Try Again !!!";
              ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
              //litMsg.ForeColor = System.Drawing.Color.Red;
              //litMsg.Text = "Time Expired";
              Response.Redirect("Default.aspx");
              //loadgrid();
          }
       
       }

   protected string GetID(object ob)
   {
       return DataBinder.Eval(ob, "Question_Id").ToString();
   }
   protected void btnBack_Click(object sender, EventArgs e)
   {
       if(IsPostBack)
       { 
       Response.Redirect("~/Default.aspx");
       }
   }
}