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
using System.Collections;

public partial class home_Placement_Records : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgridview();
        bindgridview2();
        bindgridview3();
        bindgridview4();
        bindgridview5();
        bindgridview6();
        bindgridview7();

    }
    public void bindgridview()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1812");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1636");
        dt.Rows.Add(3, "% of Students Placed", "90.24 (As on 26.6.2016) ");
        dt.Rows.Add(4, "Noteworthy Companies", "Cognizant, Infosys, Wipro, Capgemini, Aricent, iGate, Scope Intl, Oracle, Virtusa, TechMahindra, Payoda, RBS, Cybage, BnP, Bank of Newyork, MuSigma");
        dt.Rows.Add(5, "Average Salary", "Rs. 3.30,000 P.A");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public void bindgridview2()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1855");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1749");
        dt.Rows.Add(3, "% of Students Placed", "94.28* ");
        dt.Rows.Add(4, "Noteworthy Companies", "Cognizant, Infosys, Wipro, Capgemini, Aricent, iGate, Scope Intl, Oracle, Virtusa, TechMahindra, Payoda, RBS, Cybage, BnP, Bank of Newyork, MuSigma");
        dt.Rows.Add(5, "Average Salary", "Rs. 3.30,000 P.A");
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    public void bindgridview3()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1662");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1478");
        dt.Rows.Add(3, "% of Students Placed", "88.92 ");
        dt.Rows.Add(4, "Noteworthy Companies", "Cognizant, Infosys, Wipro, Capgemini, iGate, Scope Intl, Oracle, Sanmar, Virtusa and Cybage");
        dt.Rows.Add(5, "Average Salary", "Rs. 3.30,000 P.A");
        GridView3.DataSource = dt;
        GridView3.DataBind();
    }
    public void bindgridview4()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1812");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1636");
        dt.Rows.Add(3, "% of Students Placed", "90.24 (As on 26.6.2016) ");
        dt.Rows.Add(4, "Noteworthy Companies", "Cognizant, Infosys, Wipro, Capgemini, Aricent, iGate, Scope Intl, Oracle, Virtusa, TechMahindra, Payoda, RBS, Cybage, BnP, Bank of Newyork, MuSigma");
        dt.Rows.Add(5, "Average Salary", "Rs. 3.30,000 P.A");
        GridView4.DataSource = dt;
        GridView4.DataBind();
    }
    public void bindgridview5()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1734");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1427");
        dt.Rows.Add(3, "% of Students Placed", "82.3");
        dt.Rows.Add(4, "Cognizant, Wipro, Capgemini, Oracle, L&T InfoTech, ICICI, CSC, Indus Ind, Sanmar");
        dt.Rows.Add(5, "Average Salary", "Rs. 3,25,000 P.A");
        GridView5.DataSource = dt;
        GridView5.DataBind();
    }
    public void bindgridview6()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1868");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1776");
        dt.Rows.Add(3, "% of Students Placed", "95.07");
        dt.Rows.Add(4, "Noteworthy Companies", "Cognizant, Wipro, Accenture, Mindtree, SL Lumax, iGate, RBS, Cybage");
        dt.Rows.Add(5, "Average Salary", "Rs. 3,10,000 P.A");
        GridView6.DataSource = dt;
        GridView6.DataBind();
    }
    public void bindgridview7()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
        dt.Rows.Add(1, "Total No of Students Registered for Placement ", "1512");
        dt.Rows.Add(2, "Total No of Students Got Placed", "1085");
        dt.Rows.Add(3, "% of Students Placed", "71.76");
        dt.Rows.Add(4, "Noteworthy Companies", "Wipro, HCL, Infosys, ICICI, Capgemini, Hexaware, Patni, Logica, Mphasis, US Technologies");
        dt.Rows.Add(5, "Average Salary", "Rs. 2,65,000 P.A");
        GridView7.DataSource = dt;
        GridView7.DataBind();
    }
}