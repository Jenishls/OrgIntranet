using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    BLLNews bn = new BLLNews();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                
                int i = Convert.ToInt32(Request.QueryString["id"].ToString());

                DataTable dt = bn.GetNewsByNewsId(i);
                lblNewsHeading.Text = dt.Rows[0]["Title"].ToString();
                lblNewsDate.Text =  dt.Rows[0]["Date"].ToString();
                    lblNewsContent.Text = dt.Rows[0]["Description"].ToString();
            }
        }
    }
}