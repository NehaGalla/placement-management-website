<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="Industrial Collaboration.aspx.cs" Inherits="home_Industrial_Collaboration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
    <div class="container" style="position: absolute; padding-top: 200px;">
        <div class="row">
            <div class="collaboration">
            </div>
            <div class="container" style="padding-top: 20px; position: absolute; width: 100%;top: 210px">
                
                  <h1 style="color:White;padding-left:350px;padding-top:00px;font-family:@Copperplate Gothic Bold;color:Black"><b>INDUSTRIAL COLLABORATION</b></h1>
                <div class="container" style="width: 500px; float: left;padding-top:20px;position:absolute">
                    <p style="padding-left: 150px; color: white; left: 500px;font-family:Copperplate Gothic Light;color:Black">
                        Sathyabama University signed MOUs with the following industries for the purpose
                        of enriching the Technical Education process and to jointly work for enriching the
                        quality of Education imparted to students of all the Engineering disciplines.</p>
                    <ul class="list-group" style="padding-left: 190px;font-family:Copperplate Gothic Light;color:Black">
                        <li>Cognizant</li>
                        <li>FL Smidth</li>
                        <li>Infosys</li>
                        <li>Accenture</li>
                        <li>CSC</li>
                        <li>Emerson</li>
                        <li>Virtusa</li>
                        <li>Wipro</li>
                    </ul>
                </div>
                <div class="w3-content w3-section" style="max-width: 800px; float: right; left: 750px; padding-top:0px;
                    position: absolute; width: 500px">
                   
                    <img class="mySlides" src="images/001.png" style="width: 100%;height:345px" alt="">
                    <img class="mySlides" src="images/002.png" style="width: 100%;height:345px" alt="">
                    <img class="mySlides" src="images/003.png" style="width: 100%;height:345px" alt="">
                    <img class="mySlides" src="images/004.png" style="width: 100%;height:345px" alt="">
                    <img class="mySlides" src="images/005.png" style="width: 100%;height:345px" alt="">
                </div>
            </div>
            <script type="text/javascript">
                var myIndex = 0;
                carousel();

                function carousel() {
                    var i;
                    var x = document.getElementsByClassName("mySlides");
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    myIndex++;
                    if (myIndex > x.length) { myIndex = 1 }
                    x[myIndex - 1].style.display = "block";
                    setTimeout(carousel, 2000); // Change image every 2 seconds
                }
            </script>
        </div>
    </div>
</asp:Content>
