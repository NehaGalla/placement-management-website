<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="view student details .aspx.cs" Inherits="home_view_student_details_" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <ul class="nav navbar-nav">
            <li><a href="welcome%20admin.aspx">welcome admin</a></li>
            <li><a href="student_database.aspx">student database</a></li>
            <li><a href="selection%20criteria.aspx">post jobs</a></li>
            <li><a href="sending%20mail.aspx">send mail</a> </li>
            <li><a href="confirmation%20links.aspx">confirmation links</a></li>
            <li><a href="All%20registered%20students.aspx" style="color: White">All_registered_students.aspx</a></li>
        </ul>
    </div>
   <div class="table-responsive" style="padding-left: 00px; padding-top: 200px">
        <table class="table" id="criteria" style="width: 1003px; border: 2px">
            <tr><td>
                <asp:Label ID="Label1" runat="server" Text="View student details"></asp:Label>
                <asp:DropDownList ID="ddlSelect" runat="server" OnSelectedIndexChanged="ddlselect_SelectedIndexChanged" AutoPostBack ="true">
                        <asp:ListItem Text="select" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Eligible Students" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Registered Students" Value="1"></asp:ListItem>
                    </asp:DropDownList></td></tr>
                    <tr><td>
                        <asp:Label ID="Label2" runat="server" Text="Company Name"></asp:Label></td><td>
                            <asp:DropDownList ID="ddlCompany" runat="server">
                           
                            </asp:DropDownList>
                        </td></tr>
                    <tr><td>  <asp:GridView runat="server" ID="gvDetails" ShowHeader="true" AllowPaging="false"
                            PageSize="10" AutoGenerateColumns="false" Width="1570px" CssClass="Gridview" DataKeyNames="Degree" >
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true"  Checked="false" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="slno" runat="server" Width="40px" /></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Degree" HeaderText="Degree" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="regno" HeaderText="Registration Number" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="first_name" HeaderText="Registration Number" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="last_name" HeaderText="Registration Number" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="mobile_no" HeaderText="Mobile Number" ItemStyle-Width="130px" />
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lnkEmail" runat="server" Text='<%# Eval("email_id") %>' NavigateUrl='<%# Eval("email_id", "mailto:{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="tenth" HeaderText="10th marks" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="twelth" HeaderText="12/diploma marks" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Avg" HeaderText="GPA" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Arrears" HeaderText="No Of Arrears" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Ist_Attempt" HeaderText="Gender" ItemStyle-Width="130px" />
                            </Columns>
                        </asp:GridView></td></tr>
                        <tr><td>
                            <asp:Literal ID="ltrerr" runat="server"></asp:Literal></td></tr>
        </table>
        </div>
</asp:Content>