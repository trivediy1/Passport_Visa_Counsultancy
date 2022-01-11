using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_Admin_Home_New : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    string cagent,cpass,cvisa, pa, ra, tc;
    protected void Page_Load(object sender, EventArgs e)
    {
        dc.cmd = new System.Data.SqlClient.SqlCommand("select count(Login_Id) from tbl_Login where User_Type='agent'",dc.con);
        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            cagent = dc.sdr[0].ToString();
        }
        dc.sdr.Close();
        

        dc.cmd = new System.Data.SqlClient.SqlCommand("select count(Passport_Serial_No) from tbl_Passport_Details", dc.con);
        
        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            cpass = dc.sdr[0].ToString();
        }
        dc.sdr.Close();


        dc.cmd = new System.Data.SqlClient.SqlCommand("select count(Visa_Serial_No) from tbl_Visa_Details", dc.con);
        
        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            cvisa = dc.sdr[0].ToString();
        }
        dc.sdr.Close();
        
        agt_count.Text = cagent;
        pass_count.Text = cpass;
        visa_count.Text = cvisa;






        dc.cmd = new System.Data.SqlClient.SqlCommand("select sum(Paid_Amount) from tbl_Agent_Admin_Payment", dc.con);

        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            pa = dc.sdr[0].ToString();
        }
        dc.sdr.Close();

        Label1.Text = pa;

        dc.cmd = new System.Data.SqlClient.SqlCommand("select sum(Remaining_Amount) from tbl_Agent_Details", dc.con);

        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            ra = dc.sdr[0].ToString();
        }
        dc.sdr.Close();

        Label2.Text = ra;

        dc.cmd = new System.Data.SqlClient.SqlCommand("select ((select sum(tbl_Passport_Details.Amount * 0.2) from tbl_Passport_Details) + (select sum(tbl_Visa_Details.Amount * 0.2) from tbl_Visa_Details))", dc.con);

        dc.sdr = dc.cmd.ExecuteReader();
        if (dc.sdr.HasRows)
        {
            dc.sdr.Read();
            tc = dc.sdr[0].ToString();
        }
        dc.sdr.Close();
      
        Label3.Text = tc;

        dc.con.Close();








    }
}