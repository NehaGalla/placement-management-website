<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="sending mail.aspx.cs" Inherits="home_sending_mail" %>

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
            <li><a href="student_database.aspx">student_database.aspx</a></li>
            
            <li><a href="selection%20criteria.aspx">selection criteria.aspx</a></li>
            <li><a href="sending%20mail.aspx">sending mail.aspx</a> </li>
            <li><a href="confirmation%20links.aspx">confirmation links.aspx</a></li>
            <li><a href="All%20registered%20students.aspx" style="color: White">All_registered_students.aspx</a></li>
        </ul>
    </div>
    <div class="table-responsive" style="padding-top: 220px; padding-left: 350px">
        <table class="table-responsive" id="mail" width="800px" runat="server" style="padding-left: 300px;
            padding-right: 200px; padding-top: 400px; border-width: 5px; border-color: Gray;
            border-style: solid">
            <tr>
                <td style="height: 60px; background-color: Black; width: 600px" colspan="2">
                    <h3 style="color: White">
                        NEW MAIL</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>
                        TO:</h3>
                </td>
                <td>
                    <asp:TextBox ID="MailId" runat="server" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>
                        SUBJECT:</h3>
                </td>
                <td>
                    <asp:TextBox ID="TxtSub" runat="server" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>
                        MESSAGE:</h3>
                </td>
                <td>
                    <div class="divMessage" contenteditable="true" style="width: 800px; height: 350px;
                        border: 5px dotted black; border-bottom: 5px dotted black">
                        <h6>
                            Dear students,<br />
                            we are happy to inform you that
                            <asp:Label runat="server" ID="lblCmpName" Text=""></asp:Label><pre />
                            is visiting us as part of their Campus Recruitment Program’2017 batch. Pls see the
                            below eligibility criteria and registration link. Company Name : Mindteck, Chennai
                            Date : Will be communicated through mail. Time : 8.00 AM Venue : Placement Cell
                            Auditorium, Sathyabama University Eligible Branches : B.E/B.Tech – CSE, IT, ECE,
                            EEE and EIE (1) A Minimum of 60% in the 10th & 12th. (2) A Minimum of 6 CGPA or
                            60% in the UG Degree. (3) A Minimum of 6 CGPA in the present degree. (4) No History
                            of Arrears.</h6>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                </td></tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TxtMsg" runat="server" TextMode="MultiLine" Width="500px" Height="250px"></asp:TextBox>
                        <asp:FileUpload ID="fuAttachment" runat="server" />
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSend" runat="server" Text="SEND" OnClick="load_email" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
