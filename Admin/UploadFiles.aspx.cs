using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;

public partial class Admin_UploadFiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
        {
            ddlType.Items.Insert(0, "Choose One");
            
        }
        lblMsg.Text = "";
        }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile && ddlType.SelectedValue != "Choose One")
        {
            btnUpload.Attributes["onclick"] = "javascript:return ConfirmSave();";
            Getfiles();

            lblMsg.Text = "Your file has been uploaded Successfully";
            ddlType_SelectedIndexChanged(null, null);
        }
        else
        {
            lblMsg.Text = "Please choose correct file or location";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void gvFiles_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gvFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        deletefile(e.RowIndex);
    }
    protected void gvFiles_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }
    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string path = "";
        if (ddlType.SelectedValue == "Manuals")
        {
            path = Server.MapPath("~/Manuals/");
        }
        else if (ddlType.SelectedValue == "Policies")
        {
            path = Server.MapPath("~/Policies/");
        }
        else if (ddlType.SelectedValue == "ProductPaper")
        {
            path = Server.MapPath("~/ProductPaper/");
        }
        else if (ddlType.SelectedValue == "Guidelines")
        {
            path = Server.MapPath("~/Guidelines/");
        }
        DirectoryInfo di = new DirectoryInfo(path);
        FileInfo[] fi = di.GetFiles().OrderByDescending(p => p.CreationTime).ToArray();


        foreach (FileInfo file in fi)
        {
            gvFiles.DataSource = fi;
            gvFiles.DataBind();
        }
    }

    private void deletefile(int index)
    {
        string path = "";
        if (ddlType.SelectedValue == "Manuals")
        {
            path = Server.MapPath("~/Manuals/");
        }
        else if (ddlType.SelectedValue == "Policies")
        {
            path = Server.MapPath("~/Policies/");
        }
        else if (ddlType.SelectedValue == "ProductPaper")
        {
            path = Server.MapPath("~/ProductPaper/");
        }
        else if (ddlType.SelectedValue == "Guidelines")
        {
            path = Server.MapPath("~/Guidelines/");
        }

        string fullpath = path + gvFiles.Rows[index].Cells[1].Text;
        if (fullpath != null)
        {
            File.Delete(fullpath);
            ddlType_SelectedIndexChanged(null, null);
            lblMsg.Text = "Deleted Successfully";
        }
    }

    private void Getfiles()
    {
        string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        if (ddlType.SelectedValue == "Manuals")
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Manuals/") + fileName);

        }
        else if (ddlType.SelectedValue == "Policies")
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Policies/") + fileName);

        }
        else if (ddlType.SelectedValue == "ProductPaper")
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProductPaper/") + fileName);

        }
        else if (ddlType.SelectedValue == "Guidelines")
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Guidelines/") + fileName);

        }
    }

    protected void gvFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteFile")
        {
            var index = Convert.ToInt32(e.CommandArgument);

            var row = gvFiles.Rows[index];

            var fileName = row.Cells[1].Text;

            var fullFileName = fileName;

            if (File.Exists(fullFileName))
            {

                File.Delete(fullFileName);

            }
            else
            {
                lblMsg.Text = "No file deleted";
            }
        }
    }
}
