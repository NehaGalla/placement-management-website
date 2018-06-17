<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="confirmation links.aspx.cs" Inherits="home_confirmation_links" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
<div class="navbar navbar-inverse navbar-fixed-left">
        <ul class="nav navbar-nav">
            <li><a href="welcome%20admin.aspx">welcome admin.aspx</a></li>
            <li><a href="student_database.aspx">upload student database.aspx</a></li>
            
            <li><a href="selection%20criteria.aspx">selection criteria.aspx</a></li>
            <li><a href="sending%20mail.aspx">sending mail.aspx</a> </li>
            <li><a href="confirmation%20links.aspx">confirmation links.aspx</a></li>
            <li><a href="All%20registered%20students.aspx" style="color: White">All_registered_students.aspx</a></li>
        </ul>
    </div>
    <div class="table-responsive" style="padding-top:220px; padding-left:350px">
    <table class="table-responsive" id="new_registration" width="800px" height="100%" runat="server" style="padding-left: 00px;padding-right:00px;padding-top: 400px;border-width:5px;border-color:Gray;border-style:solid">
    <tr><td>
      <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Has Header ?"></asp:Label>
        <asp:RadioButtonList ID="rbHDR" runat="server">
            <asp:ListItem Text = "Yes" Value = "Yes" Selected = "True" ></asp:ListItem>
            <asp:ListItem Text = "No" Value = "No"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging = "PageIndexChanging">
      
         <Columns>
                                <asp:TemplateField>
                                <HeaderTemplate>
                            <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true"/>
                        </HeaderTemplate>
                                
                                    <ItemTemplate>
                                        <asp:CheckBox ID="slno" runat="server" Width="40px" /></ItemTemplate>
                                </asp:TemplateField>
        </Columns>
        </asp:GridView>
    </td></tr></table></div>
</asp:Content>
