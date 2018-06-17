 <%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master"
    AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="home_Home" %>
  
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="server">


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">

<div class="headers" style="padding-top:0px">
  <div class="something" >
<header>

        

    
   <img class="img-responsive" src="newwwwwwwwww.png" alt="" style="padding-top:80px;" />
   
   </header>
  
  </div>
  
  </div>
   
 <div id="carousel-example" class="carousel slide container carousel" data-ride="carousel" style="top:600px;width:100%;position:absolute;height:450px">
  <ol class="carousel-indicators">
    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example" data-slide-to="1"></li>
    <li data-target="#carousel-example" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner" style="width:100%;height:450px">
    <div class="item active">
      <a href="#"><img class="img-responsive" src="obj.jpg" alt="" width="100%" height="100%" /></a>
      <div class="carousel-caption">
       
      </div>
    </div>
    <div class="item">
      <a href="#"><img class="img-responsive" src="career.jpg" alt="" width="100%" height="100%"/></a>
      <div class="carousel-caption">
       
      </div>
    </div>
    <div class="item">
      <a href="#"><img class="img-responsive" src="placement.jpg"  alt="" width="100%" height="100%"/></a>
      <div class="carousel-caption">
    
      </div>
    </div>
  </div>

  <a class="left carousel-control" href="#carousel-example" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>

    
</asp:Content>



