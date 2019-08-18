using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;


public partial class Circular : System.Web.UI.Page
{
    BLLCircular bll = new BLLCircular();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGridView1();
        }


        string usertype = Session["cirType"].ToString();
        //lbtest.Text = usertype;

        if (Session["cirType"].ToString() == "A") {
           //lbtest.Text = "Circular";
        }
        else
        {
            //lbtest.Text = "Office Instruction Memo";
        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
            lb.Attributes.Add("onclick", "return confirm('Are you sure to delete?')"); 
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)CircularGridView.Rows[e.RowIndex];
        //lbOne.Text = CircularGridView.DataKeys[e.RowIndex].Value.ToString();

        int i = bll.DeleteCircular(CircularGridView.DataKeys[e.RowIndex].Value.ToString());
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Circular has been deleted')", true);
        LoadGridView1();
        if (i > 0)
        {
            
            //ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('Deleted');</script>");
        }
       // Response.Redirect("~/Circular.aspx");
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        if (Session["Status"].ToString() == "Admin")
        {
            CircularGridView.Columns[3].Visible = true;
            CircularGridView.Columns[4].Visible = true;
        }
        else
        {
            CircularGridView.Columns[3].Visible = false;
            CircularGridView.Columns[4].Visible = false;
        }
    }

    private void LoadGridView1()
    {
        string type = Session["cirType"].ToString();
        string year = Session["cirYear"].ToString();
        CircularGridView.DataSource = bll.GetAllCircular(type, year);
        CircularGridView.DataBind();
    }
    
    //private string GetFileTypeByExtension(string fileExtension)
    //{
    //    switch (fileExtension.ToLower())
    //    {
    //        case ".docx":
    //        case ".doc":
    //            return "Microsoft Word Document";
    //        case ".xlsx":
    //        case ".xls":
    //            return "Microsoft Excel Document";
    //        case ".txt":
    //            return "Text Document";
    //        case ".jpg":
    //        case ".png":
    //        case ".gif":
    //            return "Image";
    //        case ".pdf":
    //            return "Adobe";
    //        default:
    //            return "Unknown";
    //    }
    //}
    //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    //Response.Clear();
    //    //Response.ContentType = "application/octet-stream";
    //    //Response.AppendHeader("Content-Disposition", "filename="
    //      //  + e.CommandArgument);
    //    //Response.TransmitFile(Server.MapPath("~/Uploads/")
    //     //   + e.CommandArgument);
    //    //Response.End();
    //}

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        //string sortingDirection = string.Empty;
        //if (dir == SortDirection.Ascending)
        //{
        //    dir = SortDirection.Descending;
        //    sortingDirection = "Desc";
        //}
        //else
        //{
        //    dir = SortDirection.Ascending;
        //    sortingDirection = "Asc";
        //}

        //DataView sortedView = new DataView();
        //sortedView.Sort = e.SortExpression + " " + sortingDirection;
        //GridView1.DataSource = sortedView;
        //GridView1.DataBind();        
    }

    protected void CircularClick(Object sender, EventArgs e)
    {
       
    }
    
    public SortDirection dir { get; set; }

    protected void circular_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id = CircularGridView.SelectedDataKey.Value.ToString();
        

        Panel3.Visible = false;
        Panel2.Visible = true;

        DataTable dt =  bll.CircularDetail(id);
        //while (record.Read())
        //{
        //    ReadSingleRow((IDataRecord)record);
        //}
        //Label3.Text = id;
        Label2.Text = "Circular No : " + dt.Rows[0]["CirNo"].ToString(); ;
        Label3.Text = "Subject : "+dt.Rows[0]["Subject"].ToString();
        if (dt.Rows[0]["CheckForReview"].ToString() == "1")
            LoadReviewList(id);
        else
        {
            GridView1.Visible = false;
            Label4.Visible = true;
        }
        
    }

    protected void LoadReviewList(string id)
    {


        GridView1.DataSource = bll.GetCircularReview(id);
        GridView1.DataBind();
    }

    protected void ReadSingleRow(IDataRecord record)
    {

    }
}