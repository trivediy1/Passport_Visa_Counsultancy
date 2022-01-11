using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_ChangeAgentPassword : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    string pass;
    protected void Page_Load(object sender, EventArgs e)
    {
       

        if (Session["id"] != null && Session["utype"] != null)
        {
            dc.cmd = new System.Data.SqlClient.SqlCommand("select Password from tbl_Login where Login_id = " + Session["id"].ToString(), dc.con);
            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            if (dc.sdr.HasRows)
            {
                dc.sdr.Read();
                pass = dc.sdr[0].ToString();
            }
            dc.con.Close();
        }
        else { Response.Redirect("web/Error_page.html"); }
    }

    protected void Submit_Button_Click(object sender, EventArgs e)
    {
        if (pass == dc.getMD5Hash(current_password.Text))
        {
            cpi.Text = "";
            dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Change_password", dc.con);
            dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
            dc.cmd.Parameters.AddWithValue("id", Session["id"].ToString());
            dc.cmd.Parameters.AddWithValue("npass", dc.getMD5Hash(new_password.Text));

            dc.con.Open();
            dc.cmd.ExecuteNonQuery();
            dc.con.Close();
            Response.Redirect("Login.aspx");

        }
        else
        {
            cpi.Text = "Current Password Incorrect";
        }
    }
}