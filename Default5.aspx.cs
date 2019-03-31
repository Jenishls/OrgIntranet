using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;

public partial class Default5 : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/Manuals/");
        if (!IsPostBack)
        {
            DirectoryInfo di = new DirectoryInfo(path);
            FileInfo[] fi = di.GetFiles().OrderByDescending(p => p.CreationTime).ToArray(); 


            foreach (FileInfo file in fi)
            {               
                ListBox1.Items.Add(file.Name);                
            }
           
        }
    }
   
    protected void ListBox1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/Manuals/");
        WebClient client = new WebClient();
        Byte[] buffer = client.DownloadData(path + ListBox1.SelectedValue);
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-length", buffer.Length.ToString());
        Response.BinaryWrite(buffer);               
    }

}