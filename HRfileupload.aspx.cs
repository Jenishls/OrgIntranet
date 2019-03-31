using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;

public partial class HRfileupload : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
           
            List<ListItem> files = new List<ListItem>();
            foreach (string filePath in filePaths)
            {
                files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                
            }
            GridView1.DataSource = files;
            GridView1.DataBind();
        }

    }

    private string SendMail(string Sender, string Receiver, string Subject, string Body)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(Receiver);
            mailMessage.From = new MailAddress(Sender);
            mailMessage.Subject = Subject;
            mailMessage.Body = Body;
            SmtpClient smtpClient = new SmtpClient("192.168.100.2");
            smtpClient.Send(mailMessage);
            return ("E-mail sent!");
        }
        catch (Exception ex)
        {
            return ("Could not send the e-mail - error: " + ex.Message);
        }
    }


    protected void UploadFile(object sender, EventArgs e)
    {
        string msender = Session["username"].ToString();
                //string ForwardedTo = txtForwardTo.Text;
               
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string Subject = "New Circular:" + "For Fiscal Yr. 2074-75:" ;
                   // string Attachment = Path.GetFullPath(FileUpload1.PostedFile.FileName);
                    string Body = "New Circular Issued By HR: " +  DateTime.Now + " " +
                        //Environment.NewLine + "Branch:" + " " + 
                       
                        Environment.NewLine + "For Detail Follow: http://192.168.103.13/HRCircular.aspx";

                    string status = SendMail(msender, "mohan.timalsina@nccbank.com.np", Subject, Body);

                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
    }


    protected void DownloadFile(object sender, EventArgs e)
    {
        //string filePath = (sender as LinkButton).CommandArgument;
        //string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //FileStream fs = new FileStream(filePath + "\\" + fileName, FileMode.Open,FileAccess.Read);
        //byte[] ar = new byte[(int)fs.Length];
        //fs.Read(ar, 0, (int)fs.Length);
        //fs.Close();

        //Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
        //Response.ContentType = "application/octectstream";
        //Response.BinaryWrite(ar);
        //Response.End();
        
       
    }

    protected void DeleteFile(object sender, EventArgs e)
    {
       
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);

    }
}
