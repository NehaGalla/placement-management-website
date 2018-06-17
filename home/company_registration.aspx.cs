using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class home_company_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //ModalPopupExtender1.Show();
        }
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {

        string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("insert_company_registration "))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@regno", TxtRegno.Text);
                    cmd.Connection = con;
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dsscompanyregistration = new DataSet();
                    adapter.Fill(dsscompanyregistration, "companyRegistration");

                    if (dsscompanyregistration.Tables[0].Rows.Count > 0)
                    {
                        int errorcode;
                        errorcode = (int)dsscompanyregistration.Tables[0].Rows[0]["errcode"];

                        if (errorcode == 200)
                        {
                            //int slno = Convert.ToInt32(cmd.ExecuteScalar());
                            string lblStatus = (string)dsscompanyregistration.Tables[0].Rows[0]["errmsg"].ToString();

                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "Activation message is sent successfully" + "');", true);
                            // SendActivationEmail(slno);
                        }
                        else
                        {
                            string lblStatus = (string)dsscompanyregistration.Tables[0].Rows[0]["errmsg"].ToString();
                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "');", true);

                        }
                    }
                    con.Close();

                }
            }
        }
    }

    protected void load_page(object sender, EventArgs e)
    {
        Server.Transfer("company_registration.aspx");
    }
}