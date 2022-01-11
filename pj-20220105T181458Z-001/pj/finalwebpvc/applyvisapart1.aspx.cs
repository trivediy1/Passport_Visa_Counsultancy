using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

public partial class finalwebpvc_applyvisapart1 : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> adn = new List<string>();
    List<string> adcns = new List<string>();
    Boolean flgext = false;
    String payer = "Self";

    string adcn = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
            CompareEndTodayValidator.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");
            dc.cmd = new SqlCommand("select Adhar_Card_No from tbl_Personal_Details", dc.con);

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
    protected void Pincode_TextChanged(object sender, EventArgs e)
    {
        dc.cmd = new SqlCommand("sp_Get_Pincode_Detail", dc.con);
        dc.cmd.CommandType = CommandType.StoredProcedure;

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

    protected void Adhar_Card_No_TextChanged(object sender, EventArgs e)
    {
        if (adn.Contains(Adhar_Card_No.Text))
        {
            dc.cmd = new SqlCommand("select * from tbl_Personal_Details where Adhar_Card_No = " + Adhar_Card_No.Text, dc.con);

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

            if (temp == "m")
            {
                gender.Text = "Male";
            }
            else
            {
                gender.Text = "Female";
            }

            Address.Text = dc.sdr[6].ToString();
            string pc = dc.sdr[7].ToString();
            Pincode.Text = pc;
            Contact_No.Text = dc.sdr[9].ToString();
            Email_Id.Text = dc.sdr[10].ToString();
            dc.sdr.Close();

            dc.cmd = new SqlCommand("select City, District, States from tbl_Pin_Codes where Pin_Codes = " + pc, dc.con);
            dc.sdr = dc.cmd.ExecuteReader();

            dc.sdr.Read();

            City.Text = dc.sdr[0].ToString();
            District.Text = dc.sdr[1].ToString();
            State.Text = dc.sdr[2].ToString();


            dc.con.Close();

        }
    }

    protected void next1_Click(object sender, EventArgs e)
    {
        string gen = "m";

        if (gender.Text == "Male")
        {
            gen = "m";
        }
        else
        {
            gen = "f";
        }

        try
        {
            dc.cmd = new SqlCommand("sp_Insert_Personal_Details", dc.con);
            dc.cmd.CommandType = CommandType.StoredProcedure;
            dc.cmd.Parameters.AddWithValue("fname", First_Name.Text);
            dc.cmd.Parameters.AddWithValue("mname", Middle_Name.Text);
            dc.cmd.Parameters.AddWithValue("lname", Last_Name.Text);
            dc.cmd.Parameters.AddWithValue("dob", DateTime.ParseExact(dob_tb.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture));
            dc.cmd.Parameters.AddWithValue("gender", gen);
            dc.cmd.Parameters.AddWithValue("address", Address.Text);
            dc.cmd.Parameters.AddWithValue("pincode", Pincode.Text);
            dc.cmd.Parameters.AddWithValue("cty", City.Text);
            dc.cmd.Parameters.AddWithValue("dstct", District.Text);
            dc.cmd.Parameters.AddWithValue("st", State.Text);
            dc.cmd.Parameters.AddWithValue("adhar_no", Adhar_Card_No.Text);
            dc.cmd.Parameters.AddWithValue("contact_no", Contact_No.Text);
            dc.cmd.Parameters.AddWithValue("email", Email_Id.Text);


            dc.con.Open();
            dc.cmd.ExecuteNonQuery();
            dc.sdr.Close();


            dc.cmd = new SqlCommand("sp_Insert_Customer_Details", dc.con);
            dc.cmd.CommandType = CommandType.StoredProcedure;
            dc.cmd.Parameters.AddWithValue("acn", Adhar_Card_No.Text);
            dc.cmd.Parameters.AddWithValue("dt", DateTime.Now.Date);
            dc.cmd.Parameters.AddWithValue("agntid", Session["id"].ToString());

            dc.sdr = dc.cmd.ExecuteReader();
            dc.sdr.Read();
            {
                dc.adcn = dc.sdr[0].ToString();
            }
            dc.sdr.Close();


            string temp = Session["id"].ToString();
            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Personal_Details.Adhar_Card_No from tbl_Personal_Details, tbl_Customer_Details ,tbl_Passport_Details where tbl_Customer_Details.Customer_Id = tbl_Passport_Details.Customer_Id and tbl_Customer_Details.Person_Id = tbl_Personal_Details.Person_Id and tbl_Passport_Details.Agent_Id = " + temp + "", dc.con);
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                dc.adcns.Add(dc.sdr[0].ToString());
            }
            dc.sdr.Close();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Personal_Details.Adhar_Card_No from tbl_Personal_Details, tbl_Customer_Details ,tbl_Visa_Details where tbl_Customer_Details.Customer_Id = tbl_Visa_Details.Customer_Id and tbl_Customer_Details.Person_Id = tbl_Personal_Details.Person_Id and tbl_Visa_Details.Agent_Id = " + temp + "", dc.con);
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                dc.adcns.Add(dc.sdr[0].ToString());
            }

            dc.adcns = dc.adcns.Distinct().ToList();


            payer = "Refferal";
            Session["adharcardno"] = Adhar_Card_No.Text;
            Session["fname"] = First_Name.Text;
            Session["lname"] = Last_Name.Text;
            dc.con.Close();

            Response.Redirect("Apply_Visa_part2.aspx");
        }
        catch (Exception)
        {

            Label1.Text = "Invalid Date";
        }
        
    }

  

}