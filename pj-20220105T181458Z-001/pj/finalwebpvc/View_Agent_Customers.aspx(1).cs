using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Agent_Customers : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null && Session["utype"] != null)
        {

            if (!IsPostBack)
            {
                binddata();
            }
        }
        else
        {
            Response.Redirect("web/Error_Page.html");
        }
    }

    private void binddata()
    {

        dc.cmd = new System.Data.SqlClient.SqlCommand("select A.Customer_Id, CONCAT(B.First_Name, ' ', B.Last_Name) as name, B.Email_Id, B.Contact_No, B.Address, C.City, C.District, C.States, C.Pin_Codes from tbl_Customer_Details as A, tbl_Personal_Details as B, tbl_Pin_Codes as C, tbl_Customer_Agent_Relation as D where A.Person_Id = B.Person_Id and B.Pin_Code = C.Pin_Codes and B.Person_Id = A.Person_Id and A.Customer_Id = D.Customer_Id and D.Agent_Id = " + Session["id"] + "", dc.con);
        
        dc.sda = new System.Data.SqlClient.SqlDataAdapter(dc.cmd);
        dc.dt = new System.Data.DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt;
        rptragent.DataSource = dc.dt;

        rptragent.DataBind();
    }
}