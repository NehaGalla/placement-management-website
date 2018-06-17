<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="student_database.aspx.cs" Inherits="home_student_database" %>

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
            <li><a href="welcome%20admin.aspx" style="color: White">Admin Home</a></li>
            <li><a href="student_database.aspx" style="color: White">upload student database</a></li>
            
            <li><a href="selection%20criteria.aspx" style="color: White">selection criteria</a></li>
            <li><a href="sending%20mail.aspx" style="color: White">sending mail</a> </li>
            <li><a href="confirmation%20links.aspx" style="color: White">confirmation links</a></li>
            <li><a href="All%20registered%20students.aspx" style="color: White">All_registered_students.aspx</a></li>
        </ul>
    </div>
    <div class="container" style="padding-left:350px;padding-top:400px">
   <asp:Panel ID="Panel1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="btnUpload" runat="server" Text="Upload"
             OnClick="btnUpload_Click" />
              <asp:Button ID="btnClear" runat="server" Text="Clear student data"
             OnClick="btnClear_Click" />

    <br />
    <asp:Label ID="lblMessage" runat="server" Text="" />
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Visible = "false" >
    <asp:Label ID="Label5" runat="server" Text="File Name"/>
    <asp:Label ID="lblFileName" runat="server" Text=""/>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Select Sheet" />
    <asp:DropDownList ID="ddlSheets" runat="server"
                    AppendDataBoundItems = "true">
   </asp:DropDownList>
    <br />
   <%-- <asp:Label ID="Label3" runat="server" Text="Enter Source Table Name"/>
    <asp:TextBox ID="txtTable" runat="server"></asp:TextBox>--%>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Has Header Row?" />
    <br />
    <asp:RadioButtonList ID="rbHDR" runat="server">
        <asp:ListItem Text = "Yes" Value = "Yes" Selected = "True" >
        </asp:ListItem>
        <asp:ListItem Text = "No" Value = "No"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save"
          OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                
 </asp:Panel>
 </div>

</asp:Content>
