<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="Welcome admin.aspx.cs" Inherits="home_welcome_admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
    <div class="container" style="position: absolute; padding-top: 200px; padding-left: 200px;">
        <div class="row">
            <div class="background">
                <center>  <h1 style="color:White;padding-top:130px">WELCOME ADMIN</h1></center>
                <center> <asp:ImageButton ID="UpdateWebiste" ImageUrl="~/home/update button.png" runat="server" Width="240px" Height="70px" ImageAlign="Middle" OnClick="UpdateWebsite_Click"/></center>
                <center><div><h3 style="color:White;padding-top:30px; position:relative">Set expiry date for registration</h3>
                 <asp:TextBox ID="ExpDate" runat="server"></asp:TextBox>
                <img src="images/calendar.png" />
                <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />  </center>
                <script src="images/jquery-1.4.1.min.js" type="text/javascript"></script>
                <script src="images/jquery.dynDateTime.min.js" type="text/javascript"></script>
                <script src="images/calendar-en.min.js" type="text/javascript"></script>
                <link href="images/calendar-blue.css" rel="stylesheet" type="text/css" />
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#<%=ExpDate.ClientID %>").dynDateTime({
                            showsTime: true,
                            ifFormat: "%Y/%m/%d %H:%M",
                            daFormat: "%l;%M %p, %e %m, %Y",
                            align: "BR",
                            electric: false,
                            singleClick: false,
                            displayArea: ".siblings('.dtcDisplayArea')",
                            button: ".next()"
                        });
                    });
                </script>
            </div>
        </div>
    </div>
    </div>
    <div class="navbar navbar-inverse navbar-fixed-left">
        <ul class="nav navbar-nav">
            <li><a href="welcome%20admin.aspx" style="color: White">Admin Home</a></li>
            <li><a href="student_database.aspx" style="color: White">Upload Student Database</a></li>
          
            <li><a href="selection%20criteria.aspx" style="color: White">Set Selection Criteria</a></li>
            <li><a href="sending%20mail.aspx" style="color: White">Send Mail</a> </li>
            <li><a href="confirmation%20links.aspx" style="color: White">Send Confirmation Links</a></li>
            <li><a href="All%20registered%20students.aspx" style="color: White">All_registered_students.aspx</a></li>
            <li>
                <asp:LinkButton ID="adlogin" runat="server">create admin login</asp:LinkButton></li></ul>
    </div>
</asp:Content>
