using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Activities;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


public partial class home_selection_criteria : System.Web.UI.Page
{
    public int jobid = 1;
    string strcon = @"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True";
    private object ex;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            
            this.PopulateDegree();
            this.PopulateBranch();
            BindGridview();
           
           
        }

    }
    public static string TestSessionValue
    {
        get
        {
            object value = HttpContext.Current.Session["TestSessionValue"];
            return value == null ? "" : (string)value;
        }
        set
        {
            HttpContext.Current.Session["TestSessionValue"] = value;
        }
    }
    IEnumerable<int> Series(int k = 0, int n = 1, int c = 1)
    {
        while (true)
        {
            yield return k;
            k = (c * k) + n;
        }
    }

    



    //public DropDownList getBranch1()
    //{
    //    ArrayList sections = new ArrayList();
    //    DropDownList selected = new DropDownList();

    //    for (int i = 0; i < cblBE.Items.Count; i++)
    //    {

    //        if (cblBE.Items[i].Selected)
    //        {

    //            sections.Add(cblBE.Items[i].Value);

    //        }
    //    }

    //    foreach (string item in sections)
    //    {
    //        selected.Items.Add(item);
    //        selected.DataBind();
    //    }
    //    return selected;
    //}
    //public DropDownList getbranch2()
    //{
    //    ArrayList sections = new ArrayList();
    //    DropDownList selected = new DropDownList();

    //    for (int i = 0; i < CblBtech.Items.Count; i++)
    //    {

    //        if (CblBtech.Items[i].Selected)
    //        {

    //            sections.Add(CblBtech.Items[i].Value);

    //        }
    //    }

    //    foreach (string item in sections)
    //    {
    //        selected.Items.Add(item);
    //        selected.DataBind();
    //    }
    //    return selected;
    //}

    //public DropDownList getbranch4()
    //{
    //    ArrayList sections = new ArrayList();
    //    DropDownList selected = new DropDownList();

    //    for (int i = 0; i < CblArts.Items.Count; i++)
    //    {

    //        if (CblArts.Items[i].Selected)
    //        {

    //            sections.Add(CblArts.Items[i].Value);

    //        }
    //    }

    //    foreach (string item in sections)
    //    {
    //        selected.Items.Add(item);
    //        selected.DataBind();
    //    }
    //    return selected;
    //}
    //public DropDownList getbranch5()
    //{
    //    ArrayList sections = new ArrayList();
    //    DropDownList selected = new DropDownList();

    //    for (int i = 0; i < cblMtech.Items.Count; i++)
    //    {

    //        if (cblMtech.Items[i].Selected)
    //        {

    //            sections.Add(cblMtech.Items[i].Value);

    //        }
    //    }

    //    foreach (string item in sections)
    //    {
    //        selected.Items.Add(item);
    //        selected.DataBind();
    //    }
    //    return selected;
    //}
    //public DropDownList getbranch6()
    //{
    //    ArrayList sections = new ArrayList();
    //    DropDownList selected = new DropDownList();

    //    for (int i = 0; i < cblMarch.Items.Count; i++)
    //    {

    //        if (cblMarch.Items[i].Selected)
    //        {

    //            sections.Add(cblMarch.Items[i].Value);

    //        }
    //    }

    //    foreach (string item in sections)
    //    {
    //        selected.Items.Add(item);
    //        selected.DataBind();
    //    }
    //    return selected;
    //}
    //public RadioButtonList getGender()
    //{
    //    RadioButtonList selected = new RadioButtonList();
    //    ArrayList sections = new ArrayList();
    //    for (int i = 0; i < cblGender.Items.Count; i++)
    //    {

    //        if (cblGender.Items[i].Selected)
    //        {

    //            sections.Add(cblGender.Items[i].Value);

    //        }
    //    }

    //    foreach (string item in sections)
    //    {
    //        selected.Items.Add(item);
    //        selected.DataBind();
    //    }
    //    return selected;


    //}


    protected void Btngenerate_Click(object sender, EventArgs e)
    {
        
        //sendDetails();
        
            postJob();
            createTables();
            this.BindGridview();
            //this.eligibleStudents();
            this.SendBulkEmail();

             string something = txtgpa.Text;
        

    }
    
    protected void postJob()
    {
        
        using (SqlConnection con = new SqlConnection(strcon))
        {

            SqlCommand cmd = new SqlCommand("[ins_venue_details]");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@job_id", lblJobId.Text);
            cmd.Parameters.AddWithValue("@company_name", TxtCmpName.Text);
            cmd.Parameters.AddWithValue("@interview_date_time",Convert.ToDateTime(TxtDate.Text));
            cmd.Parameters.AddWithValue("@venue", TxtVenue.Text);
            cmd.Parameters.AddWithValue("@exp_date",Convert.ToDateTime(TxtExpDate.Text));
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }

    protected void createTables()
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {

            SqlCommand cmd = new SqlCommand("[create_temp_tables]");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@company_name", TxtCmpName.Text);
            //cmd.Parameters.AddWithValue("@column_name", TxtColumn.Text);  
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }



    private void PopulateDegree()
    {
        using (SqlConnection con = new SqlConnection(strcon))
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select degree from student_placement_registration";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = sdr["degree"].ToString();
                        cblDegree.Items.Add(item);
                    }
                }
                con.Close();
            }
        }
    private void PopulateBranch()
    {
        using (SqlConnection con = new SqlConnection(strcon))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "select branch  from student_placement_registration";
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    ListItem item = new ListItem();
                    item.Text = sdr["branch"].ToString();
                    cblBranch.Items.Add(item);
                }
            }
            con.Close();
        }
    }
    protected void insert_eligible_students(int reg, string comp_name)
    {
        string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("insert_eligibility_students"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@comp_name", comp_name);
                    cmd.Parameters.AddWithValue("@regno", reg);

                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        ltrErr.Text = "error" + ex;
                    }
                }
            }
        }
    }   
    protected void BindGridview()
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select Degree,branch,gender,tenth,twelth,avg,[Ist Attempt],Regno,Email from student_data";

        string condition = string.Empty;
        string condition2 = string.Empty;
        //  int condition3 = Convert.ToInt32(TxtTenth.Text);
        string condition6 = string.Empty;
        string condition7 = string.Empty;

        foreach (ListItem item in cblDegree.Items)
        {
            condition += item.Selected ? string.Format("'{0}',", item.Value) : string.Empty;
        }

        foreach (ListItem item2 in cblBranch.Items)
        {
            condition2 += item2.Selected ? string.Format("'{0}',", item2.Value) : string.Empty;
        }

        foreach (ListItem item3 in cblGender.Items)
        {
            condition6 += item3.Selected ? string.Format("'{0}',", item3.Value) : string.Empty;
        }
        foreach (ListItem item3 in cbl1stattempt.Items)
        {
            condition7 += item3.Selected ? string.Format("'{0}',", item3.Value) : string.Empty;
        }



        string condition3 = Txt10th.Text;
        string condition4 = Txt12th.Text;
        string condition5 = txtgpa.Text;


        if (!string.IsNullOrEmpty(condition))
        {
            condition = string.Format(" WHERE Degree IN ({0})", condition.Substring(0, condition.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition2))
        {
            condition2 = string.Format(" and branch IN ({0})", condition2.Substring(0, condition2.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition3))
        {
            condition3 = string.Format(" and tenth>=@tenth", condition3.Substring(0, condition3.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition4))
        {
            condition4 = string.Format(" and twelth>=@twelth", condition4.Substring(0, condition4.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition4))
        {
            condition5 = string.Format(" and avg>=@avg", condition4.Substring(0, condition5.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition6))
        {
            condition6 = string.Format(" and gender IN ({0})", condition6.Substring(0, condition6.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition7))
        {
            condition7 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query + condition + condition2 + condition3 + condition4 + condition5 + condition6 + condition7))
            {
                cmd.Parameters.AddWithValue("@tenth", Txt10th.Text);
                cmd.Parameters.AddWithValue("@twelth", Txt12th.Text);
                cmd.Parameters.AddWithValue("@avg", txtgpa.Text);
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
                            CheckBox ChkBoxHeader = (CheckBox)gvDetails.HeaderRow.FindControl("chkAll");
                            //GridViewCommandEventArgs e = new GridViewCommandEventArgs();
                           
                            ChkBoxHeader.Checked = true;
                            foreach (GridViewRow row in gvDetails.Rows)
                            {
                                CheckBox ChkBoxRows = (CheckBox)row.FindControl("slno");

                                if (ChkBoxHeader.Checked == true)
                                {
                                    int regno = Convert.ToInt32(row.Cells[1].Text);
                                    string comp_name = TxtCmpName.Text;
                                    insert_eligible_students(regno,comp_name);
                                    ChkBoxRows.Checked = true;
                                }
                                else
                                {
                                    ChkBoxRows.Checked = false;
                                }
                            }
                             
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

   
    //protected void SelectAll7_CheckedChanged(object sender, EventArgs e)
    //{
    //    foreach (ListItem listitem in cblBE.Items)
    //    {
    //        listitem.Selected = SelectAll7.Checked;
    //    }

    //}
    //protected void SelectAll2_CheckedChanged(object sender, EventArgs e)
    //{
    //    foreach (ListItem listitem in CblBtech.Items)
    //    {
    //        listitem.Selected = SelectAll2.Checked;
    //    }
    //}
    //protected void SelectAll3_CheckedChanged(object sender, EventArgs e)
    //{
    //    foreach (ListItem listitem in CblArts.Items)
    //    {
    //        listitem.Selected = SelectAll3.Checked;
    //    }
    //}
    //protected void SelectAll4_CheckedChanged(object sender, EventArgs e)
    //{
    //    foreach (ListItem listitem in cblME.Items)
    //    {
    //        listitem.Selected = SelectAll4.Checked;
    //    }
    //}
    //protected void SelectAll5_CheckedChanged(object sender, EventArgs e)
    //{
    //    foreach (ListItem listitem in cblMtech.Items)
    //    {
    //        listitem.Selected = SelectAll5.Checked;
    //    }
    //}
    //protected void SelectAll6_CheckedChanged(object sender, EventArgs e)
    //{
    //    foreach (ListItem listitem in cblMarch.Items)
    //    {
    //        listitem.Selected = SelectAll6.Checked;
    //    }
    //}



    //protected void cbkBE_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (this.cbkBE.Checked)
    //    {
    //        this.trBE.Visible = true;
    //    }
    //    else
    //    {
    //        this.trBE.Visible = false;
    //    }

    //}
    //protected void cbkBTech_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (this.cbkBTech.Checked)
    //    {
    //        this.btech.Visible = true;
    //    }
    //    else
    //    {
    //        this.btech.Visible = false;
    //    }
    //}

    //protected void cbkArts_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (this.cbkArts.Checked)
    //    {
    //        this.arts.Visible = true;
    //    }
    //    else
    //    {
    //        this.arts.Visible = false;
    //    }
    //}

    //protected void cbkME_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (this.cbkME.Checked)
    //    {
    //        this.trME.Visible = true;
    //    }
    //    else
    //    {
    //        this.trME.Visible = false;
    //    }
    //}
    //protected void cbkMTech_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (this.cbkMTech.Checked)
    //    {
    //        this.trMTech.Visible = true;
    //    }
    //    else
    //    {
    //        this.trMTech.Visible = false;
    //    }
    //}
    //protected void cbkMArch_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (this.cbkMArch.Checked)
    //    {
    //        this.trMArch.Visible = true;
    //    }
    //    else
    //    {
    //        this.trMArch.Visible = false;
    //    }
    //}




    protected void SendBulkEmail()
    {
        //Create a temporary DataTable
        DataTable dtCustomers = new DataTable();
        dtCustomers.Columns.AddRange(new DataColumn[2] { new DataColumn("NameofTheStudent", typeof(string)),
                        new DataColumn("Email",typeof(string))});


        //Copy the Checked Rows to DataTable
        foreach (GridViewRow row in gvDetails.Rows)
        {
            if ((row.FindControl("slno") as CheckBox).Checked)
            {
                dtCustomers.Rows.Add(row.Cells[2].Text, (row.FindControl("lnkEmail") as HyperLink).Text);

            }
        }
        Session["StdEmail"] = dtCustomers;

        Response.Redirect("sending mail.aspx");
    }
    private void ClearControl(Control control)
    {
        var textbox = control as TextBox;
        if (textbox != null)
        {
            textbox.Text = string.Empty;
        }

        var dropDownList = control as DropDownList;
        if (dropDownList != null)
        {
            dropDownList.ClearSelection();
        }
        var checkBoxList = control as CheckBoxList;
        if (checkBoxList != null)
        {
            checkBoxList.ClearSelection();

        }


        foreach (Control childControl in control.Controls)
        {
            ClearControl(childControl);
        }
    }

    protected void BtnReset_Click(object sender, EventArgs e)
    {
        ClearControl(this);

    }
}
