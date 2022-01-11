using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Contents.RemoveAll();
    }

    protected void Submit_Button_Click(object sender, EventArgs e)
    {

        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Do_Login", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dc.cmd.Parameters.AddWithValue("uname", User_Name.Text);
        dc.cmd.Parameters.AddWithValue("pass", dc.getMD5Hash(Password.Text));

        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();

        string id="", type="";
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            Session["id"] = id = dc.sdr[0].ToString();
            Session["utype"] = type = dc.sdr[1].ToString();
            Session.Timeout = 50;

            if (type == "admin")
            {
                Response.Redirect("Admin_Home_New.aspx");
            }
            else if (type == "agent")
            {
                Response.Redirect("Agent_Home_New.aspx");
            }
            
        }
        else
        {
            Label1.Text = "Invalid Username or Password!";
        }
        dc.con.Close();


    }
}