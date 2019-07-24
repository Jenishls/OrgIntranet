using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CircualarMain : System.Web.UI.Page
{

    BLLCircular bll = new BLLCircular();

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadGridView();
    }


    protected void CircularSave_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = DateTime.Now.ToFileTime() + FileUpload1.FileName;
            FileUpload1.PostedFile
                .SaveAs(Server.MapPath("~/Uploads/") + fileName);

            BLLCircular bll = new BLLCircular();
            int a = bll.insertCircular(Int32.Parse(lbYear.Text), drpCircularType.Text, lbCircularNo.Text, lbSubject.Text, fileName, Session["UserId"].ToString());

            String body = "Dear All," +
                            Environment.NewLine + "Please find the " + lbSubject.Text + " for your necessary information and implementation in http://10.10.5.2/Circular.aspx " +
                            Environment.NewLine + "" +

                            Environment.NewLine + "" +

                            Environment.NewLine + "With Regards," +
                            Environment.NewLine + "Human Resource Department" +
                            Environment.NewLine + "Head Office" +
                            Environment.NewLine + "Contact: 01-4246991" +
                            Environment.NewLine + "Fax: 01-4244936";


            String status = bll.SendMail(lbSubject.Text, body);

            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert(' Circular has been uploaded and email has been sent to everyone@nccbank.com.np ');</script>");
            //lbOne.Text = a.ToString();
            Response.Redirect("~/CircularMain.aspx");
        }
        //LoadGridView();
    }

    private void LoadGridView()
    {
        CircularMainGridView.DataSource = bll.GetMainCircularList();
        CircularMainGridView.DataBind();
    }

    protected void CircularMainClick(Object sender, CommandEventArgs e)
    {
        Session["cirType"] = e.CommandName;
        Session["cirYear"] = e.CommandArgument;
        Response.Redirect("~/Circular.aspx");
       
    }
}