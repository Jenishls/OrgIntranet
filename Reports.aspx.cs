using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string DirectoryName = Request.MapPath("~/Image");
            if (Directory.Exists(DirectoryName))
            {
                String[] Files = Directory.GetFiles(DirectoryName);
                myRepeater.DataSource = Files;
                myRepeater.DataBind();
            }
        }
    }

    protected void myRepeater_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            LinkButton FileName = (LinkButton)e.Item.FindControl("FileName");
            String fullName = (String)e.Item.DataItem;
            FileName.Text = fullName.Substring(fullName.LastIndexOf("\\") + 1);
            FileName.CommandArgument = fullName.Substring(fullName.LastIndexOf("\\") + 1);
        }
    }
    protected void myRepeater_OnItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "GOTO")
        {
            
            //Response.Redirect("~/Image" + (String)e.CommandArgument);
        }
    }
    protected void FileName_Click(object sender, EventArgs e)
    {
        
    }
}