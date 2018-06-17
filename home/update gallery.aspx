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
<div class="container" style="position: absolute; padding-top: 200px;padding-left:200px">
        <div class="row">
         <div class="background2">
           <div class="text" style="padding-right:400px" >
           <h2 style="padding-top:200px; float:none;color:White"><b>CONTROLS TO UPDATE<br /> WEBSITE'S CONTENT</b></h2></div>
              </div>
    </div>
      </div>
    <div class="navbar navbar-inverse navbar-fixed-left">
        <ul class="nav navbar-nav">
             <li><a href="welcome%20admin.aspx" style="color:White">admin home page</a></li>
            
            <li><a href="Update%20Industrial%20Collaboration.aspx" style="color:White">Update Industrial Collaboration</a></li>
            <li><a href="Update%20Eminent%20Recruiters.aspx" style="color:White">Update Eminent Recruiters</a>
            </li>
            <li><a href="update%20placement%20records.aspx" style="color:White">update placement records</a>
            </li>
            <li><a href="Update%20Online%20Assesments.aspx" style="color:White">Update Online Assesments</a>
            </li>
            
            <li><a href="update%20job%20openings.aspx" style="color:White">update job openings</a> </li>
            <li><a href="update%20gallery.aspx" style="color:White">update gallery</a> </li>
        </ul>
    </div>
   

</asp:Content>
