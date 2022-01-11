using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
/// <summary>
/// Summary description for Class1
/// </summary>
public class DataConnection
{
    public SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Yagnik\Desktop\Gautam_project\new\project\PVCDB\pvcdb.mdf;Integrated Security=True;Connect Timeout=30");
    public SqlCommand cmd = new SqlCommand();

    public SqlParameter spm = new SqlParameter();

    public DataTable dt = new DataTable();
    public DataSet ds = new DataSet();

    public SqlDataAdapter sda = new SqlDataAdapter();
    public SqlDataReader sdr;
    public List<string> adcns = new List<string>();
    public string adcn = "";
    public Boolean flgext = false;

    public string pass_path = "//passport_data_images//";
    public string visa_path = "//visa_data_images//";


    public DataConnection()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string getMD5Hash(String s)
    {
        MD5CryptoServiceProvider md5cal = new MD5CryptoServiceProvider();
        md5cal.ComputeHash(ASCIIEncoding.ASCII.GetBytes(s));
        byte[] hashvalue = md5cal.Hash;
        String str = "";

        for (int i = 1; i < hashvalue.Length; i++)
        {
            str = str + hashvalue[i].ToString("X");
        }
        return str;
    }

    public string sendsms(String mb, String msg)
    {
        string dataString = " ";
        // use the API URL here  

        //string strUrl = "http://bulksms.sms2india.info/sendsmsv5.php?user=ytrivedi1&password=sms123&sender=0008&countrycode=91&PhoneNumber=+91" + mb + "&text = " + msg + "&gateway=ZJWWTYRQ";
        // string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=ytrivedi1@hotmail.com:sms123&senderID=Testsms&receipientno=+91" + mb +"&msgtxt=" +msg + "API&state=4";
        //  mvayoo  string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=ytrivedi1@hotmail.com:sms123&senderID=TEST SMS&receipientno="+mb+"&msgtxt="+msg+"&state=0";
        string strUrl = "http://api.mvaayoo.com/mvaayooapi/MessageCompose?user=ytrivedi1@hotmail.com:sms123&senderID=TEST SMS&receipientno=" + mb + "&dcs=0&msgtxt="+msg+"&state=4";
        // Create a request object   
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back   
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        dataString = readStream.ReadToEnd();

        response.Close();
        s.Close();
        readStream.Close();

        return dataString;
    }

    //public string sendsms(String mb, String msg)
    //{
    //    using (var web = new System.Net.WebClient())
    //    {
    //        try
    //        {
    //            string userName = "ytrivedi1@hotmail.com";
    //            string userPassword = "crgsm";
    //            string msgRecepient = "+91"+mb;
    //            string msgText = msg;
    //            string url = "http://smsc.vianett.no/v3/send.ashx?" +
    //            "src=" + "+917990178437" +
    //            "&dst=" + msgRecepient +
    //            "&msg=" + System.Web.HttpUtility.UrlEncode(msgText, System.Text.Encoding.GetEncoding("ISO-8859-1")) +
    //            "&username=" + System.Web.HttpUtility.UrlEncode(userName) +
    //            "&password=" + userPassword;
    //            string result = web.DownloadString(url);
    //            if (result.Contains("OK"))
    //            {
    //               return ("Sms sent successfully");
    //            }
    //            else
    //            {
    //                return ("Some issue delivering");
    //            }
    //        }
    //        catch (Exception ex)
    //        {

    //        }
    //        return "Not Ok";
    //    }
    //}

    public string get_cust_id(string adhar)
    {
        
        string cid = "";
        SqlCommand cmmd = new SqlCommand("select tbl_Customer_Details.Customer_Id from tbl_Customer_Details, tbl_Personal_Details where tbl_Customer_Details.Person_Id = tbl_Personal_Details.Person_Id and tbl_Personal_Details.Adhar_Card_No = " + adhar + "", con);
        SqlDataReader dr = cmmd.ExecuteReader();

        while (dr.Read())
        {
            cid = dr[0].ToString();
        }
        dr.Close();
        return cid;
    }
}