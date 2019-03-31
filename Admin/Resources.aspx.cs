using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Net;

public partial class Admin_Resources : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridview();
    }
    protected void BindGridview()
    {
        string path = Server.MapPath("~/Resources/Training/");
        if (!IsPostBack)
        {
            DirectoryInfo di = new DirectoryInfo(path);
            FileInfo[] fi = di.GetFiles().OrderByDescending(p => p.CreationTime).ToArray();
            //FileInfo[] fi = di.GetFiles().OrderBy(p => p.CreationTime).ToArray();

            foreach (FileInfo file in fi)
            {
                gvFiles.DataSource = fi;
                gvFiles.DataBind();
            }

        }
       
    }
    protected void gvFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        openfile();

    }
    private void openfile()
    {
        string path = Server.MapPath("~/Resources/Training/");
        WebClient client = new WebClient();
        Byte[] buffer = client.DownloadData(path + gvFiles.SelectedValue);
        Response.ContentType = "application/pdf";
        //Response.ContentType = "application/jpg";
        Response.AddHeader("content-length", buffer.Length.ToString());
        Response.BinaryWrite(buffer);
    }
}