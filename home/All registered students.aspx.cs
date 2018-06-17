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
using System.Text.RegularExpressions;
using System.Collections;
using System.IO;
public partial class home_All_registered_students : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        bindGrid();
        if (IsPostBack)
        {
            PopulateCheckBoxArray();
            bindGrid();
            
        }
      
    }
    private void PopulateCheckBoxArray()
    {
        ArrayList CheckBoxArray;
        if (ViewState["CheckBoxArray"] != null)
        {
            CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
        }
        else
        {
            CheckBoxArray = new ArrayList();
        }

        int CheckBoxIndex;
        bool CheckAllWasChecked = false;
        CheckBox chkAll = (CheckBox)gvDetails.HeaderRow.Cells[0].FindControl("chkAll");
        string checkAllIndex = "chkAll-" + gvDetails.PageIndex;
        if (chkAll.Checked)
        {
            if (CheckBoxArray.IndexOf(checkAllIndex) == -1)
            {
                CheckBoxArray.Add(checkAllIndex);
            }
        }
        else
        {
            if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
            {
                CheckBoxArray.Remove(checkAllIndex);
                CheckAllWasChecked = true;
            }
        }
        for (int i = 0; i < gvDetails.Rows.Count; i++)
        {
            if (gvDetails.Rows[i].RowType == DataControlRowType.DataRow)
            {
                CheckBox chk = (CheckBox)gvDetails.Rows[i].Cells[0].FindControl("slno");
                CheckBoxIndex = gvDetails.PageSize * gvDetails.PageIndex + (i + 1);
                if (chk.Checked)
                {
                    if (CheckBoxArray.IndexOf(CheckBoxIndex) == -1 && !CheckAllWasChecked)
                    {
                        CheckBoxArray.Add(CheckBoxIndex);
                    }
                }
                else
                {
                    if (CheckBoxArray.IndexOf(CheckBoxIndex) != -1 || CheckAllWasChecked)
                    {
                        CheckBoxArray.Remove(CheckBoxIndex);
                    }
                }
            }
        }
        ViewState["CheckBoxArray"] = CheckBoxArray;
    }
    protected void Search(object sender, EventArgs e)
    {
        this.bindGrid();
    }
    protected void bindGrid()
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select sd.Degree,sd.Branch,spr.Regno,spr.first_name,spr.mid_name,spr.last_name,spr.father_name,spr.DOB,spr.gender,sd.tenth,sd.YOP_1,sd.twelth,sd.YOP_2,sd.Diplamo,sd.YOP_3,sd.Sem1,sd.Sem2,sd.Sem3,sd.Sem4,sd.Sem5,sd.sem6,sd.sem7,sd.sem8,sd.avg,sd.Ist_Attempt,sd.Arrears,spr.city,spr.district,spr.state,spr.pincode,spr.full_address,spr.res_phone,spr.mobile_no,spr.email_id,spr.placement_option,spr.core_only,spr.hoste_dascholar,spr.section,spr.nationality,sd.Category,spr.cert_availability, spr.skill_set,spr.duration,spr.company,spr.pancard,spr.passport,spr.aadhar,spr.resume from student_placement_registration as spr inner join student_database as sd on spr.regno = sd.regno WHERE spr.regno LIKE '%' + @regno +  '%'";;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@regno", txtSearch.Text.Trim());
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    gvDetails.DataSource = dt;
                    gvDetails.DataBind();
                }
            }
        }
    }
    private void ResetCheckBoxes()
    {
        if (ViewState["CheckBoxArray"] != null)
        {
            ArrayList CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
            string checkAllIndex = "chkAll-" + gvDetails.PageIndex;

            if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
            {
                CheckBox chkAll = (CheckBox)gvDetails.HeaderRow.Cells[0].FindControl("chkAll");
                chkAll.Checked = true;
            }
            for (int i = 0; i < gvDetails.Rows.Count; i++)
            {

                if (gvDetails.Rows[i].RowType == DataControlRowType.DataRow)
                {
                    if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
                    {
                        CheckBox chk = (CheckBox)gvDetails.Rows[i].Cells[0].FindControl("slno");
                        chk.Checked = true;
                    }
                    else
                    {
                        int CheckBoxIndex = gvDetails.PageSize * (gvDetails.PageIndex) + (i + 1);
                        if (CheckBoxArray.IndexOf(CheckBoxIndex) != -1)
                        {
                            CheckBox chk = (CheckBox)gvDetails.Rows[i].Cells[0].FindControl("slno");
                            chk.Checked = true;
                        }
                    }
                }
            }
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /*Verifies that the control is rendered */
    }
    protected void filter_degree(object sender, EventArgs e)
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select sd.Degree,sd.Branch,spr.Regno,spr.first_name,spr.mid_name,spr.last_name,spr.father_name,spr.DOB,spr.gender,sd.tenth,sd.YOP_1,sd.twelth,sd.YOP_2,sd.Diplamo,sd.YOP_3,sd.Sem1,sd.Sem2,sd.Sem3,sd.Sem4,sd.Sem5,sd.sem6,sd.sem7,sd.sem8,sd.avg,sd.Ist_Attempt,sd.Arrears,spr.city,spr.district,spr.state,spr.pincode,spr.full_address,spr.res_phone,spr.mobile_no,spr.email_id,spr.placement_option,spr.core_only,spr.hoste_dascholar,spr.section,spr.nationality,sd.Category,spr.cert_availability, spr.skill_set,spr.duration,spr.company,spr.pancard,spr.passport,spr.aadhar,spr.resume from student_placement_registration as spr inner join student_database as sd on spr.regno = sd.regno";
        string condition = string.Empty;
        foreach (ListItem item in TxtDegree.Items)
        {
            condition += item.Selected ? string.Format("'{0}',", item.Value) : string.Empty;
        }
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query + condition))
            {
                //cmd.Parameters.AddWithValue("@tenth", TxtTenth.Text);
                //cmd.Parameters.AddWithValue("@twelth", TxtTwelth.Text);
                //cmd.Parameters.AddWithValue("@avg", TxtAvg.Text);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = con;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gvDetails.DataSource = dt;
                        gvDetails.DataBind();
                    }
                }
            }
        }

    }
    protected void View(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"1000px\" height=\"800px\">";
        embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
        embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
        embed += "</object>";
        ltEmbed.Text = string.Format(embed, ResolveUrl("~/FileCS.ashx?Id="), id);
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Text = Regex.Replace(e.Row.Cells[3].Text, txtSearch.Text.Trim(), delegate(Match match)
            {
                return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
            }, RegexOptions.IgnoreCase);
        }
    }
  
  
   
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvDetails.PageIndex = e.NewPageIndex;
        gvDetails.DataBind();
        ResetCheckBoxes();
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;

        Response.AddHeader("content-disposition",
         "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        gvDetails.AllowPaging = false;
        gvDetails.DataBind();

        gvDetails.HeaderRow.Style.Add("background-color", "#FFFFFF");
        gvDetails.HeaderRow.Cells[0].Visible = false;
        gvDetails.HeaderRow.Cells[1].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[2].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[3].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[4].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[5].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[6].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[7].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[8].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[9].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[10].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[11].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[12].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[13].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[14].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[15].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[16].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[17].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[18].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[19].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[20].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[21].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[22].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[23].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[24].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[25].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[26].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[27].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[28].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[29].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[30].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[31].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[32].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[33].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[34].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[35].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[36].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[37].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[38].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[39].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[40].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[41].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[42].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[43].Style.Add("background-color", "green");
        if (ViewState["CheckBoxArray"] != null)
        {
            ArrayList CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
            string checkAllIndex = "chkAll-" + gvDetails.PageIndex;
            int rowIdx = 0;
            for (int i = 0; i < gvDetails.Rows.Count; i++)
            {
                GridViewRow row = gvDetails.Rows[i];
                row.Visible = false;

                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (CheckBoxArray.IndexOf(i + 1) != -1)
                    {
                        row.Visible = true;
                        row.BackColor = System.Drawing.Color.White;
                        row.Cells[0].Visible = false;
                        row.Attributes.Add("class", "textmode");
                        if (rowIdx % 2 != 0)
                        {

                            row.Cells[1].Style.Add("background-color", "#C2D69B");
                            row.Cells[2].Style.Add("background-color", "#C2D69B");
                            row.Cells[3].Style.Add("background-color", "#C2D69B");
                            row.Cells[4].Style.Add("background-color", "#C2D69B");
                            row.Cells[5].Style.Add("background-color", "#C2D69B");
                            row.Cells[6].Style.Add("background-color", "#C2D69B");
                            row.Cells[7].Style.Add("background-color", "#C2D69B");
                            row.Cells[8].Style.Add("background-color", "#C2D69B");
                            row.Cells[9].Style.Add("background-color", "#C2D69B");
                            row.Cells[10].Style.Add("background-color", "#C2D69B");
                            row.Cells[11].Style.Add("background-color", "#C2D69B");
                            row.Cells[12].Style.Add("background-color", "#C2D69B");
                            row.Cells[13].Style.Add("background-color", "#C2D69B");
                            row.Cells[14].Style.Add("background-color", "#C2D69B");
                            row.Cells[15].Style.Add("background-color", "#C2D69B");
                            row.Cells[16].Style.Add("background-color", "#C2D69B");
                            row.Cells[17].Style.Add("background-color", "#C2D69B");
                            row.Cells[18].Style.Add("background-color", "#C2D69B");
                            row.Cells[19].Style.Add("background-color", "#C2D69B");
                            row.Cells[20].Style.Add("background-color", "#C2D69B");
                            row.Cells[21].Style.Add("background-color", "#C2D69B");
                            row.Cells[22].Style.Add("background-color", "#C2D69B");
                            row.Cells[23].Style.Add("background-color", "#C2D69B");
                            row.Cells[24].Style.Add("background-color", "#C2D69B");
                            row.Cells[25].Style.Add("background-color", "#C2D69B");
                            row.Cells[26].Style.Add("background-color", "#C2D69B");
                            row.Cells[27].Style.Add("background-color", "#C2D69B");
                            row.Cells[28].Style.Add("background-color", "#C2D69B");
                            row.Cells[29].Style.Add("background-color", "#C2D69B");
                            row.Cells[30].Style.Add("background-color", "#C2D69B");
                            row.Cells[31].Style.Add("background-color", "#C2D69B");
                            row.Cells[32].Style.Add("background-color", "#C2D69B");
                            row.Cells[33].Style.Add("background-color", "#C2D69B");
                            row.Cells[34].Style.Add("background-color", "#C2D69B");
                            row.Cells[35].Style.Add("background-color", "#C2D69B");
                            row.Cells[36].Style.Add("background-color", "#C2D69B");
                            row.Cells[37].Style.Add("background-color", "#C2D69B");
                            row.Cells[38].Style.Add("background-color", "#C2D69B");
                            row.Cells[39].Style.Add("background-color", "#C2D69B");
                            row.Cells[40].Style.Add("background-color", "#C2D69B");
                            row.Cells[41].Style.Add("background-color", "#C2D69B");
                            row.Cells[42].Style.Add("background-color", "#C2D69B");
                            row.Cells[43].Style.Add("background-color", "#C2D69B");
                        }
                        rowIdx++;
                    }
                }
            }
        }
        gvDetails.RenderControl(hw);
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.End();
    }
    protected void btnExportAll_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;

        Response.AddHeader("content-disposition",
         "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        gvDetails.AllowPaging = false;
        gvDetails.DataBind();

        gvDetails.HeaderRow.Style.Add("background-color", "#FFFFFF");
        gvDetails.HeaderRow.Cells[0].Visible = false;
        gvDetails.HeaderRow.Cells[1].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[2].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[3].Style.Add("background-color", "green");
        gvDetails.HeaderRow.Cells[4].Style.Add("background-color", "green");

        for (int i = 0; i < gvDetails.Rows.Count; i++)
        {
            GridViewRow row = gvDetails.Rows[i];
            row.BackColor = System.Drawing.Color.White;
            row.Cells[0].Visible = false;
            row.Attributes.Add("class", "textmode");
            if (i % 2 != 0)
            {
                row.Cells[1].Style.Add("background-color", "#C2D69B");
                row.Cells[2].Style.Add("background-color", "#C2D69B");
                row.Cells[3].Style.Add("background-color", "#C2D69B");
                row.Cells[4].Style.Add("background-color", "#C2D69B");
            }
        }
        gvDetails.RenderControl(hw);
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        BindGridview();
    }
    protected void BindGridview()
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select sd.Degree,sd.Branch,spr.Regno,spr.first_name,spr.mid_name,spr.last_name,spr.father_name,spr.DOB,spr.gender,sd.tenth,sd.YOP_1,sd.twelth,sd.YOP_2,sd.Diplamo,sd.YOP_3,sd.Sem1,sd.Sem2,sd.Sem3,sd.Sem4,sd.Sem5,sd.sem6,sd.sem7,sd.sem8,sd.avg,sd.Ist_Attempt,sd.Arrears,spr.city,spr.district,spr.state,spr.pincode,spr.full_address,spr.res_phone,spr.mobile_no,spr.email_id,spr.placement_option,spr.core_only,spr.hoste_dascholar,spr.section,spr.nationality,sd.Category,spr.cert_availability, spr.skill_set,spr.duration,spr.company,spr.pancard,spr.passport,spr.aadhar,spr.resume from student_placement_registration as spr inner join student_database as sd on spr.regno = sd.regno";

        string condition = string.Empty;
        string condition2 = string.Empty;
        //  int condition3 = Convert.ToInt32(TxtTenth.Text);
        string condition6 = string.Empty;
        string condition7 = string.Empty;
        string condition8 = string.Empty;
        string condition9 = string.Empty;
        string condition10 = string.Empty;
        string condition11 = string.Empty;
        string condition12 = string.Empty;
        string condition13 = string.Empty;

        foreach (ListItem item in TxtDegree.Items)
        {
            condition += item.Selected ? string.Format("'{0}',", item.Value) : string.Empty;
        }

        foreach (ListItem item2 in TxtBranch.Items)
        {
            condition2 += item2.Selected ? string.Format("'{0}',", item2.Value) : string.Empty;
        }

        foreach (ListItem item3 in CBLGender.Items)
        {
            condition6 += item3.Selected ? string.Format("'{0}',", item3.Value) : string.Empty;
        }
        foreach (ListItem item3 in CBLIstAttempt.Items)
        {
            condition7 += item3.Selected ? string.Format("'{0}',", item3.Value) : string.Empty;
        }
        foreach (ListItem item4 in cblPO.Items)
        {
            condition8 += item4.Selected ? string.Format("'{0}',", item4.Value) : string.Empty;
        }

        foreach (ListItem item5 in cblCO.Items)
        {
            condition9 += item5.Selected ? string.Format("'{0}',", item5.Value) : string.Empty;
        }

        foreach (ListItem item6 in cblCertAvailability.Items)
        {
            condition10 += item6.Selected ? string.Format("'{0}',", item6.Value) : string.Empty;
        }

        foreach (ListItem item7 in cblpan.Items)
        {
            condition11 += item7.Selected ? string.Format("'{0}',", item7.Value) : string.Empty;
        }

        foreach (ListItem item8 in cblpassport.Items)
        {
            condition12 += item8.Selected ? string.Format("'{0}',", item8.Value) : string.Empty;
        }

        foreach (ListItem item9 in cblaadhar.Items)
        {
            condition13 += item9.Selected ? string.Format("'{0}',", item9.Value) : string.Empty;
        }



        string condition3 = TxtTenth.Text;
        string condition4 = TxtTwelth.Text;
        string condition5 = TxtAvg.Text;


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
        if (!string.IsNullOrEmpty(condition8))
        {
            condition8 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition9))
        {
            condition9 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition10))
        {
            condition10 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition11))
        {
            condition11 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition12))
        {
            condition12 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        if (!string.IsNullOrEmpty(condition13))
        {
            condition13 = string.Format(" and Ist_Attempt IN ({0})", condition7.Substring(0, condition7.Length - 1));

        }
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query + condition + condition2 + condition3 + condition4 + condition5 + condition6 + condition7+ condition8 + condition9+ condition10+condition11+condition12+condition13))
            {
                cmd.Parameters.AddWithValue("@tenth", TxtTenth.Text);
                cmd.Parameters.AddWithValue("@twelth", TxtTwelth.Text);
                cmd.Parameters.AddWithValue("@avg", TxtAvg.Text);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = con;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gvDetails.DataSource = dt;
                        gvDetails.DataBind();
                    }
                }
            }
        }
    }
}


