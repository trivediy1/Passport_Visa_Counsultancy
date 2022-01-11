using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class Update_date : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> pids = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
            string temp = Session["id"].ToString();
            CompareEndTodayValidator.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");
            Comparevalidator1.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");

            //Filling data in repeater

            binddata(temp);
        }
    }

    private void binddata(string temp)
    {
        dc.cmd = new SqlCommand("select Passport_Serial_No from tbl_Passport_Details where Agent_Id = " + temp + "", dc.con);

        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();

        while (dc.sdr.Read())
        {
            pids.Add(dc.sdr[0].ToString());
        }

        dc.con.Close();


        for (int i = 0; i < pids.Count; i++)
        {
            pass_ser_no.Items.Add(pids[i].ToString());
        }
    }

    protected void Update_Click(object sender, EventArgs e)
    {

        dc.cmd = new SqlCommand("update tbl_Passport_Details set Document_Verification_Date='" + DateTime.ParseExact(pass_date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) + "', Police_Inquiry_Date='" + DateTime.ParseExact(pass_police.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) + "', Status='Confirm' where Passport_Serial_No='" + pass_ser_no.SelectedItem + "'", dc.con);
        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();
        dc.sdr.Close();
        dc.con.Close();

        string cn = "";
        dc.cmd = new SqlCommand("select Contact_no from tbl_Personal_Details, tbl_Passport_Details where tbl_Personal_Details.Person_Id = tbl_Passport_Details.Person_Id and tbl_Passport_Details.Passport_Serial_No='" + pass_ser_no.SelectedItem + "'", dc.con);
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
            string smsresult = dc.sendsms(cn, "Dear passport Applicant, Your date for Passport Document Verification is " + pass_date.Text + " and police inquiry date is " + pass_police.Text + "for your application no " + pass_ser_no.SelectedValue);
        }
        catch (Exception)
        {

        }

        Response.Redirect("Update_date.aspx");


    }

    protected void Pay_Click(object sender, EventArgs e)
    {
        //try
        //{

        dc.cmd = new SqlCommand("sp_Update_Pass_Date", dc.con);
        dc.cmd.CommandType = CommandType.StoredProcedure;
        dc.cmd.Parameters.AddWithValue("pass_date", DateTime.ParseExact(pass_date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture));
        dc.cmd.Parameters.AddWithValue("police_date", DateTime.ParseExact(pass_police.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture));
        dc.cmd.Parameters.AddWithValue("ps_sr_no", pass_ser_no.SelectedValue);

        dc.con.Open();
        dc.cmd.ExecuteNonQuery();

        dc.con.Close();

        string cn = "";
        dc.cmd = new SqlCommand("select Contact_no from tbl_Personal_Details, tbl_Passport_Details where tbl_Personal_Details.Person_Id = tbl_Passport_Details.Person_Id and tbl_Passport_Details.Passport_Serial_No='" + pass_ser_no.SelectedItem + "'", dc.con);
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
            string smsresult = dc.sendsms(cn, "Dear passport Applicant, Your date for Passport Document Verification is " + pass_date.Text + " and police inquiry date is " + pass_police.Text + "for your application no " + pass_ser_no.SelectedValue);
        }
        catch (Exception)
        {

        }

        Response.Redirect("Update_date.aspx");
        //}
        //catch (Exception)
        //{

        //    Label1.Text = "Invalid Date";
        //}
    }
}
