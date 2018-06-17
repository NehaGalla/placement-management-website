<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="Photo Gallery.aspx.cs" Inherits="home_Photo_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
<center><div id="myCarousel" class="carousel slide" data-ride="carousel" style="top:200px;left:150px">
  <!-- Indicators -->
  <ol class="carousel-indicators" >
    <li data-target="#myCarousel" data-slide-to="0" class="active" style="color:Black"></li>
    <li data-target="#myCarousel" data-slide-to="1" style="color:Black"></li>
    <li data-target="#myCarousel" data-slide-to="2" style="color:Black"></li>
    <li data-target="#myCarousel" data-slide-to="3" style="color:Black"></li>
    <li data-target="#myCarousel" data-slide-to="4" style="color:Black"></li>
    <li data-target="#myCarousel" data-slide-to="5" style="color:Black"></li>
  
  </ol>

  <!-- Wrapper for slides -->
 <div class="carousel-inner" role="listbox"  >
    <div class="item active">  
    <img src="images/new6.jpg" alt="" width="800px" height="300" />
       
      <div class="carousel-caption"  >
        <h3 style="color:Black">PLACEMENT OFFICE</h3>
     
      </div>
    </div>

    

    <div class="item">
     
        <img src="images/new2.jpg" alt="" width="800px" height="300" />
      <div class="carousel-caption"  >
      
        <h3 style="color:Black">AUDITORIUM</h3>
       
      </div>
    </div>

    <div class="item">
        <img src="images/new3.jpg" alt="" width="800px" height="300" />
      <div class="carousel-caption">
        <h3 style="color:Black">CONFERENCE HALL</h3>
        
      </div>
    </div>
    <div class="item">
     
        <img src="images/new4.jpg" alt="" width="800px" height="300" />
      <div class="carousel-caption"  >
      
        <h3 style="color:Black" >INTERVIEW PANNEL ROOMS</h3>
        
      </div>
    </div>
    <div class="item">
     
        <img src="images/new5.jpg" alt="" width="800px" height="300" />
      <div class="carousel-caption"  >
      
        <h3 style="color:Black" >PLACEMENT OFFICE</h3>
        
      </div>
    </div>
    <div class="item">
      <img src="images/66.jpg" alt="" width="800px" height="300" />
        
      <div class="carousel-caption"  >
      
        <h3 style="color:Black" >TRAINING HALL</h3>
        
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="float:left;">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="float:left;position:absolute"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="float:left">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="float:right;position:absolute"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</center>
</asp:Content>
