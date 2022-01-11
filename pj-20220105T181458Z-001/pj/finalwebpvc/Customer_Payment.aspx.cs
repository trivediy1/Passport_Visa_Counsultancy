using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customer_Payment : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> cids = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"]!=null && Session["utype"]!=null)
        {
            string temp = Session["id"].ToString();

            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Customer_Agent_Relation.Customer_Id from tbl_Customer_Agent_Relation where tbl_Customer_Agent_Relation.Agent_Id = " + temp + "", dc.con);

            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();



            while (dc.sdr.Read())
            {
                cids.Add(dc.sdr[0].ToString());
            }

            dc.con.Close();


            //dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Customer_Details.Customer_Id from tbl_Customer_Details, tbl_Visa_Details where tbl_Customer_Details.Customer_Id = tbl_Visa_Details.Customer_Id and tbl_Visa_Details.Agent_Id = " + temp + "", dc.con);

            //dc.con.Open();
            //dc.sdr = dc.cmd.ExecuteReader();



            //while (dc.sdr.Read())
            //{
            //    cids.Add(dc.sdr[0].ToString());
            //}

            dc.con.Close();
            cids = cids.Distinct().ToList();
            string var;
            for(int i=0;i<cids.Count;i++)
            {
                DropDownList1.Items.Add(cids[i].ToString());
            }

            //Filling data in repeater

             binddata(temp);
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }


    private void binddata(String temp)
    {

      //  dc.cmd = new System.Data.SqlClient.SqlCommand("select distinct(A.Customer_Id), CONCAT(B.First_Name, ' ' , B.Last_Name) as name, B.Contact_No, A.Remaining_Amount from tbl_Customer_Details as A, tbl_Personal_Details as B, tbl_Passport_Details as D, tbl_Visa_Details as E where A.Person_Id = B.Person_Id  and D.Agent_Id="+ temp +" or E.Agent_Id=" +temp+ " and A.Person_Id = D.Person_Id or A.Person_Id = E.Person_Id", dc.con);
        dc.cmd = new System.Data.SqlClient.SqlCommand("select distinct(A.Customer_Id), CONCAT(B.First_Name, ' ' , B.Last_Name) as name, B.Contact_No, A.Remaining_Amount from tbl_Customer_Details as A, tbl_Personal_Details as B, tbl_Customer_Agent_Relation as C where A.Person_Id = B.Person_Id and A.Customer_Id = C.Customer_Id and C.Agent_Id = "+ temp + "", dc.con);
        dc.sda = new System.Data.SqlClient.SqlDataAdapter(dc.cmd);
        dc.dt = new System.Data.DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt; 
        rptragent.DataBind();
    }



    protected void Pay_Click(object sender, EventArgs e)
    {
        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Insert_Customer_Agent_Payment", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dc.cmd.Parameters.AddWithValue("cid", DropDownList1.Text);
        dc.cmd.Parameters.AddWithValue("aid", Session["id"].ToString());
        dc.cmd.Parameters.AddWithValue("paid_amount", Pay_Amount.Text);
        dc.cmd.Parameters.AddWithValue("pay_date_time", DateTime.Now.Date );
      

        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();
        dc.sdr.Close();
        dc.con.Close();


        string cn = "";
        dc.cmd = new SqlCommand("select Contact_no from tbl_Personal_Details,tbl_Customer_Details where tbl_Personal_Details.Person_Id=tbl_Customer_Details.Person_id and tbl_Customer_Details.Customer_Id = '" + DropDownList1.Text + "'", dc.con);
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
            string smsresult = dc.sendsms(cn, "Dear Customer, You Payment of Rs. " + Pay_Amount.Text + " is done [www.pvc.com]");
        }
        catch (Exception)
        {

        }

        Response.Redirect("Customer_Payment.aspx");




    }
}