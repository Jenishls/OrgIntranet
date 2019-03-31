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
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            LoadGridView();
        }


        string usertype = Session["Status"].ToString();

        if (usertype != "Admin" && usertype != "HR")
        {
            FileUpload1.Visible = false;
            Button1.Visible = false;
        }


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = FileUpload1.FileName;
            FileUpload1.PostedFile
                .SaveAs(Server.MapPath("~/Uploads/") + fileName);
        }

        LoadGridView();
    }

    private void LoadGridView()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("File");
        dt.Columns.Add("Date");
        dt.Columns.Add("Type");


        foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Uploads")))
        {
            FileInfo fi = new FileInfo(strfile);
            dt.Rows.Add(fi.Name, fi.CreationTime.ToString(),
                GetFileTypeByExtension(fi.Extension));


        }


        GridView1.DataSource = dt;
        GridView1.DataBind();
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
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename="
            + e.CommandArgument);
        Response.TransmitFile(Server.MapPath("~/Uploads/")
            + e.CommandArgument);
        Response.End();
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




    public SortDirection dir { get; set; }
}