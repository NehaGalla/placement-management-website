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


public partial class home_Registered_students : System.Web.UI.Page
{
    string strcon = @"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);



                    if (!IsPostBack)
                    {
                        BindGridview();

                        // PopulateCheckBoxArray();

                    }


    }
    protected void chkboxSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ChkBoxHeader = (CheckBox)gvDetails.HeaderRow.FindControl("chkAll");
        foreach (GridViewRow row in gvDetails.Rows)
        {
            CheckBox ChkBoxRows = (CheckBox)row.FindControl("slno");
            if (ChkBoxHeader.Checked == true)
            {
                ChkBoxRows.Checked = true;
            }
            else
            {
                ChkBoxRows.Checked = false;
            }
        }


    }
    protected void BindGridview()
    {
        
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select Degree,Branch, Regno,Mobile,Email,tenth,twelth,Avg,Arrears,Gender,Ist_Attempt from student_data";

        string condition = string.Empty;
        string condition2 = string.Empty;
        //  int condition3 = Convert.ToInt32(TxtTenth.Text);
        string condition6 = string.Empty;
        string condition7 = string.Empty;

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
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query + condition + condition2 + condition3 + condition4 + condition5 + condition6 + condition7))
            {
                cmd.Parameters.AddWithValue("@tenth", TxtTenth.Text);
                cmd.Parameters.AddWithValue("@twelth", TxtTwelth.Text);
                cmd.Parameters.AddWithValue("@avg", TxtAvg.Text);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    try
                    {
                        cmd.Connection = con;
                        using (DataTable dt= new DataTable())
                        {
                            sda.Fill(dt);
                            gvDetails.DataSource = dt;
                            gvDetails.DataBind();
                            CheckBox ChkBoxHeader = (CheckBox)gvDetails.HeaderRow.FindControl("chkAll");
                            ChkBoxHeader.Checked = true;
                            foreach (GridViewRow row in gvDetails.Rows)
                            {
                                CheckBox ChkBoxRows = (CheckBox)row.FindControl("slno");
                                if (ChkBoxHeader.Checked == true)
                                {
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
  protected void Degree_Selected(object sender, EventArgs e)
    {
        this.BindGridview();
    }
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
            e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
        }
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        BindGridview();
    }

    //DataTable dt = new DataTable();
    //using (SqlConnection con = new SqlConnection(strcon))
    //{
    //    con.Open();
    //    //foreach(object d in TxtDegree.SelectedValue.ToString())
    //    //{
    //    //    object degree = d;
    //    //}
    //    if (TxtTenth.Text != "" && TxtTwelth.Text != "" && TxtAvg.Text != "" && TxtArrears.Text != "")
    //    {
    //        SqlCommand cmd = new SqlCommand("select * from student_data where tenth >= @tenth and twelth >= @twelth and Avg >= @Avg and Arrears <= @Arrears", con);
    //        // cmd.Parameters.AddWithValue("@Degree", TxtDegree.SelectedValue.ToString());
    //        //cmd.Parameters.AddWithValue("@Branch", TxtBranch.SelectedValue.ToString());
    //        cmd.Parameters.AddWithValue("@tenth", TxtTenth.Text);
    //        cmd.Parameters.AddWithValue("@twelth", TxtTenth.Text);
    //        cmd.Parameters.AddWithValue("@Avg", TxtTenth.Text);
    //        cmd.Parameters.AddWithValue("@Arrears", TxtTenth.Text);
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        da.Fill(dt);
    //    }

    //    else
    //    {
    //        SqlCommand cmd = new SqlCommand("select_student_data");
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        da.Fill(dt);
    //    }
    //    con.Close();
    //    gvDetails.DataSource = dt;
    //    gvDetails.DataBind();
    //}


    protected void composeMail(object sender, EventArgs e)
    {
        //this.gridviewtable.Visible = false;
        //this.mailTable.Visible = true;

    }
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



    protected void ExportToExcel(object sender, EventArgs e)
    {

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            gvDetails.AllowPaging = false;
            this.BindGridview();

            gvDetails.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in gvDetails.HeaderRow.Cells)
            {
                cell.BackColor = gvDetails.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in gvDetails.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = gvDetails.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = gvDetails.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            gvDetails.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        String strConnection = @"Data Source=NEHA\SQLEXPRESS;Initial Catalog=PLACEMENT;Integrated Security=True";

        DataTable dt = new DataTable();
        dt.Columns.Add("Degree", typeof(string));
        dt.Columns.Add("Branch", typeof(string));
        dt.Columns.Add("Regno", typeof(string));
        dt.Columns.Add("NameofTheStudent", typeof(string));
        dt.Columns.Add("Mobile", typeof(string));
        dt.Columns.Add("Email", typeof(string));
        dt.Columns.Add("tenth", typeof(string));
        dt.Columns.Add("twelth", typeof(string));
        dt.Columns.Add("Avg", typeof(string));
        dt.Columns.Add("Arrears", typeof(string));
        foreach (GridViewRow gvrow in gvDetails.Rows)
        {
            //Find checkbox control in gridview for particular row
            CheckBox chkSelect = (CheckBox)gvrow.FindControl("slno");
            //Condition to check checkbox selected or not
            if (chkSelect.Checked)
            {
                string Degree = (gvrow.Cells[1].Text);
                string Branch = gvrow.Cells[2].Text;
                string Regno = gvrow.Cells[3].Text;
                string NameofTheStudent = gvrow.Cells[4].Text;
                string Mobile = gvrow.Cells[5].Text;
                string Email = gvrow.Cells[6].Text.ToString();
                string tenth = gvrow.Cells[7].Text;
                string twelth = gvrow.Cells[8].Text;
                string Avg = gvrow.Cells[9].Text;
                string Arrears = gvrow.Cells[10].Text;
                dt.Rows.Add(Degree, Branch, Regno, NameofTheStudent, Mobile, Email, tenth, twelth, Avg, Arrears);
            }
        }
        using (SqlConnection con = new SqlConnection(strConnection))
        {
            con.Open();
            SqlBulkCopy sqlBulk = new SqlBulkCopy(strConnection);
            //Give your Destination table name
            sqlBulk.DestinationTableName = "eligible_students";
            sqlBulk.WriteToServer(dt);
            con.Close();
        }
        lblMsg.Text = "Details Inserted Successfully";
        lblMsg.ForeColor = System.Drawing.Color.Green;
    }

    protected void Btncreate_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(strcon))
        {

            SqlCommand cmd = new SqlCommand("[create_temp]");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TableName", TxtTable.Text);
            cmd.Parameters.AddWithValue("@column_name", TxtColumn.Text);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
}