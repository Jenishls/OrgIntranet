using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class MisReports : System.Web.UI.Page
{
    UserTable ut = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    { 
        if(!IsPostBack)
        { 
        ddlrpt.Items.Insert(0, "Choose Report");
        }
        pnlALL.Visible = false;
        pnlDeptPending.Visible = false;
        btnExportToExcel.Visible = false;
    }
    protected void GetFile_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        
        {

            string username = Session["UserId"].ToString();
            string Command = @"SELECT R.BranchCode,ReferenceNo,LoanType,
                            'F.Limit'=Limit,'N.Limit'=NLimit,LoanName,
                            'Status'=Case when R.Status='C' then 'Created/Initialized'
		                             when R.Status='A' then 'Approved'
		                             when R.Status='R' then 'Rejected'
		                             when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                     else 'UnKnown' end,
                            
                            'ApprovedBy'=(select UserId from UserTable where [Approved/RejectedBy]=Email),
                            [Approved/RejectedOn],
                            'LastForwardedBy'=(select UserId from UserTable where R.LastForwardedBy=Email),
                            CreatedOn,LastForwardedOn ,Nature 
                            FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)
                            WHERE R.CreatedBy=U.Email
                            
                            AND R.BranchCode=CASE WHEN @BranchCode='ALL' THEN R.BranchCode ELSE @BranchCode END
                            AND [CreatedOn] Between @SDate AND @EDate 
                            Order By 2,1";
                            
            //and R.Status in('A','R') 
            //and (select UserId from UserTable where R.LastForwardedTo=Email)=@Name
            //string Command = "Select BranchCode,ReferenceNo,LoanName,Limit,LastForwardedBy,LastForwardedTo,CreatedOn from TraceFile where LastForwardedTo =@Name order by 1,2";
            SqlCommand cmd = new SqlCommand(Command, con);

            //cmd.Parameters.AddWithValue("@Name", username);
            cmd.Parameters.AddWithValue("@BranchCode", TextBox1.Text);
            cmd.Parameters.AddWithValue("@SDate", TextBox2.Text);
            cmd.Parameters.AddWithValue("@EDate", TextBox3.Text);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            btnExportToExcel.Visible = true;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TraceFile.aspx");

    }
   
    protected void GetPending_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        //using (DAO.GetConnection())
        {

            string username = Session["UserId"].ToString();
            string Command = @"SELECT R.BranchCode,ReferenceNo,
                            'F.Limit'=Limit,'N.Limit'=NLimit,LoanName,
                            'Status'=Case when R.Status='C' then 'Created/Initialized'
		                             when R.Status='A' then 'Approved'
		                             when R.Status='R' then 'Rejected'
		                             when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                     else 'UnKnown' end,
                            'LastForwardedTo'=(select UserId from UserTable where R.LastForwardedTo=Email),
                            'LastForwardedBy'=(select UserId from UserTable where R.LastForwardedBy=Email),
                            LastForwardedOn,
                            CreatedOn 
                            FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)

                            WHERE R.CreatedBy=U.Email
                            
                            AND R.BranchCode=CASE WHEN @BranchCode='ALL' THEN R.BranchCode ELSE @BranchCode END
                            AND LastForwardedOn Between @SDate AND @EDate 
                            Order By 2,1";

           // and R.Status NOT IN ('A','R') 

            //and (select UserId from UserTable where R.LastForwardedTo=Email)=@Name
            //string Command = "Select BranchCode,ReferenceNo,LoanName,Limit,LastForwardedBy,LastForwardedTo,CreatedOn from TraceFile where LastForwardedTo =@Name order by 1,2";
            SqlCommand cmd = new SqlCommand(Command, con);

            //cmd.Parameters.AddWithValue("@Name", username);
            cmd.Parameters.AddWithValue("@BranchCode", TextBox1.Text);
            cmd.Parameters.AddWithValue("@SDate", TextBox2.Text);
            cmd.Parameters.AddWithValue("@EDate", TextBox3.Text);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            btnExportToExcel.Visible = true;
        }
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
       
        Response.ClearContent();
       
        Response.AppendHeader("content-disposition", "attachment; filename=Approved/Pending.xls");
        
        Response.ContentType = "application/excel";
       
        System.IO.StringWriter stringWriter = new System.IO.StringWriter();
       
        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

       
        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

        
        foreach (TableCell tableCell in GridView1.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }

       
        foreach (GridViewRow gridViewRow in GridView1.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }

        GridView1.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void ddlrpt_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = ut.GetAllDepartments();
        if(ddlrpt.SelectedValue=="Approved/Pending All")
        {
            pnlALL.Visible = true;
            
        }
        else if (ddlrpt.SelectedValue == "Pending-Department Wise")
        {
            pnlDeptPending.Visible = true;
            ddldept.DataSource = dt;
            ddldept.DataValueField = "Department";
            ddldept.DataTextField = "Department";
            ddldept.DataBind();
            ddldept.Items.Insert(0, "Choose Department");
            
        }
    }

    private void GetpendingByDept()
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        
        {

            string dept = ddldept.SelectedValue;

            string Command = @"SELECT R.BranchCode,ReferenceNo,
                            'F.Limit'=Limit,'N.Limit'=NLimit,LoanName,
                            'Status'=Case when R.Status='C' then 'Created/Initialized'
		                             when R.Status='A' then 'Approved'
		                             when R.Status='R' then 'Rejected'
		                             when R.Status like'F%' then 'Forwarded'+' '+'('+R.Status+')'
                                     else 'UnKnown' end,
                            'LastForwardedTo'=(select UserId from UserTable where R.LastForwardedTo=Email),
                            'LastForwardedBy'=(select UserId from UserTable where R.LastForwardedBy=Email),
							U.Department
                            FROM TraceFile R(NOLOCK),UserTable U(NOLOCK)

                            WHERE R.LastForwardedTo=U.Email
                            and R.Status NOT IN ('A','R')
                            AND U.Department NOT IN ('Branch','Admin','CEO','DCEO')
							AND U.Department =@Dept 
                            Order By LastForwardedOn";

            SqlCommand cmd = new SqlCommand(Command, con);
            cmd.Parameters.AddWithValue("@Dept", dept);
            con.Open();
            GridView2.DataSource = cmd.ExecuteReader();
            GridView2.DataBind();
            
        }
        
    }
    protected void ddldept_SelectedIndexChanged(object sender, EventArgs e)
    { 
       
        pnlDeptPending.Visible = true;
        GetpendingByDept();
        btnExportToExcel.Visible = true;
       
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment; filename=Pending.xls");

        Response.ContentType = "application/excel";

        System.IO.StringWriter stringWriter = new System.IO.StringWriter();

        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);


        GridView2.HeaderRow.Style.Add("background-color", "#FFFFFF");


        foreach (TableCell tableCell in GridView2.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }


        foreach (GridViewRow gridViewRow in GridView2.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }

        GridView2.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }
}