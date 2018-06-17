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

public partial class home_view_student_details_ : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        //bindGridview1();
        bindDdlCompany();
       
    }

    protected void ddlselect_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlSelect.SelectedItem.Text == "Eligible Students")
        {
            bindGridview1();
        }
        if (ddlSelect.SelectedItem.Text == "Registered Students")
        {
            bindGridview2();
        }
        
    }
    protected void bindGridview()
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select Degree,Branch,Regno,Mobile,Email,tenth,twelth,Avg,Arrears,Gender,Ist_Attempt from student_data";

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
                            gvDetails.DataSource = dt;
                            gvDetails.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ltrerr.Text = "error" + ex;
                    }
                }
            }
        }
    }

    protected void bindDdlCompany()
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = " select company_name from job_venue_details";

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
                            ddlCompany.DataSource = dt;
                            ddlCompany.DataTextField = "Company_name";
                            ddlCompany.DataBind();
                        }
                        //ddlCompany.Items.Insert(0, new ListItem("--Select Company--", "0"));
                    }
                    catch (Exception ex)
                    {
                        ltrerr.Text = "error" + ex;
                    }
                }
            }
        }
    }

    protected void bindGridview1()
    {
        
        
                string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select_students"))
                    {
                          cmd.CommandType = CommandType.StoredProcedure;

                          cmd.Parameters.AddWithValue("@company_name", ddlCompany.SelectedItem.ToString());
                            cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                          try
                          {
                            con.Open();
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvDetails.DataSource = dt;
                            gvDetails.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ltrerr.Text = "error" + ex;
                    }
                }
            }
        }
    }
    protected void bindGridview2()
    {
        string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select_registered_students"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@company_name", ddlCompany.SelectedItem.ToString());
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    try
                    {
                        con.Open();
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvDetails.DataSource = dt;
                            gvDetails.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ltrerr.Text = "error" + ex;
                    }
                }
            }
        }
    }
}