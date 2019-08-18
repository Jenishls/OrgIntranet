using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CircualarMain : System.Web.UI.Page
{

    BLLCircular bll = new BLLCircular();
    private int checkForReview = 0;
    private int checkSendMail = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadGridView();

        string status = Session["Status"].ToString();

        if (status != "Admin" )
        {
        //    FileUpload1.Visible = false;
            createCircular.Visible = false;
            CircularSave.Visible = false;
        }

    }


    protected void CircularSave_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            CircularSave.Visible = false;
            string fileName = DateTime.Now.ToFileTime() + FileUpload1.FileName;
            FileUpload1.PostedFile
                .SaveAs(Server.MapPath("~/Uploads/") + fileName);

            BLLCircular bll = new BLLCircular();
           
            int a = bll.insertCircular(Int32.Parse(lbYear.Text), drpCircularType.Text, lbCircularNo.Text, lbSubject.Text, fileName, Session["UserId"].ToString(), checkForReview);
            String typo = "";
            if (drpCircularType.Text == "A")
                typo = "Administration Circular";
            else
                typo = "Office Instruction Memo";

            if (checkSendMail == 1) {
                sendMail(typo);
            }

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
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (checkForReview == 0)
        {
            checkForReview = 1;
        }
        else
        {
            checkForReview = 0;
        }
    }

    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (checkSendMail == 0)
        {
            checkSendMail = 1;
        }
        else
        {
            checkSendMail = 0;
        }
    }

    public void sendMail(string typo) 
    {
        String body = "Dear All," +
                            Environment.NewLine + "Please find the " + typo + " No.: " + lbCircularNo.Text + " regarding '" + lbSubject.Text + "' for your necessary information and implementation in http://10.10.5.2/Circular.aspx " +
                            Environment.NewLine + "" +
                            Environment.NewLine + "" +

                            Environment.NewLine + "With Regards," +
                            Environment.NewLine + "Human Resource Department" +
                            Environment.NewLine + "Head Office" +
                            Environment.NewLine + "Contact: 01-4246991" +
                            Environment.NewLine + "Fax: 01-4244936";


        String status = bll.SendMail(lbSubject.Text, body);
    }
}