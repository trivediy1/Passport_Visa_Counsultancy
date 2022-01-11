using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Agent_Payment : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> aids = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
            string temp = Session["id"].ToString();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Agent_Details.Login_Id from tbl_Agent_Details", dc.con);

            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                aids.Add(dc.sdr[0].ToString());
            }

            dc.con.Close();


            aids = aids.Distinct().ToList();
            string var;
            for (int i = 0; i < aids.Count; i++)
            {
                DropDownList1.Items.Add(aids[i].ToString());
            }

            //Filling data in repeater

            binddata();
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }

    private void binddata()
    {

        dc.cmd = new System.Data.SqlClient.SqlCommand("select A.Login_Id, CONCAT(B.First_Name,' ',B.Middle_Name ,' ' , B.Last_Name) as name, B.Contact_No, A.Remaining_Amount from tbl_Agent_Details as A, tbl_Personal_Details as B where A.Person_Id = B.Person_Id order by A.Remaining_Amount desc", dc.con);
        dc.sda = new System.Data.SqlClient.SqlDataAdapter(dc.cmd);
        dc.dt = new System.Data.DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt;
        rptragent.DataBind();
    }

    protected void Pay_Click(object sender, EventArgs e)
    {
        //dc.cmd = new System.Data.SqlClient.SqlCommand("select Remaining_Amount from tbl_Agent_Details where Login_Id = " + DropDownList1.Text, dc.con);
        //dc.con.Open();
        //SqlDataReader dr = dc.cmd.ExecuteReader();
        //Int64 temp = 0;
        //while (dr.Read())
        //{
        //    temp = Convert.ToInt16(dr[0].ToString()); 
        //} 
        //dc.con.Close();
        //Int64 tp = Convert.ToInt64(Pay_Amount.Text);
        //if (temp >= tp)
        //{ 
        Label1.Text = " ";
        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Insert_Agent_Admin_Payment", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dc.cmd.Parameters.AddWithValue("aid", DropDownList1.Text);
        dc.cmd.Parameters.AddWithValue("paid_amount", Pay_Amount.Text);
        dc.cmd.Parameters.AddWithValue("pay_date_time", DateTime.Now.Date);


        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();

        dc.con.Close();
        


        string cn = "";
        dc.cmd = new SqlCommand("select Contact_no from tbl_Personal_Details,tbl_Agent_Details where tbl_Personal_Details.Person_Id=tbl_Agent_Details.Person_id and tbl_Agent_Details.Login_Id = '" + DropDownList1.Text + "'", dc.con);
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
            string smsresult = dc.sendsms(cn, "Dear Agent, You Payment of Rs. " + Pay_Amount.Text + " is done [www.pvc.com]");
        }
        catch (Exception)
        {

        }
        Response.Redirect("Agent_Payment.aspx");

        //}
        //else
        //{
        //    Label1.Text = "Please Enter Amount Less then or Equal to Remaining amount";
        //}


    }
}