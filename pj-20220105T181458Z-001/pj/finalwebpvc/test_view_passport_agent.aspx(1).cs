using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_test_view_passport_agent : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] != null && Session["utype"] != null)
        {
            string temp = Session["id"].ToString();
            //Filling data in repeater

            binddata(temp);
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }


    private void binddata(string temp)
    {

        dc.cmd = new System.Data.SqlClient.SqlCommand("select A.Passport_Serial_No, CONCAT(B.First_Name, ' ' , B.Last_Name) as name, B.Contact_No, A.Customer_Id ,A.Passport_Service,A.Status,A.Amount,A.Date_Of_Applying,A.Document_Verification_Date,A.Police_Inquiry_Date from tbl_Passport_Details as A, tbl_Personal_Details as B where A.Person_Id = B.Person_Id and A.Agent_Id="+temp, dc.con);
        dc.sda = new System.Data.SqlClient.SqlDataAdapter(dc.cmd);
        dc.dt = new System.Data.DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt;
        rptragent.DataBind();
    }
}