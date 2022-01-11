using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class finalwebpvc_agents : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddata();
        }
    }

    private void binddata()
    {
        
        dc.cmd = new SqlCommand("sp_Find_Agents",dc.con);
        dc.cmd.CommandType = CommandType.StoredProcedure;
        dc.sda = new SqlDataAdapter(dc.cmd);
        dc.dt = new DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt;
        rptragent.DataBind();
    }
}