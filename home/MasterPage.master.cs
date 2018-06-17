using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
     

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void Register_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("registration.aspx");
    }
    protected void Btnlogin_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from admin_login where username =@username and pwd=@pwd", con);
        cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
        cmd.Parameters.AddWithValue("@pwd", TxtPwd.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Redirect("welcome admin.aspx");
        }

        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
        }

    }
   /* protected void BtnReg_Click(object sender, EventArgs e)
    {
        try
        {


            SqlConnection conn = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
            SqlCommand cmd1 = new SqlCommand("sp_placement_registration", conn);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.AddWithValue("@spr_regno", Convert.ToInt32(TxtRegno1.Text));
          
            cmd1.Parameters.AddWithValue("@spr_emaild", TxtMailid.Text);
            cmd1.Parameters.AddWithValue("@spr_mobile", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@spr_dob", TextBox4.Text);

            conn.Open();


            SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
            DataSet dsstudentregistration = new DataSet();
            adapter.Fill(dsstudentregistration, "StudentRegistration");


            if (dsstudentregistration.Tables[0].Rows.Count > 0)
            {
                int errorcode;
                errorcode = (int)dsstudentregistration.Tables[0].Rows[0]["errcode"];
                if (errorcode == 200)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" +(string)dsstudentregistration.Tables[0].Rows[0]["errmsg"].ToString() + "')</script>");
                    //lblStatus.Text = (string)dsstudentregistration.Tables[0].Rows[0]["errmsg"].ToString();

                    this.TxtRegno1.Text = null;
                    this.TxtMailid.Text = null;
                    this.TextBox3.Text = null;
                    this.TextBox4.Text = null;
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + (string)dsstudentregistration.Tables[0].Rows[0]["errmsg"].ToString() + "')</script>");
                   // lblStatus.Text = (string)dsstudentregistration.Tables[0].Rows[0]["errmsg"].ToString();

                }
            }
            conn.Close();


        }


        catch (Exception ex)
        {
            Response.Write("error" + ex);

        }
    }*/
    protected void stulog_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
        SqlCommand cmd1 = new SqlCommand("sp_placement_student_login", conn);
        cmd1.CommandType = CommandType.StoredProcedure;

        cmd1.Parameters.AddWithValue("@psl_userid", TextBox1.Text);
        cmd1.Parameters.AddWithValue("@psl_password", TextBox2.Text);

        conn.Open();


        SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
        DataSet dsloginstudent = new DataSet();
        adapter.Fill(dsloginstudent, "StudentLogin");
        Session["username"] = TextBox1.Text;


        if (dsloginstudent.Tables[0].Rows.Count > 0)
        {
            int errorcode;
            errorcode = (int)dsloginstudent.Tables[0].Rows[0]["errcode"];
            if (errorcode == 200)
            {
                Response.Redirect("Student form.aspx");

            }
            else
            {

                Page.ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + (string)dsloginstudent.Tables[0].Rows[0]["errmsg"].ToString() + "')</script>");
            }
        }
        conn.Close();

    }
   /* protected void btnReset_Click(object sender, EventArgs e)
    {
        this.TxtRegno1.Text = null;
        this.TxtMailid.Text = null;
        this.TextBox3.Text = null;
        this.TextBox4.Text = null;
    }*/
    }


