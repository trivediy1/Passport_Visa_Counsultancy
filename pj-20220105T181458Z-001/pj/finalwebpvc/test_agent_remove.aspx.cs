using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class finalwebpvc_test_agent_remove : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    List<string> aids = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dc.cmd = new System.Data.SqlClient.SqlCommand("select tbl_Agent_Details.Login_Id from tbl_Agent_Details,tbl_Login where tbl_Agent_Details.Login_Id=tbl_Login.Login_Id and tbl_Login.User_type='agent'", dc.con);

            dc.con.Open();
            dc.sdr = dc.cmd.ExecuteReader();

            while (dc.sdr.Read())
            {
                aids.Add(dc.sdr[0].ToString());
            }

            dc.con.Close();


            aids = aids.Distinct().ToList();
            for (int i = 0; i < aids.Count; i++)
            {
                DropDownList1.Items.Add(aids[i].ToString());
            }

            //Filling data in repeater

            binddata();
        }
        
    }
    private void binddata()
    {
        dc.cmd = new System.Data.SqlClient.SqlCommand("select A.Login_Id, CONCAT(B.First_Name,' ',B.Middle_Name ,' ' , B.Last_Name) as name, B.Contact_No, A.Remaining_Amount from tbl_Agent_Details as A, tbl_Personal_Details as B, tbl_Login where A.Person_Id = B.Person_Id and A.Login_Id=tbl_Login.Login_Id and tbl_Login.User_type='agent'", dc.con);
        dc.sda = new System.Data.SqlClient.SqlDataAdapter(dc.cmd);
        dc.dt = new System.Data.DataTable();
        dc.sda.Fill(dc.dt);
        rptragent.DataSource = dc.dt;
        rptragent.DataBind();
    }


    
    protected void Pay_Click(object sender, EventArgs e)
    {
        dc.cmd = new System.Data.SqlClient.SqlCommand("sp_Remove_Agent", dc.con);
        dc.cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dc.cmd.Parameters.AddWithValue("aid", DropDownList1.Text);
        dc.con.Open();
        dc.sdr = dc.cmd.ExecuteReader();
        dc.con.Close();
        Response.Redirect("test_agent_remove.aspx");
    }
}