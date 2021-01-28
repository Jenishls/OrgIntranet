using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewVendor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        _BindService();
    }

    private void _BindService()
    {
        try
        {
            List<BOService> service = dALService.Service.ToList();
            if (service.Count > 0 && service != null)
            {
                gridService.DataSource = service;
                gridService.DataBind();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gridService.EditIndex = e.NewEditIndex;
            _BindService();
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void gridService_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string servicename = ((TextBox)gridService.Rows[e.RowIndex].FindControl("txtService")).Text;
            string filePath = ((FileUpload)gridService.Rows[e.RowIndex].FindControl("fuService")).FileName;
            bOService.Service_name = servicename;
            bOService.Service_image = "../images/service/" + filePath;
            if (File.Exists(Server.MapPath("~/images/service/" + filePath)))
            {
            }
            else
            {
                ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
            }
            dALService.UpdateService(bOService);
            _BindService();
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void AddService(object sender, EventArgs e)
    {
        try
        {
            string servicename = ((TextBox)gridService.FooterRow.FindControl("txtService")).Text;
            string filePath = ((FileUpload)gridService.FooterRow.FindControl("fuService")).FileName;
            bOService.Service_name = servicename;
            bOService.Service_image = "../images/service/" + filePath;
            if (File.Exists(Server.MapPath("~/images/service/" + filePath)))
            {
            }
            else
            {
                ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
            }
            ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
            dALService.SetService(bOService);
            _BindService();
        }
        catch (Exception)
        {
            throw;
        }
    }  
}