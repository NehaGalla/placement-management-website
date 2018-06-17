using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
public partial class CS_Activation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM UserActivation WHERE ActivationCode = @ActivationCode"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                        cmd.Connection = con;
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                        if (rowsAffected == 1)
                        {
                            ltMessage.Text = "Activation successful.Please verify your details,upload resume and click submit to finish registration";
                            this.verification.Visible = true;
                            string degree = (string)(Session["degree"]);
                            string branch = (string)(Session["branch"]);
                            string regno = (string)(Session["regno"]);
                            string section = (string)(Session["section"]);

                            string first_name = (string)(Session["first_name"]);
                            string mid_name = (string)(Session["mid_name"]);
                            string last_name = (string)(Session["last_name"]);
                            string father_name = (string)(Session["father_name"]);
                            string DOB = (string)(Session["DOB"]);
                            string gender = (string)(Session["gender"]);
                            string city = (string)(Session["city"]);
                            string district = (string)(Session["district"]);
                            string state = (string)(Session["state"]);
                            string pincode = (string)(Session["pincode"]);
                            string full_address = (string)(Session["full_address"]);
                            string res_phone = (string)(Session["res_phone"]);
                            string mobile_no = (string)(Session["mobile_no"]);
                            string email_id = (string)(Session["email_id"]);
                            string placement_option = (string)(Session["placement_option"]);
                            string core_only = (string)(Session["core_only"]);
                            string hoste_dascholar = (string)(Session["hoste_dascholar"]);
                            string nationality = (string)(Session["nationality"]);
                            string Adm_category = (string)(Session["Adm_category"]);
                            string cert_availability = (string)(Session["cert_availability"]);
                            string skill_set = (string)(Session["skill_set"]);
                            string duration = (string)(Session["duration"]);
                            string company = (string)(Session["company"]);
                            string pancard = (string)(Session["pancard"]);
                            string passport = (string)(Session["passport"]);
                            string aadhar = (string)(Session["aadhar"]);
                            DDLDegree.SelectedItem.Text = degree;
                            DDLBranch.SelectedItem.Text = branch;
                            (TxtRegno.Text) = regno;
                            TxtSection.Text = section;
                            TxtMidname.Text = mid_name;
                            TxtFname.Text = first_name;
                            TxtLname.Text = last_name;
                            TxtFaname.Text = father_name;
                            TxtDOB.Text = DOB;

                            RBLGender.SelectedValue = gender;


                            TxtCity.Text = city;
                            TxtDistrict.Text = district;
                            TxtState.Text = state;
                            TxtPincode.Text = pincode;
                            TxtAddr.Text = full_address;
                            TxtRph.Text = res_phone;
                            TxtMob.Text = mobile_no;
                            TxtMail.Text = email_id;
                            RBLPo.SelectedValue = placement_option;
                            RBLCO.SelectedValue = core_only;
                            RBLHostel.SelectedValue = hoste_dascholar;
                            TxtNationality.Text = nationality;
                            TxtAC.Text = Adm_category;
                            RblCf.SelectedValue = cert_availability;
                            TxtSkillset.Text = skill_set;
                            TxtDur.Text = duration;
                            TxtVendor.Text = company;
                            RBLPan.SelectedValue = pancard;
                            RBLPassport.SelectedValue = passport;
                            RBLAadhar.SelectedValue = aadhar;

                        }
                        else
                        {
                            ltMessage.Text = "Invalid Activation code.";
                        }
                    }
                }
            }
        }
       // BindGrid();
    }
    protected void cngGender_Click(object sender, EventArgs e)
    {
        this.RBLGender.Visible = true;
        // TxtGender.Text = RBLGender.SelectedItem.ToString();
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                try
                {

                    SqlConnection conn = new SqlConnection(@"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand("sp_placement_registration", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@degree", DDLDegree.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@branch", DDLBranch.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@regno", Convert.ToInt32(TxtRegno.Text));
                    cmd.Parameters.AddWithValue("@section", TxtSection.Text);
                    cmd.Parameters.AddWithValue("@first_name", TxtFname.Text);
                    cmd.Parameters.AddWithValue("@last_name", TxtLname.Text);
                    cmd.Parameters.AddWithValue("@mid_name", TxtMidname.Text.ToString());
                    cmd.Parameters.AddWithValue("@father_name", TxtFaname.Text);
                    cmd.Parameters.AddWithValue("@DOB", TxtDOB.Text.ToString());
                    cmd.Parameters.AddWithValue("@gender", RBLGender.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@city", TxtCity.Text);
                    cmd.Parameters.AddWithValue("@district", TxtDistrict.Text);
                    cmd.Parameters.AddWithValue("@state", TxtState.Text);
                    cmd.Parameters.AddWithValue("@pincode", (TxtPincode.Text.ToString()));
                    cmd.Parameters.AddWithValue("@full_address", TxtAddr.Text);
                    cmd.Parameters.AddWithValue("@res_phone", (TxtRph.Text.ToString()));
                    cmd.Parameters.AddWithValue("@mobile_no", (TxtMob.Text.ToString()));
                    cmd.Parameters.AddWithValue("@email_id", TxtMail.Text);
                    cmd.Parameters.AddWithValue("@placement_option", RBLPo.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@core_only", RBLCO.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@hoste_dascholar", RBLHostel.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@nationality", TxtNationality.Text);
                    cmd.Parameters.AddWithValue("@Adm_category", TxtAC.Text);
                    cmd.Parameters.AddWithValue("@cert_availability", RblCf.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@skill_set", TxtSkillset.Text);
                    cmd.Parameters.AddWithValue("@duration", TxtDur.Text);
                    cmd.Parameters.AddWithValue("@company", TxtVendor.Text);
                    cmd.Parameters.AddWithValue("@pancard", RBLPan.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@passport", RBLPassport.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@aadhar", RBLAadhar.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@resume", bytes);
                    conn.Open();


                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dsstudentregistration = new DataSet();
                    adapter.Fill(dsstudentregistration, "StudentRegistration");

                    if (dsstudentregistration.Tables[0].Rows.Count > 0)
                    {
                        int errorcode;
                        errorcode = (int)dsstudentregistration.Tables[0].Rows[0]["errcode"];

                        if (errorcode == 200)
                        {

                            string lblStatus = (string)dsstudentregistration.Tables[0].Rows[0]["errmsg"].ToString();

                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + lblStatus + "');", true);

                        }
                        else
                        {
                            string lblStatus = (string)dsstudentregistration.Tables[0].Rows[0]["errmsg"].ToString();
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
        }
    }
    //private void BindGrid()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "select regno, resume from student_placement_registration";
    //            cmd.Connection = con;
    //            con.Open();
    //            GridView1.DataSource = cmd.ExecuteReader();
    //            GridView1.DataBind();
    //            con.Close();
    //        }
    //    }
    //}
    //protected void View(object sender, EventArgs e)
    //{
    //    int id = int.Parse((sender as LinkButton).CommandArgument);
    //    string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"500px\" height=\"600px\">";
    //    embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
    //    embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
    //    embed += "</object>";
    //    ltEmbed.Text = string.Format(embed, ResolveUrl("~/FileCS.ashx?Id="), id);
    //}
}