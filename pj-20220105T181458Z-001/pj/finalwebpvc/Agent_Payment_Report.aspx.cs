﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class finalwebpvc_Agent_Payment_Report : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> aids = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {
            binddata1();
            l1.Text = "0";
            l2.Text = "0";
            l3.Text = "0";
            l4.Text = "0";
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }

    public void binddata1()
    {
        dc.cmd = new System.Data.SqlClient.SqlCommand("select B.Login_Id,CONCAT(C.First_Name,' ',C.Last_Name) as Name from tbl_Agent_Details as B ,tbl_Personal_Details as C where B.Person_Id=C.Person_Id order by B.Login_Id asc;", dc.con);

        dc.con.Open();
        dc.sda = new SqlDataAdapter(dc.cmd);
        dc.dt = new DataTable();
        dc.sda.Fill(dc.dt);

        GridView1.DataSource = dc.dt;
        GridView1.DataBind();
        dc.con.Close();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        binddata1();
    }

    public void binddata2()
    {
        string a_id = GridView1.SelectedDataKey.Value.ToString();


        dc.cmd = new System.Data.SqlClient.SqlCommand("select Paid_Amount,Payment_Date_Time from tbl_Agent_Admin_Payment where Agent_Id='" + Convert.ToInt32(a_id) + "';", dc.con);

        dc.con.Open();
        dc.sda = new SqlDataAdapter(dc.cmd);
        dc.dt = new DataTable();
        dc.sda.Fill(dc.dt);

        GridView2.DataSource = dc.dt;
        GridView2.DataBind();
        dc.con.Close();

        String total_passport = "select count(Passport_Serial_No) from tbl_Passport_Details where Agent_Id='" + Convert.ToInt32(a_id) + "';";
        String total_visa = "select count(Visa_Serial_No) from tbl_Visa_Details where Agent_Id='" + Convert.ToInt32(a_id) + "';";
        String total_paid_amount = "select sum(Paid_Amount) from tbl_Agent_Admin_Payment where Agent_Id='" + Convert.ToInt32(a_id) + "';";
        String total_remaining_amount = "select Remaining_Amount from tbl_Agent_Details where Login_Id='" + Convert.ToInt32(a_id) + "';";

        
        dc.con.Open();
        dc.cmd = new SqlCommand(total_passport, dc.con);
        String total_passport1 = dc.cmd.ExecuteScalar().ToString();

        dc.cmd = new SqlCommand(total_visa, dc.con);
        String total_visa1 = dc.cmd.ExecuteScalar().ToString();

        dc.cmd = new SqlCommand(total_paid_amount, dc.con);
        String total_paid_amount1 = dc.cmd.ExecuteScalar().ToString();

        dc.cmd = new SqlCommand(total_remaining_amount, dc.con);
        String total_remaining_amount1 = dc.cmd.ExecuteScalar().ToString();

        dc.con.Close();

        if (total_passport1 != "")
        {
            l1.Text = total_passport1.ToString();
        }
        else
        {
            l1.Text = "0";
        }
        if (total_visa1 != "")
        {
            l2.Text = total_visa1.ToString();
        }
        else
        {
            l2.Text = "0";
        }
        if (total_paid_amount1 != "")
        {
            l3.Text = total_paid_amount1.ToString();
        }
        else
        {
            l3.Text = "0";
        }
        if (total_remaining_amount1 != "")
        {
            l4.Text = total_remaining_amount1.ToString();
        }
        else
        {
            l4.Text = "0";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        binddata2();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        binddata2();
    }
}