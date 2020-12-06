using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class VendorManagement : System.Web.UI.Page
{
    BLLVendor bll = new BLLVendor();

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadGridView();

        string status = Session["Status"].ToString();

        if (status != "Admin")
        {

            VendorList.Visible = false;
            VendorList.Visible = false;
        }
    }

    private void LoadGridView()
    {
        VendorList.DataSource = bll.GetAllVendor();
        if (bll.GetAllVendor().Rows.Count > 0)
        {
            VendorList.DataBind();
        }
        //VendorList.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddVendor.aspx");
    }
    protected void VendorList_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void VendorList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void VendorList_DataBinding(object sender, EventArgs e)
    {

    }
    protected void VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string OpId = VendorList.SelectedDataKey.Value.ToString();
        Response.Redirect("~/ViewVendor.aspx"); 
    }


}