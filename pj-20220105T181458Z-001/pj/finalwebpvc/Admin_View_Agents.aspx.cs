using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_Agents : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> adn = new List<string>();
    List<string> adcns = new List<string>();
    Boolean flgext = false;
    String payer = "Self";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] != null && Session["utype"] != null)
        {

            if (!IsPostBack)
            {
                binddata();
            }

            if (Session["id"] != null && Session["utype"] != null)
            {

                dc.cmd = new System.Data.SqlClient.SqlCommand("select Adhar_Card_No from tbl_Personal_Details", dc.con);

                dc.con.Open();
                dc.sdr = dc.cmd.ExecuteReader();

                while (dc.sdr.Read())
                {
                    adn.Add(dc.sdr[0].ToString());
                }

                dc.con.Close();
            }
            else
            {
                Response.Redirect("web/Error_page.html");
            }
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }

    private void binddata()
    {

        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Get_Agent_Details_Admin", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dc.sda = new System.Data.SqlClient.SqlDataAdapter(dc.cmd);
        dc.dt = new System.Data.DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt;
        rptragent.DataBind();
    }
}