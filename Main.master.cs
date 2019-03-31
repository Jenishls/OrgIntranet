using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net;
using System.Globalization;
using System.Xml;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using System.Text;
public partial class Main : System.Web.UI.MasterPage
{
    BLLNews bnews = new BLLNews();
    DBBranchTable bt=new DBBranchTable();
    UserTable ut = new UserTable();
    Db ff = new Db();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMar.Text = "Welcome To NCC Bank Intranet";
        if (!IsPostBack)
        {
            loadPoll();
            
            //Repeater1.DataSource = bnews.GetAllTop3News();
            //Repeater1.DataBind();
            string branchcode=Session["BranchCode"].ToString();
            DataTable dt=bt.GetBranchByBranchCode(branchcode);
            string branchname=dt.Rows[0]["BranchName"].ToString();
            lblUserNameDisplay.Text = "Welcome," + " " + Session["FullName"].ToString()+" "+"("+branchname+" )";
            
            string usertype=Session["Status"].ToString();

            if (usertype != "Admin" && usertype != "System")
            {
                var menu = Page.Master.FindControl("Menu3") as Menu;
                if (menu != null)
                {
                    menu.Items.Remove(menu.FindItem("Admin"));
                    
                }
            }
            if (usertype != "HR" && usertype != "Admin")
            {

                var menu1 = Page.Master.FindControl("Menu3") as Menu;
                if (menu1 != null)
                {
                    menu1.Items.Remove(menu1.FindItem("HR Related"));
                    //menu1.Items.Remove(menu1.FindItem("News"));
                }

               
            }

            //var menu1 = Page.Master.FindControl("Menu1") as Menu;
            //if (menu1 != null)
            //{
            //    menu1.Items.Remove(menu1.FindItem("Reporting"));
            //    menu1.Items.Remove(menu1.FindItem("News"));
            //}

        }

    }
    protected void btnMore_Click(object sender, EventArgs e)
    {
        //foreach (RepeaterItem item in Repeater1.Items)
        //{
        //    var newsid = (Label)item.FindControl("lblNewsId");
        //    Response.RedirectPermanent("News.aspx?id=" + newsid);

        //}
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //Response.Redirect("~/Default.aspx");
        //Calendar1.Visible = true;
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsOtherMonth)
        {
            e.Day.IsSelectable = false;
            e.Cell.BackColor = System.Drawing.Color.LightGray;
        }
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Redirect("http://nccbank.com.np/forex");
        }
    }

  
    protected void btnIP_Click(object sender, EventArgs e)
    {
        lblIP.Visible = true;
        string IP = string.Empty;
        System.Web.HttpContext current = System.Web.HttpContext.Current;
        string IPAddress = current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (!string.IsNullOrEmpty(IPAddress))
        {
            string[] valAddress = IPAddress.Split(',');
            if (valAddress.Length != 0)
            {
                IP = valAddress[0];
            }
        }
        IP = current.Request.ServerVariables["REMOTE_ADDR"];
        lblIP.Text = IP;
        btnIP.Visible = false;
        //lblIP.Visible = true;
        //IPHostEntry host;
        //string localIP = "?";
        //host = Dns.GetHostEntry(Dns.GetHostName());
        //foreach (IPAddress ip in host.AddressList)
        //{
        //    if (ip.AddressFamily.ToString() == "InterNetwork")
        //    {
        //        localIP = ip.ToString();
        //        lblIP.Text = localIP;
        //        btnIP.Visible = false;
        //    }
        //}
    }
   
   
   
    private void loadPoll()
    {
        
        try
        {
            ListItem li;
            SqlCommand cmdques = ff.getCommand("sp_SelectQues");
            //cmdques.Parameters.AddWithValue();
            SqlDataReader drques = cmdques.ExecuteReader();
            if (drques.Read())
            {
                ltlQues.Text = drques["QText"].ToString();
                //ltlquesother.Text = drques["other"].ToString();
                quesid.Value = drques["QId"].ToString();
                ltlanscount.Text = "Total " + drques["Total"].ToString() + " Answered.";
                //ltlcans.Text = drques["CorrectAns"].ToString();
            }
            cmdques = ff.getCommand("sp_SelectAnsSet");
            cmdques.Parameters.AddWithValue("qid", quesid.Value.ToString());
            drques = cmdques.ExecuteReader();
            //add answers to RadioButtonList

            while (drques.Read())
            {
                li = new ListItem();
                li.Text = drques["AnsText"].ToString();
                li.Value = drques["Id"].ToString();
                RadioButtonList1.Items.Add(li);

            }
            ff.closeConnection();

        }
        catch (Exception ex)
        {
             Response.Redirect("~/Error.aspx?erroMsg=" + ex.Message.ToString().Replace("\n\r",""));
        }
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        if(RadioButtonList1.SelectedItem !=null)
        { 
        string uid = Session["UserId"].ToString();
        string qid = quesid.Value;
        DataTable dt = ff.getAnsweredUser(uid, qid);
        if(dt.Rows.Count>0)
        { 
        
        //Response.Redirect("DetailsQOfDay.aspx?qid=" + quesid.Value + "&ques=" + ltlQues.Text + "");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','You have already Answered this question.');</script>");
            
            return;
        }
        else
        {
            SqlCommand cmdans = ff.getCommand("sp_InsAnswerByUser");
            cmdans.Parameters.AddWithValue("@qid", qid);
            cmdans.Parameters.AddWithValue("@ansid", RadioButtonList1.SelectedItem.Value);
            cmdans.Parameters.AddWithValue("@uid", uid);
            //cmdans.Parameters.AddWithValue("@other", "");
            cmdans.ExecuteNonQuery();
            Response.Redirect("Default.aspx", false);
            ff.closeConnection();
        }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','Please Select Your Answer First.');</script>");

            return;
        }
    }

    private StringBuilder getdetails(string qid)
    {
        StringBuilder sb = new StringBuilder();
        SqlCommand cmd = ff.getCommand("sp_SelectResults");
        cmd.Parameters.AddWithValue("@qid", qid);
        SqlParameter sp = cmd.Parameters.Add("@b", SqlDbType.Int);
        sp.Direction = ParameterDirection.Output;
        cmd.ExecuteNonQuery();
        int total = int.Parse(cmd.Parameters["@b"].Value.ToString());
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = ff.getCorrectAns(qid);
        sb.Append("<table style='border:thin groove silver;height:25px;color:green;font-variant: normal;font-size: 8pt;line-height: normal;font-family: Arial;'>");
        //int =0;

        sb.Append("<tr >");
        sb.Append("<td colspan='3' style='background-color:#DDFFDD;height:25px;'>");
        sb.Append("Result-Question Of the Day");
        sb.Append("</td>");
        sb.Append("</tr>");

        
        while (dr.Read())
        {
            sb.Append("<tr>");
            sb.Append("<td style='border:thin groove silver; height:25px;'>");
            sb.Append(dr["AnsText"].ToString());
            sb.Append("</td>");
            sb.Append("<td style='border:thin groove silver;height:25px;'>");
            int widt = int.Parse(dr["AnsCount"].ToString()) * 100 / total;
            sb.Append(dr["AnsCount"].ToString() + " Answer");
            sb.Append("</td>");
            sb.Append("<td style='border:thin groove silver;height:25px;'>");
            sb.Append("" + widt + " %");
            sb.Append("</td>");
            sb.Append("</tr>");
        }
        sb.Append("<tr>");

        sb.Append("<td style='background-color:#DDFFDD;border:thin groove silver; height:25px;'>");
        sb.Append("Total");
        sb.Append("</td>");
        sb.Append("<td style='background-color:#DDFFDD;border:thin groove silver;text-align:center;height:25px;'>");
        sb.Append("" + total + " Answer");
        sb.Append("</td>");
        sb.Append("<td style='background-color:#DDFFDD;border:thin groove silver;text-align:center;height:25px;'>");
        sb.Append("");
        sb.Append("</td>");
        sb.Append("</tr>");
        sb.Append("<tr >");
        sb.Append("<td colspan='3' style='background-color:#DDFFDD;height:25px;'>");
        sb.Append("Correct Ans.:-" + " " + dt.Rows[0]["CorrectAns"].ToString());
        sb.Append("</td>");
        sb.Append("</tr>");
        sb.Append("</table>");
        
        return sb;
    }
   
    protected void btnResult_Click1(object sender, EventArgs e)
    {
        string uid = Session["UserId"].ToString();
        string qid = quesid.Value;
        DataTable dt = ff.getAnsweredUser(uid, qid);
        if (dt.Rows.Count > 0)
        { 
        question.Visible = false;
        result.Visible = true;
        this.Literal1.Text = getdetails(quesid.Value).ToString();
        ff.closeConnection();
        //Response.Redirect("QOfDayResult.aspx?qid=" + quesid.Value);
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", @"<script type='text/javascript'>alertify.alert('NCC Intranet','Please Submit Your Answer First To View Result.');</script>");

            return;
        }
        
        
    }
}
