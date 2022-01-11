using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.IO.MemoryMappedFiles;
using System.Data.SqlClient;
using System.Data;

public partial class finalwebpvc_Apply_Visa_part2 : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> adn = new List<string>();
    string adcn = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {

            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Personal_Details.Adhar_Card_No from tbl_Customer_Details, tbl_Personal_Details where tbl_Customer_Details.Person_Id=tbl_Personal_Details.Person_Id and tbl_Personal_Details.Adhar_Card_No = " + Session["adharcardno"], dc.con);
            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                adcn = dc.sdr[0].ToString();
            }
            dc.sdr.Close();
            dc.con.Close();
            pass_pay_adhar.Text = adcn;



            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Personal_Details.Adhar_Card_No from tbl_Personal_Details, tbl_Customer_Details, tbl_Customer_Agent_Relation where tbl_Personal_Details.Person_Id=tbl_Customer_Details.Person_Id and tbl_Customer_Details.Customer_Id = tbl_Customer_Agent_Relation.Customer_Id and tbl_Customer_Agent_Relation.Agent_Id = " + Session["id"], dc.con);
            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                adn.Add(dc.sdr[0].ToString());
            }
            dc.sdr.Close();
            dc.con.Close();
            pass_pay_adhar.Text = adcn;

            for (int i = 0; i < adn.Count; i++)
            {
                pass_adhar.Items.Add(adn[i].ToString());
            }
        }
        else
        {
            Response.Redirect("web/Error_page.html");
        }
    }



    protected void submit_Click(object sender, EventArgs e)
    {

        string amount = visa_amount.Text;
        string ps1 = FileUpload1.PostedFile.FileName;
        string ps2 = FileUpload2.PostedFile.FileName;
        
        FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + dc.visa_path + ps1);
        FileUpload2.PostedFile.SaveAs(Server.MapPath(".") + dc.visa_path + ps1);
       
        string ps1path = "~" + dc.pass_path + ps1.ToString();
        string ps2path = "~" + dc.pass_path + ps1.ToString();
        
        dc.con.Open();
        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Insert_Visa_Details", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;

        string payer = "self";
        string cid = "";

        if (RadioButtonList1.SelectedValue == "Self")
        {
            payer = pass_pay_adhar.Text;
        }
        else if (RadioButtonList1.SelectedValue == "Refferal")
        {
            payer = pass_adhar.Text;
        }

        cid = dc.get_cust_id(payer);

        dc.cmd.Parameters.AddWithValue("adn", pass_pay_adhar.Text);
        dc.cmd.Parameters.AddWithValue("cid", cid);
        dc.cmd.Parameters.AddWithValue("aid", Session["id"].ToString());
        dc.cmd.Parameters.AddWithValue("visa_ser", visa_service.Text);
        dc.cmd.Parameters.AddWithValue("status", "Pending");
        dc.cmd.Parameters.AddWithValue("amount", amount);
        dc.cmd.Parameters.AddWithValue("country", country.Text);
        dc.cmd.Parameters.AddWithValue("pass_no", pass_no.Text);

        dc.cmd.Parameters.AddWithValue("img_pass_side1", ps1path);
        dc.cmd.Parameters.AddWithValue("img_pass_side2", ps2path);
        dc.cmd.Parameters.AddWithValue("date_apply", DateTime.Now.Date);

        dc.cmd.ExecuteNonQuery();

        dc.con.Close();

        dc.con.Open();
        dc.cmd = new System.Data.SqlClient.SqlCommand("update tbl_Customer_Details set Remaining_Amount = Remaining_Amount + " + amount + " where tbl_Customer_Details.Customer_Id = " + cid + "", dc.con);
        dc.cmd.ExecuteNonQuery();
        dc.con.Close();

        dc.con.Open();
        dc.cmd = new System.Data.SqlClient.SqlCommand("update tbl_Agent_Details set Remaining_Amount = Remaining_Amount + " + (Convert.ToDouble(amount) * 0.20) + " where tbl_Agent_Details.Login_Id = " + Session["id"] + "", dc.con);
        dc.cmd.ExecuteNonQuery();
        dc.con.Close();

        string cn = "";
        dc.cmd = new SqlCommand("select Contact_no from tbl_Personal_Details where tbl_Personal_Details.Adhar_Card_No = '" + pass_pay_adhar.Text + "'", dc.con);
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
            string smsresult = dc.sendsms(cn, "Dear Applicant, Mr./Mrs/ " + Session["fname"].ToString() + " " + Session["lname"].ToString() + " Your appliation for Visa has been submitted by your adhar card no " + Session["adharcardno"].ToString() + " and passport no : " + pass_no.Text + " ");
        }
        catch (Exception)
        {

        }


        Response.Redirect("applyvisapart1.aspx");
    }
}