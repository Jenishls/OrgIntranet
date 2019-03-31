using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutoCompleteExample : System.Web.UI.Page
{
   
    public string listFilter = null;
    UserTable dusert = new UserTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        listFilter = null;
        listFilter = BindName();
    }
    private string BindName()
    {
        DataTable dt = dusert.GetAllUser(); 

        //[\suneel\,\ramesh\,]]
        StringBuilder output = new StringBuilder();
        output.Append("[");
        for (int i = 0; i < dt.Rows.Count; ++i)
        {
            output.Append("\"" + dt.Rows[i]["Email"].ToString() + "\"");

            if (i != (dt.Rows.Count - 1))
            {
                output.Append(",");
            }
        }
        output.Append("];");
        return output.ToString();
    }


    
   
}