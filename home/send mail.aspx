<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="send mail.aspx.cs" Inherits="home_send_mail" %>

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
            <li><a href="Registered%20students.aspx">Registered students.aspx</a></li>
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
                   <asp:TextBox ID="TxtMessage" runat="server" Width="500px" Height="250px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
                <tr>
                    <td>
                     
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
