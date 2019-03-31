using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class HRCircular : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    
 
     protected void BindGridview()
    {
        //DataTable dt = new DataTable();
        //dt.Columns.Add(new DataColumn("Date", typeof(DateTime)));

        string[] filesLoc = Directory.GetFiles(Server.MapPath("~/Uploads/"));
        string d = Directory.GetCreationTime(Server.MapPath("~/Uploads/")).ToString("yyyy-MM-dd/HH:mm:ss");
        List<ListItem> files = new List<ListItem>();
        foreach (string file in filesLoc )
        {
            files.Add(new ListItem(Path.GetFileName(file)));
            //files.Add(new ListItem(d));
            
        }
        gvFiles.DataSource = files;
        gvFiles.DataBind();
    }
    protected void GetFiles(object sender, EventArgs e)
    {
        
        BindGridview();
    }

}
