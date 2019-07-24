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
            //LoadGridView();
            LoadGridView1();
        }


        string usertype = Session["Status"].ToString();

        //if (usertype != "Admin" && usertype != "HR")
        //{
        //    FileUpload1.Visible = false;
        //    CircularSave.Visible = false;
        //}


    }


    //protected void CircularSave_Click(object sender, EventArgs e)
    //{
    //    if (FileUpload1.HasFile)
    //    {
    //        string fileName = DateTime.Now.ToFileTime()+FileUpload1.FileName;
    //        FileUpload1.PostedFile
    //            .SaveAs(Server.MapPath("~/Uploads/") + fileName);

    //        BLLCircular bll = new BLLCircular();
    //       int a = bll.insertCircular(Int32.Parse(lbYear.Text), drpCircularType.Text, lbCircularNo.Text, lbSubject.Text, fileName, Session["UserId"].ToString());

    //       String body = "Dear All," +
    //                       Environment.NewLine + "Please find the " + lbSubject.Text + " for your necessary information and implementation in http://10.10.5.2/Circular.aspx " +
    //                       Environment.NewLine + "" +

    //                       Environment.NewLine + "" +
                           
    //                       Environment.NewLine + "With Regards," +
    //                       Environment.NewLine + "Human Resource Department" +
    //                       Environment.NewLine + "Head Office" +
    //                       Environment.NewLine + "Contact: 01-4246991" +
    //                       Environment.NewLine + "Fax: 01-4244936";
                          

    //       String status = bll.SendMail(lbSubject.Text , body);
           
    //       ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert(' Circular has been uploaded and email has been sent to everyone@nccbank.com.np ');</script>");
    //       lbOne.Text = a.ToString();
    //       Response.Redirect("~/Circular.aspx");
    //    }
    //    //LoadGridView();
    //}

    //private void LoadGridView()
    //{
    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("File");
    //    dt.Columns.Add("Date");
    //    dt.Columns.Add("Type");
        
    //    foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Uploads")))
    //    {
    //        FileInfo fi = new FileInfo(strfile);
    //        dt.Rows.Add(fi.Name, fi.CreationTime.ToString(),
    //            GetFileTypeByExtension(fi.Extension));
    //    }
        
    //    GridView1.DataSource = dt;
    //    GridView1.DataBind();
    //}

    private void LoadGridView1()
    {
        string type = Session["cirType"].ToString();
        string year = Session["cirYear"].ToString();
        CircularGridView.DataSource =  bll.GetAllCircular(type, year);
        CircularGridView.DataBind();
    }
    
    private string GetFileTypeByExtension(string fileExtension)
    {
        switch (fileExtension.ToLower())
        {
            case ".docx":
            case ".doc":
                return "Microsoft Word Document";
            case ".xlsx":
            case ".xls":
                return "Microsoft Excel Document";
            case ".txt":
                return "Text Document";
            case ".jpg":
            case ".png":
            case ".gif":
                return "Image";
            case ".pdf":
                return "Adobe";
            default:
                return "Unknown";
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Response.Clear();
        //Response.ContentType = "application/octet-stream";
        //Response.AppendHeader("Content-Disposition", "filename="
          //  + e.CommandArgument);
        //Response.TransmitFile(Server.MapPath("~/Uploads/")
         //   + e.CommandArgument);
        //Response.End();
    }

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

        
}