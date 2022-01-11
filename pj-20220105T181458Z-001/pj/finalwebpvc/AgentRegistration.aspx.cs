using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgentRegistration : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> uns = new List<string>();
    List<string> adn = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
           CompareEndTodayValidator.ValueToCompare= DateTime.Now.ToString("dd/MM/yyyy");

            dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Get_Usernames", dc.con);
            dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;

            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();



            while (dc.sdr.Read())
            {
                uns.Add(dc.sdr[0].ToString());
            }

            dc.con.Close();

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

    protected void Passpord_Unload(object sender, EventArgs e)
    {

    }

    protected void Register_Click(object sender, EventArgs e)
    {
        String gender_temp = "";
        if (gender.Text == "Male")
        {
            gender_temp = "m";
        }
        else
        {
            gender_temp = "f";
        }
        try {
            dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Register_Agent", dc.con);
            dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
            dc.cmd.Parameters.AddWithValue("fname", First_Name.Text);
            dc.cmd.Parameters.AddWithValue("mname", Middle_Name.Text);
            dc.cmd.Parameters.AddWithValue("lname", Last_Name.Text);
            dc.cmd.Parameters.AddWithValue("dob", DateTime.ParseExact(dob_tb.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture));
            dc.cmd.Parameters.AddWithValue("gender", gender_temp);
            dc.cmd.Parameters.AddWithValue("address", Address.Text);
            dc.cmd.Parameters.AddWithValue("pincode", Pincode.Text);
            dc.cmd.Parameters.AddWithValue("cty", City.Text);
            dc.cmd.Parameters.AddWithValue("dstct", District.Text);
            dc.cmd.Parameters.AddWithValue("st", State.Text);
            dc.cmd.Parameters.AddWithValue("acn", Adhar_Card_No.Text);
            dc.cmd.Parameters.AddWithValue("contno", Contact_No.Text);
            dc.cmd.Parameters.AddWithValue("email", Email_Id.Text);
            dc.cmd.Parameters.AddWithValue("unm", User_Name.Text);
            dc.cmd.Parameters.AddWithValue("pass", dc.getMD5Hash(Password.Text));

            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                Response.Write("User ID : " + dc.sdr[0].ToString() + "User Type : " + dc.sdr[1].ToString());
            }
            dc.con.Close();

            Response.Write(dc.sendsms(Contact_No.Text, "Dear user. Mr/Mrs. " + First_Name.Text + " " + Last_Name.Text + ", You are now registered as an agent on www.pvc.com. Your Username is : " + User_Name.Text + " and Password is : " + Password.Text + "[Testing]"));
            Response.Redirect("AgentRegistration.aspx");
        }
        catch (Exception)
        {
            Label2.Text = "Invalid Date";
        }
        
    }

    protected void Pincode_TextChanged(object sender, EventArgs e)
    {
        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Get_Pincode_Detail", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;

        dc.cmd.Parameters.AddWithValue("pcd", Pincode.Text);

        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            while (dc.sdr.Read())
            {
                City.Text = dc.sdr[1].ToString();
                District.Text = dc.sdr[2].ToString();
                State.Text = dc.sdr[3].ToString();
            }
        }

        dc.con.Close();
    }

    protected void User_Name_TextChanged(object sender, EventArgs e)
    {

        if (uns.Contains(User_Name.Text))
        {
            Label1.Text = "User Aleady Exist!";
        }
        else
        {
            Label1.Text = "";
        }
    }

    protected void Adhar_Card_No_TextChanged(object sender, EventArgs e)
    {   
        if (adn.Contains(Adhar_Card_No.Text))
        {

            dc.cmd = new System.Data.SqlClient.SqlCommand("select * from tbl_Personal_Details where Adhar_Card_No=" + Adhar_Card_No.Text, dc.con);

            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            dc.sdr.Read();

            First_Name.Text = dc.sdr[1].ToString();
            Middle_Name.Text = dc.sdr[2].ToString();
            Last_Name.Text = dc.sdr[3].ToString();
            String temp = dc.sdr[4].ToString();
            DateTime dt = DateTime.ParseExact(temp, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture);
            dob_tb.Text = dt.ToString("dd-MM-yyyy");

            temp = dc.sdr[5].ToString();

            if (temp=="m")
            {
                gender.Text = "Male";
            }
            else
            {
                gender.Text = "Female";
            }

            Address.Text = dc.sdr[6].ToString();
            Pincode.Text = dc.sdr[7].ToString();
            Contact_No.Text = dc.sdr[9].ToString();
            Email_Id.Text = dc.sdr[10].ToString();
            dc.sdr.Close();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select City, District, States from tbl_Pin_Codes where Pin_Codes = " + Pincode.Text, dc.con);
            dc.sdr = dc.cmd.ExecuteReader();

            dc.sdr.Read();

            City.Text = dc.sdr[0].ToString();
            District.Text = dc.sdr[1].ToString();
            State.Text = dc.sdr[2].ToString();

            dc.con.Close();
        }
    }
}