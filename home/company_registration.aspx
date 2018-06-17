<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="company_registration.aspx.cs" Inherits="home_company_registration" EnableEventValidation="false" %>

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
    <div class="table-responsive" style="padding-top:220px; padding-left:350px">
    <table class="table-responsive" id="new_registration" width="800px" height="100%" runat="server" style="padding-left: 00px;padding-right:00px;padding-top: 400px;border-width:5px;border-color:Gray;border-style:solid">
    <tr><td><h2>COMPANY NAME:</h2></td></tr>
    <%--<tr><td>
        <asp:Label ID="Label1" runat="server" Text="DEGREE"></asp:Label></td>
        <td><asp:TextBox ID="TxtDegree" runat="server"></asp:TextBox></td></tr>
       <tr><td> <asp:Label ID="Label2" runat="server" Text="BRANCH"></asp:Label></td>
  <td> <asp:TextBox ID="TxtBranch" runat="server"></asp:TextBox></td></tr>--%>
<tr><td>  <asp:Label ID="Label3" runat="server" Text="REGNO"></asp:Label></td><td><asp:TextBox ID="TxtRegno" runat="server"></asp:TextBox></td></tr>
<%--<tr><td><asp:Label ID="Label4" runat="server" Text="FULL NAME"></asp:Label></td><td><asp:TextBox ID="TxtFlName" runat="server"></asp:TextBox></td></tr>--%>
<tr><td>
    <asp:Button ID="BtnSubmit" runat="server" Text="SUBMIT" OnClick="BtnSubmit_Click" /></td></tr>
    <tr><td> <asp:GridView runat="server" ID="gvDetails" ShowHeader="true" AllowPaging="false"
                            PageSize="10" AutoGenerateColumns="false" Width="420px" CssClass="Gridview" DataKeyNames="Degree">
                            <Columns>
                                  <asp:BoundField DataField="Regno" HeaderText="Regno" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="NameofTheStudent" HeaderText="Name" ItemStyle-Width="120px" />
                                </Columns></asp:GridView></td></tr>
    </table>
    </div>
   <%-- <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>--%>
<%--<cc1:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
    PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
    <div class="header">
        Modal Popup
    </div>
    <div class="body">
        This is a Modal Popup.
        <br />
       <asp:Button ID="btnHide" runat="server" OnClick="load_page" Text="Hide Modal Popup" />
      
    </div>
</asp:Panel>--%>
    </asp:Content>
