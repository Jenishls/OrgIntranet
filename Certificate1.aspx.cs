using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Drawing.Imaging;

public partial class Certificate1 : System.Web.UI.Page
{
    DBUserTableT dut = new DBUserTableT();
    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Session["UserId"].ToString();
        //string username = Session["FullName"].ToString();
        DataTable dt = dut.GetCertificate(userid);
        
        lblName.Text = dt.Rows[0]["FullName"].ToString();
        //lblBranch.Text = dt.Rows[0]["BranchName"].ToString();
        lblGrade.Text = dt.Rows[0]["Grade"].ToString();
        lblSubject.Text = dt.Rows[0]["sname"].ToString();
        lblDate.Text =Convert.ToDateTime( dt.Rows[0]["EDate"]).ToString("MM/dd/yyyy");
            
    }
    //protected void btnExporttoimage_Click(object sender, EventArgs e)
    //{
    //    string base64 = Request.Form[hdnImageData.UniqueID].Split(',')[1];
    //    byte[] IMGbytes = Convert.FromBase64String(base64);

    //    Response.Clear();
    //    Response.ContentType = "image/png";
    //    Response.AddHeader("Content-Disposition", "attachment; filename=HTML.png");
    //    Response.Buffer = true;
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    Response.BinaryWrite(IMGbytes);
    //    Response.End();

    //}
}