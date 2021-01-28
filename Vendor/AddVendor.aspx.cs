using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddVendor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BLLVendor bll = new BLLVendor();
        bll.insertVendor(txtName.Text, txtAddress.Text, txtPAN.Text, txtType.Text, Session["UserId"].ToString());
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Vendor has been added')", true);
        ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert(' Vendor has been added');</script>");
        //lbOne.Text = a.ToString();
        Response.Redirect("~/VendorManagement.aspx");
    }
}