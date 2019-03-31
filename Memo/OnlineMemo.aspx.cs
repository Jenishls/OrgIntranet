using System;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Drawing;
using System.Net;

public partial class Memo_OnlineMemo : System.Web.UI.Page
{
    DBMemo dm = new DBMemo();
    UserTable ut = new UserTable();
    //public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGrid();
            ViewMemo.Visible = false;
        }
    }

    private void LoadGrid()
    {
        DataTable dt = dm.GetAllMemo();
        GridView1.DataSource = dt;
        GridView1.DataBind();
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

    private void CreateMemo()
    {
        string branch = Session["BranchCode"].ToString();
        ViewMemo.Visible = false;

        txtTo.Text = "";
        DataTable dt1 = ut.GetAllDepartments();
        ddlDep.DataSource = dt1;
        ddlDep.DataValueField = "DepartmentId";
        ddlDep.DataTextField = "Department";
        ddlDep.DataBind();
        ddlDep.Items.Insert(0, "Choose Department");
        txtThrough.Text = "";
        txtFrom.Text = "";
        txtSubject.Text = "";
        //txtDate.Text = "";
        fMemo.Text = "";
        txtComments.Text = "";

        DataTable dbm = ut.GetBranchBM(branch);
        if (dbm.Rows.Count > 0)
        {
            txtForwardTo.Text = dbm.Rows[0]["Email"].ToString();
        }
        else
        {
            txtForwardTo.Text = "";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ViewMemo.Visible = false;
        string branchcode = Session["BranchCode"].ToString();
        string msender = Session["username"].ToString();
        string depart = ddlDep.SelectedItem.ToString();
        string str = HttpUtility.HtmlEncode(fMemo.Text);
        string referenceno = "";
        DataTable dt = dm.MCreateRefNo(branchcode);
        if (dt.Rows.Count > 0)
        {
            if (Convert.ToInt32(dt.Rows[0]["RefNo"]) < 10)
            {
                referenceno = branchcode + "OM" + DateTime.Today.Year + "000" + dt.Rows[0]["RefNo"];
            }
            else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 10 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 100)
            {
                referenceno = branchcode + "OM" + DateTime.Today.Year + "00" + dt.Rows[0]["RefNo"];
            }
            else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 100 && Convert.ToInt32(dt.Rows[0]["RefNo"]) < 1000)
            {
                referenceno = branchcode + "OM" + DateTime.Today.Year + "0" + dt.Rows[0]["RefNo"];
            }
            else if (Convert.ToInt32(dt.Rows[0]["RefNo"]) >= 1000)
            {
                referenceno = branchcode + "OM" + DateTime.Today.Year + dt.Rows[0]["RefNo"];
            }
        }
        else
        {
            referenceno = branchcode + "OM" + DateTime.Today.Year + "000" + "1";
        }
        if (btnSave.Text == "Create")
        {
            int i = dm.CreateMemo(branchcode, referenceno, txtTo.Text, depart, txtThrough.Text, txtFrom.Text, txtSubject.Text, str, txtComments.Text, txtForwardTo.Text, msender, "C");
            if (i > 0)
            {
                //string branch = ddlBranchCode.SelectedItem.ToString();
                string Subject = "New Memo:" + " " + branchcode;
                string Body = "New Memo Registered:" +
                    Environment.NewLine + "Branch:" + " " + branchcode +
                    Environment.NewLine + "ReferenceNo:" + " " + referenceno +
                    Environment.NewLine + "To:" + " " + txtTo.Text +
                     Environment.NewLine + "Department:" + " " + depart +
                     Environment.NewLine + "From:" + " " + txtFrom.Text +
                     Environment.NewLine + "Subject:" + " " + txtSubject.Text +
                     //Environment.NewLine + "Created By:" + " " + msender +
                     Environment.NewLine + 
                     Environment.NewLine +
                     Environment.NewLine +
                    Environment.NewLine + "For Detail Follow: http://nccintanet.nccbank.com.np/OnlineMemo.aspx";
                
                string Alert = "New Memo Created" + "\\n" + "ReferenceNo:" + referenceno + "\\n" + "Forwarded to:" + txtForwardTo.Text;
                string status = SendMail(msender, txtForwardTo.Text, Subject, Body);
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");
                

                
                if(!Directory.Exists(Server.MapPath("~/MemoImage/" + referenceno)))
                System.IO.Directory.CreateDirectory(Server.MapPath("~/MemoImage/"+referenceno ));
                FileUpload1.SaveAs(Server.MapPath("~/MemoImage/"+ referenceno+"/"+FileUpload1.FileName));
                //Image2.ImageUrl = "~/MemoImage/" + FileUpload1.FileName;
                //lblMessage.Text = "Memo Create Successfully";
                //lblMessage.ForeColor = Color.Green;
            }
        }
        else
        {
            string filename = HiddenField2.Value;
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/MemoImage/" + referenceno + "/" + FileUpload1.FileName));
                //Image2.ImageUrl = "~/MemoImage/" + FileUpload1.FileName;
            }
            //int i = dm.Update
            //if (i > 0)
            {
                lblMessage.Text = "Memo Updated";
            }
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        CreateMemo();
        //lblHeading.Text = "New Memo";
        ViewMemo.Visible = false;
    }

    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string refno = GridView1.SelectedDataKey.Value.ToString();
        string usertype = Session["Status"].ToString();
        HiddenField1.Value = refno.ToString();
        DataTable dt = dm.GetMemoByRefNo(refno);
        lblReferenceNo.Text = dt.Rows[0]["ReferenceNo"].ToString();
        lblTo.Text = dt.Rows[0]["ToName"].ToString();
        lblDep.Text = dt.Rows[0]["InDepartment"].ToString();
        lblThrough.Text = dt.Rows[0]["Through"].ToString();
        lblFrom.Text = dt.Rows[0]["FromName"].ToString();
        lblBranchCode.Text = dt.Rows[0]["BranchCode"].ToString();
        lblSubject.Text = dt.Rows[0]["Subject"].ToString();
        lblCreate.Text = dt.Rows[0]["CreatedOn"].ToString();
        lblMemo.Text = HttpUtility.HtmlDecode(dt.Rows[0]["FreeMemo"].ToString());
        string path = Server.MapPath("~/MemoImage/" + refno + "/" + FileUpload1.FileName);
        if (!IsPostBack)
        {
            DirectoryInfo di = new DirectoryInfo(path);
            FileInfo[] fi = di.GetFiles().OrderByDescending(p => p.CreationTime).ToArray();


            foreach (FileInfo file in fi)
            {
                //gvFiles.DataSource = fi;
                //gvFiles.DataBind();
            }

        }
        Image1.ImageUrl = "~/MemoImage/" + refno + "/" + FileUpload1.FileName + FileUpload1.FileName;
        HiddenField2.Value = dt.Rows[0]["Image"].ToString();
        lblComment.Text = dt.Rows[0]["Comment"].ToString();
        btnSave.Text = "Forward";
        MultiView1.ActiveViewIndex = 2;
        ViewMemo.Visible = false;
        lblheading1.Text = "Forward Memo";
        DataTable ddpt = ut.GetAllDepartments();
        ddlDepartment.DataSource = ddpt;
        ddlDepartment.DataValueField = "Department";
        ddlDepartment.DataTextField = "Department";
        ddlDepartment.DataBind();
        if (usertype != "DCEO")
        {
            ddlDepartment.Items.Insert(0, "Choose Department");
        }
        else
        {
            ddlDepartment.Items.Insert(0, "CEO");
        }
        lblForwardTo.Text = dt.Rows[0]["ForwardTo"].ToString();
        lblStatus.Text = dt.Rows[0]["Status"].ToString();
        if (lblStatus.Text == "C")
        {
            lblStatus.Text = "Initialized/Created";
        }

        else if (lblStatus.Text == "A")
        {
            lblStatus.Text = "Approved";
        }
        else if (lblStatus.Text == "R")
        {
            lblStatus.Text = "Rejected";
        }
        else
        {
            lblStatus.Text = "Forwarded";
        }
        gvMemoHistory.DataSource = dm.GetMemoHistory(refno);
        gvMemoHistory.DataBind();


        string dept = ddlDepartment.SelectedValue.ToString();
        if (dept != "Choose Department")
        {
            DataTable dur = ut.GetUserByDepartment(dept);
            ddlForwardToAF.DataSource = dur;
            ddlForwardToAF.DataValueField = "Email";
            ddlForwardToAF.DataTextField = "Email";
            ddlForwardToAF.DataBind();
            if (usertype != "CRO")
            {
                ddlForwardToAF.Items.Insert(0, "Choose Email");
            }
            else
            {
                ddlForwardToAF.Items.Insert(0, "rewanta.dahal@nccbank.com.np");
            }

        }
    }

    protected void btnForward_Click(object sender, EventArgs e)
    {
        ViewMemo.Visible = false;
        string depart = ddlDepartment.SelectedValue.ToString();
        string forwardAF = ddlForwardToAF.SelectedValue.ToString();
        if (depart != "Choose Department" && forwardAF != "Choose Email")
        {

            string msender = Session["username"].ToString();
            int i = dm.ForwardMemo(lblBranchCode.Text, lblReferenceNo.Text, msender, ddlForwardToAF.SelectedValue.ToString(), txtRemarksAF.Text);

            if (i > 0)
            {
                string Subject = "Memo Forwarded" + " " + lblBranchCode.Text;
                string Body = "New Memo Request: Forwarded" +
                    Environment.NewLine + "Branch:" + " " + lblBranchCode.Text +
                    Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNo.Text +
                    
                     Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                     Environment.NewLine +
                    Environment.NewLine + "For Detail Follow: http://nccintranet.nccbank.com.np/OnlineMemo.aspx";

                string Alert = "Memo Forwarded" + "\\n" + "ReferenceNo:" + lblReferenceNo.Text + "\\n" + "Forwarded to:" + ddlForwardToAF.SelectedValue.ToString();
                string status = SendMail(msender, ddlForwardToAF.SelectedValue.ToString(), Subject, Body);
                ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "\\n" + status + "');</script>");

            }

            txtRemarksAF.Text = "";
        }
        else
        {
            string Alert = "Memo Forward Failed" + "\\n" + "Please Check Department or Email Before Proceed";

            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("OnlineMemo.aspx");
    }
    protected void btnCancel1_Click(object sender, EventArgs e)
    {
        Response.Redirect("OnlineMemo.aspx");
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dept = ddlDepartment.SelectedValue.ToString();
        if (dept != "Choose Department")
        {
            DataTable dur = ut.GetUserByDepartment(dept);
            ddlForwardToAF.DataSource = dur;
            ddlForwardToAF.DataValueField = "Email";
            ddlForwardToAF.DataTextField = "Email";
            ddlForwardToAF.DataBind();
            ddlForwardToAF.Items.Insert(0, "Choose Email");
        }
    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
       
        string msender = Session["username"].ToString();
        int i = dm.ApproveMemo(lblBranchCode.Text, lblReferenceNo.Text, msender, txtRemarksAF.Text, "A");
        if (i > 0)
        {
            string Subject = "Memo Approved" + " " + lblBranchCode.Text;
            string Body = "New Memo Request: Approved" +
                Environment.NewLine + "Branch:" + " " + lblBranchCode.Text +
                Environment.NewLine + "ReferenceNo:" + " " + lblReferenceNo.Text +
                
                 Environment.NewLine + "Remarks" + " " + txtRemarksAF.Text +
                 Environment.NewLine +
                Environment.NewLine + "For Detail Follow: http://nccintranet.nccbank.com.np/OnlineMemo.aspx";
            
            string Alert = "Memo Approved" + "\\n" + "ReferenceNo:" + lblReferenceNo.Text;
            // string status = SendMail(msender, txtForwardToAF.Text, Subject, Body);
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
            

            

        }
        

        txtRemarksAF.Text = "";
    }
    protected void chkApprove_CheckedChanged(object sender, EventArgs e)
    {
        if (chkApprove.Checked == true)
        {
            approve.Visible = true;
            btnApprove.Text = "Resolve";
        }
        else
        {
            approve.Visible = false;
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        ViewMemo.Visible = true;
        PanelMemo.Visible = false;
        btnCancel1.Visible = true;
        divbtn.Visible = true;
        string refno = HiddenField1.Value.ToString();
        //string usertype = Session["Status"].ToString();
        //HiddenField1.Value = refno.ToString();
        DataTable dt = dm.GetMemoByRefNo(refno);
        vrefno.Text = dt.Rows[0]["ReferenceNo"].ToString();
        vTo.Text = dt.Rows[0]["ToName"].ToString();
        vDep.Text = dt.Rows[0]["InDepartment"].ToString();
        vThrough.Text = dt.Rows[0]["Through"].ToString();
        vFrom.Text = dt.Rows[0]["FromName"].ToString();
        vBranch.Text = dt.Rows[0]["BranchCode"].ToString();
        vSubject.Text = dt.Rows[0]["Subject"].ToString();
        vCreate.Text = dt.Rows[0]["CreatedOn"].ToString();
        vMemo.Text = HttpUtility.HtmlDecode(dt.Rows[0]["FreeMemo"].ToString());
        gvMemo.DataSource = dm.GetMemoHistory(refno);
        gvMemo.DataBind();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Memo/OnlineMemo.aspx");
    }
    protected void gvFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        openfile();
    }

    private void openfile()
    {
        //string refno = HiddenField1.Value.ToString();
        //string path = Server.MapPath("~/MemoImage/" + refno + "/");
        //WebClient client = new WebClient();
        //Byte[] buffer = client.DownloadData(path + gvFiles.SelectedValue);
        //Response.ContentType = "application/pdf";
        ////Response.ContentType = "application/jpg";
        //Response.AddHeader("content-length", buffer.Length.ToString());
        //Response.BinaryWrite(buffer);
    }
}