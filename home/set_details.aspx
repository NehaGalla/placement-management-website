<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="company_registration.aspx.cs" Inherits="home_company_registration"
    EnableEventValidation="false" %>

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
            <li><a href="Registered%20students.aspx">Registered students</a></li>
            <li><a href="selection%20criteria.aspx">selection criteria</a></li>
            <li><a href="sending%20mail.aspx">sending mail</a> </li>
            <li><a href="confirmation%20links.aspx">confirmation links</a></li>
            <li><a href="company_registration.aspx">confirmation links</a></li>
        </ul>
    </div>
    <div class="table-responsive" style="padding-top: 220px; padding-left: 350px">

    </div>
</asp:Content>
