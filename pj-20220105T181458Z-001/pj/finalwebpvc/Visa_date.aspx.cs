using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_Visa_date : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> pids = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
            CompareEndTodayValidator.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");
            string temp = Session["id"].ToString();


            //Filling data in repeater

            binddata(temp);
        }
    }

    private void binddata(string temp)
    {
        dc.cmd = new SqlCommand("select Visa_Serial_No from tbl_Visa_Details where Agent_Id = " + temp + "", dc.con);

        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();

        while (dc.sdr.Read())
        {
            pids.Add(dc.sdr[0].ToString());
        }

        dc.con.Close();


        for (int i = 0; i < pids.Count; i++)
        {
            visa_ser_no.Items.Add(pids[i].ToString());
        }
    }

    protected void Update_Click(object sender, EventArgs e)
    {
        try
        {
            dc.cmd = new SqlCommand("sp_Update_Visa_Date", dc.con);
            dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
            dc.cmd.Parameters.AddWithValue("int_date", DateTime.ParseExact(visa_date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture));
            dc.cmd.Parameters.AddWithValue("visa_sr_no", visa_ser_no.SelectedValue);
            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();
            dc.sdr.Close();
            dc.con.Close();

            string cn = "";
            dc.cmd = new SqlCommand("select Contact_no from tbl_Personal_Details, tbl_Visa_Details where tbl_Personal_Details.Person_Id = tbl_Visa_Details.Person_Id and tbl_Visa_Details.Visa_Serial_No='" + visa_ser_no.SelectedItem + "'", dc.con);
            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();
            while (dc.sdr.Read())
            {
                cn = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            dc.con.Close();
            try
            {
                string smsresult = dc.sendsms(cn, "Dear visa Applicant, Your date for visa interview is " + visa_date.Text + " for your application no " + visa_ser_no.SelectedValue);
            }
            catch (Exception)
            {

            }

            Response.Redirect("Visa_date.aspx");
        }
        catch (Exception)
        {

            Label1.Text="Invalid Date";
        }
    }
}