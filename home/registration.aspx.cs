using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System.Web.Services;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Windows.Forms;


public partial class home_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.lblPgMarks.Visible = false;
        //this.LblPGSem1.Visible = false;
        //this.LblPGSem2.Visible = false;
        //this.LblPGSem3.Visible = false;
        //this.LblPGSem4.Visible = false;
        //this.TxtPGSem1.Visible = false;
        //this.TxtPGSem2.Visible = false;
        //this.TxtPGSem3.Visible = false;
        //this.TxtPGSem4.Visible = false;
        //this.LblPanNo.Visible = false;
        //this.TxtPanNo.Visible = false;
        //this.LblPassportNo.Visible = false;
        //this.TxtPassportNo.Visible = false;
        //this.LblAadharNo.Visible = false;
        //this.TxtAadharNo.Visible = false;
        // lblName.Text = (string)(Session["expdate"]);
        skillset.Visible = true;
        skillset2.Visible = true;
        skillset3.Visible = true;
        SqlConnection conn = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("select * from set_expirydate", conn);
        conn.Open();
        SqlDataReader DR1 = cmd.ExecuteReader();
        if (DR1.Read())
        {
            cmpDate.Text = DR1.GetValue(0).ToString();
        }
        conn.Close();
        //TxtDate.Text = DateTime.Now.ToString();
        
        //DateTime cmpdate = (DateTime)(Session["expdate"]);
       // cmpDate.Text = cmpdate.ToString();
        DateTime cmpdate = Convert.ToDateTime(cmpDate.Text);
        if (DateTime.Now <= cmpdate)
        {
            this.REGISTRAITON.Visible = true;
        }
        else
        {
            this.REGISTRAITON.Visible = false;
            this.expmessage.Visible = true;
        }
        
    }


    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Session["degree"] = DDLDegree.SelectedItem.ToString();
            Session["branch"] = DDLBranch.SelectedItem.ToString();
            Session["regno"] = (TxtRegno.Text);
            Session["section"] = TxtSection.Text;
            Session["first_name"] = TxtFname.Text;
            Session["mid_name"] = TxtMidname.Text;
            Session["last_name"] = TxtLname.Text;
            Session["father_name"] = TxtFaname.Text;
            Session["DOB"] =  TxtDOB.Text.ToString();
            Session["gender"] = RBLGender.SelectedValue;
            Session["city"] = TxtCity.Text;
            Session["district"] = TxtDistrict.Text;
            Session["state"] = TxtState.Text;
            Session["pincode"] = TxtPincode.Text.ToString();
            Session["full_address"] = TxtAddr.Text;
            Session["res_phone"] = TxtRph.Text.ToString();
            Session["mobile_no"] = TxtMob.Text.ToString();
            Session["email_id"] = TxtMail.Text;
            Session["placement_option"] = RBLPo.SelectedValue;
            Session["core_only"] = RBLCO.SelectedValue; 
            Session["hoste_dascholar"] = RBLHostel.SelectedValue;
            Session["nationality"] = TxtNationality.Text;
            Session["Adm_category"] = TxtAC.Text;
            Session["cert_availability"] =RblCf.SelectedValue;
            Session["skill_set"] =  TxtSkillset.Text;
            Session["duration"] = TxtDur.Text;
            Session["company"] = TxtVendor.Text;
            Session["pancard"] = RBLPan.SelectedValue;
            Session["passport"] = RBLPassport.SelectedValue;
             Session["aadhar"] = RBLAadhar.SelectedValue;


            SqlConnection conn = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("[check_email]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@regno", Convert.ToInt32(TxtRegno.Text));
            cmd.Parameters.AddWithValue("@email", TxtMail.Text);
            conn.Open();

           
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dsscheckemail = new DataSet();
            adapter.Fill(dsscheckemail, "CheckingEmail");

            if (dsscheckemail.Tables[0].Rows.Count > 0)
            {
                int errorcode;
                errorcode = (int)dsscheckemail.Tables[0].Rows[0]["errorcode"];
                
                    if (errorcode == 4)
                    {
                        int regno = Convert.ToInt32(TxtRegno.Text);
                        string lblStatus = (string)dsscheckemail.Tables[0].Rows[0]["errmsg"].ToString();
                        SendActivationEmail(regno);
                        ClientScript.RegisterStartupScript(GetType(), "MessageBox", "alert('" + lblStatus + "');", true);
                       // ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "');", true);
                        
                    }
                    else{
                        string lblStatus = (string)dsscheckemail.Tables[0].Rows[0]["errmsg"].ToString();
                        //ClientScript.RegisterStartupScript(GetType(), "MessageBox", "alert('" + lblStatus + "');", true);
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "');", true);

                    }
                }
                conn.Close();



            }
       


        catch (Exception ex)
        {
            lblStatus.Text = "error" + ex;

        }
    }
   
    private void SendActivationEmail(int userId)
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string activationCode = Guid.NewGuid().ToString();
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        using (MailMessage mm = new MailMessage("sender@gmail.com", TxtMail.Text))
        {
            mm.Subject = "Account Activation";
            string body = "Hello " + TxtFname.Text.Trim() + ",";
            body += "<br /><br />Please click the following link to activate your account";
            body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("registration.aspx", "CS_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
            body += "<br /><br />Thanks";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("saisrineha@gmail.com", "neha2396");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
           
         
        }
    }
    //private void ClearControl(Control control)
    //{
    //    var textbox = control as TextBox;
    //    if (textbox != null)
    //    {
    //        textbox.Text = string.Empty;
    //    }

    //    var dropDownList = control as DropDownList;
    //    if (dropDownList != null)
    //    {
    //        dropDownList.ClearSelection();
    //    }
    //    var radioButtonList = control as RadioButtonList;
    //    if (radioButtonList != null)
    //    {
    //        radioButtonList.ClearSelection();
    //    }


    //    foreach (Control childControl in control.Controls)
    //    {
    //        ClearControl(childControl);
    //    }
    //}




    protected void BtnReset_Click(object sender, EventArgs e)
    {
        //ClearControl(this);
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }



    protected void change(object sender, EventArgs e)
    {
        if (RblCf.SelectedItem.Text == "Yes")
        {
            skillset.Visible = true;
            skillset2.Visible = true;
            skillset3.Visible = true;
        }
    }
}