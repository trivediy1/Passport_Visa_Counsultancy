using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agent_Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"]!= null && Session["utype"]!=null)
        {
            if (Session["utype"].ToString() != "agent")
            {
                Response.Redirect("web/Error_page.html");
            }
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }
}
