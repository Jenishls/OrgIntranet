using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Label3.Text = Application["TotalOnlineUsers"].ToString();
        //Label5.Text = IP;
    }
 
    protected void btnUR_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserRelated.aspx");
    }
    protected void btnFTR_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminTracefile.aspx");
    }

     
}