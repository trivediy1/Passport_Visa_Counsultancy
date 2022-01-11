using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_Agent_Home_New : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    string name="";
    string cvisa = "";
    string cpassport = "";
    string ccustomer = "";
    string pa = "";
    string ra = "";
    string tc = "";
    string fn = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
            string aid = Session["id"].ToString();
            dc.con.Open();
            dc.cmd = new System.Data.SqlClient.SqlCommand("select count(*) from tbl_Customer_Agent_Relation where Agent_Id = " + aid + "", dc.con);
           
            dc.sdr = dc.cmd.ExecuteReader();
            while (dc.sdr.Read())
            {
                ccustomer = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select count(*) from tbl_Passport_Details where Agent_Id = " + aid + "", dc.con);
           
            dc.sdr = dc.cmd.ExecuteReader();
            while (dc.sdr.Read())
            {
                cpassport = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select count(*) from tbl_Visa_Details where Agent_Id = " + aid + "", dc.con);
           
            dc.sdr = dc.cmd.ExecuteReader();
            while (dc.sdr.Read())
            {
                cvisa = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select CONCAT(tbl_Personal_Details.First_Name, ' ' ,tbl_Personal_Details.Last_Name) from tbl_Personal_Details, tbl_Agent_Details where tbl_Agent_Details.Person_Id = tbl_Personal_Details.Person_Id and tbl_Agent_Details.Login_Id = " + aid + "", dc.con);
                
            dc.sdr = dc.cmd.ExecuteReader();
            while (dc.sdr.Read())
            {
                name = dc.sdr[0].ToString();
            }
            dc.sdr.Close();
          

            pass_count.Text = cpassport;
            visa_Count.Text = cvisa;
            customer_count.Text = ccustomer;
            agent_name.Text = "  " + name;


            dc.cmd = new System.Data.SqlClient.SqlCommand("select sum(Paid_Amount) from tbl_Customer_Agent_Payment where Agent_Id = '" +Session["id"].ToString()+"'", dc.con);

            dc.sdr = dc.cmd.ExecuteReader();
            if (dc.sdr.HasRows)
            {
                dc.sdr.Read();
                pa = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            Label2.Text = pa;

            dc.cmd = new System.Data.SqlClient.SqlCommand("select sum(cd.Remaining_Amount) from tbl_Customer_Details as cd, tbl_Customer_Agent_Relation as car where cd.Customer_Id = car.Customer_Id and car.Agent_Id = '" + Session["id"].ToString() + "'", dc.con);

            dc.sdr = dc.cmd.ExecuteReader();
            if (dc.sdr.HasRows)
            {
                dc.sdr.Read();
                ra = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            Label3.Text = ra;

            dc.cmd = new System.Data.SqlClient.SqlCommand("select sum(pd.Amount) from tbl_Passport_Details as pd where pd.Agent_Id = '" + Session["id"].ToString() + "'", dc.con);

            dc.sdr = dc.cmd.ExecuteReader();
            if (dc.sdr.HasRows)
            {
                dc.sdr.Read();
                tc = dc.sdr[0].ToString();
            }
            dc.sdr.Close();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select sum(vd.Amount) from tbl_Visa_Details as vd where vd.Agent_Id ='" + Session["id"].ToString() + "'", dc.con);

            dc.sdr = dc.cmd.ExecuteReader();
            if (dc.sdr.HasRows)
            {
                dc.sdr.Read();
                string temp = dc.sdr[0].ToString();
                if (temp!="" && tc != "")
                {
                    fn = (Convert.ToDecimal(temp) + Convert.ToDecimal(tc)).ToString();
                }
                else if (temp == "")
                {
                    fn = tc;
                }
                else if (tc == "")
                {
                    fn = temp;
                }
                else
                {
                    fn = "0";
                }
            }
            dc.sdr.Close();
            Label4.Text = fn.ToString();

            dc.con.Close();

        }
       else
        {
            Response.Redirect("");
        }


    }
}