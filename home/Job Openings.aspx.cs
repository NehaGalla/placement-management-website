using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Activities;
using System.Collections;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.IO;
using System.Drawing;

public partial class home_Job_Openings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();


            // PopulateCheckBoxArray();

        }
    }
    protected void BindGridview()
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select * from job_venue_details";
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    try
                    {
                        cmd.Connection = con;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvVenue.DataSource = dt;
                            gvVenue.DataBind();

                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        con.Close();
                        sda.Dispose();
                        con.Dispose();
                    }

                }
            }
        }
    }

    //protected void Edit(object sender, EventArgs e)
    //{
    //    using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
    //    {
    //        //txtCustomerID.ReadOnly = true;
    //        //txtCustomerID.Text = row.Cells[0].Text;
    //        //txtContactName.Text = row.Cells[1].Text;
    //        //txtCompany.Text = row.Cells[2].Text;

    //        popup.Show();
    //    }
    //}
    //protected void Save(object sender, EventArgs e)
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("insert_company_registration "))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.CommandType = CommandType.StoredProcedure;
    //                cmd.Parameters.AddWithValue("@regno", TxtRegno.Text);
    //                cmd.Connection = con;
    //                con.Open();
    //                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
    //                DataSet dsscompanyregistration = new DataSet();
    //                adapter.Fill(dsscompanyregistration, "companyRegistration");

    //                if (dsscompanyregistration.Tables[0].Rows.Count > 0)
    //                {
    //                    int errorcode;
    //                    errorcode = (int)dsscompanyregistration.Tables[0].Rows[0]["errcode"];

    //                    if (errorcode == 200)
    //                    {
    //                        //int slno = Convert.ToInt32(cmd.ExecuteScalar());
    //                        string lblStatus = (string)dsscompanyregistration.Tables[0].Rows[0]["errmsg"].ToString();

    //                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "Activation message is sent successfully" + "');", true);
    //                        // SendActivationEmail(slno);
    //                    }
    //                    else
    //                    {
    //                        string lblStatus = (string)dsscompanyregistration.Tables[0].Rows[0]["errmsg"].ToString();
    //                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "');", true);

    //                    }
    //                }
    //                con.Close();

    //            }
    //        }
    //    }
    //}

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = gvVenue.Rows[rowIndex];

            //Fetch value of Name.
            string id = row.Cells[0].Text;
            //Fetch value of Country
            string company_name = row.Cells[1].Text;

            string regno = (row.FindControl("txtRegno") as TextBox).Text;

            if (Convert.ToDateTime(row.Cells[4].Text) >= DateTime.Now)
            {  
                try
                {

                string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("insert_company_registration"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.AddWithValue("@table_name", company_name);
                            cmd.Parameters.AddWithValue("@regno", regno);
                            
                            cmd.Connection = con;
                            con.Open();
                            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                            DataSet dsscompanyregistration2 = new DataSet();
                            adapter.Fill(dsscompanyregistration2, "companyRegistration");

                            if (dsscompanyregistration2.Tables[0].Rows.Count > 0)
                            {
                                int errorcode;
                                errorcode = (int)dsscompanyregistration2.Tables[0].Rows[0]["errcode"];

                                if (errorcode == 200)
                                {
                                    string lblStatus = (string)dsscompanyregistration2.Tables[0].Rows[0]["errmsg"].ToString();
                                    lblmsg.Text = lblStatus;
                                    popup.Show();

                                }
                                else
                                {
                                    string lblStatus = (string)dsscompanyregistration2.Tables[0].Rows[0]["errmsg"].ToString();
                                    lblmsg.Text = lblStatus;
                                    popup.Show();

                                }
                            }
                            con.Close();

                        
                    }
                    }
                }
                }
                catch (Exception ex)
                {
                    popup.Show();
                    lblmsg.Text = "please enter valid regno" +ex;
                    
                }

            }
            else
            {
                popup.Show();
            }   

        }
    }
}
