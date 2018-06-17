using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.OleDb;
using System.Data.SqlClient;


public partial class home_welcome_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) 
    {

    }
     
    protected void UpdateWebsite_Click(object sender, EventArgs e)
    {
        Response.Redirect("Update Website.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //DateTime dob = DateTime.Parse(Request.Form[ExpDate.UniqueID]);
        //Session["expdate"] = dob;
        try
        {
            SqlConnection conn = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("ins_expirydate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd.Parameters.AddWithValue("@date_time", ExpDate.Text); 
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error" + ex);

        }
    }
    
}