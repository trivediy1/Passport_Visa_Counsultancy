using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_Admin_Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["id"] != null && Session["utype"] != null)
        {
            if (Session["utype"].ToString() != "admin")
            {
                Response.Redirect("web/Error_page.html");
            }
        }
        else
        {
            Response.Redirect("web/Error_page.html");
        }
    }
}
