<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="All registered students.aspx.cs" Inherits="home_All_registered_students"
    EnableEventValidation="false" %>
   
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
    <div class="navbar navbar-inverse navbar-fixed -top">
        <ul class="nav navbar-nav">
            <li><a href="welcome%20admin.aspx">welcome admin</a></li>
            <li><a href="student_database.aspx">student database</a></li>
            <li><a href="selection%20criteria.aspx">selection criteria</a></li>
            <li><a href="sending%20mail.aspx">sending mail</a> </li>
            <li><a href="confirmation%20links.aspx">confirmation links</a></li>
        </ul>
    </div>
     <div class="container-fluid" style="padding-left: 0px; padding-top: 215px; position:relative; width:100%; ">
        <center> <div class="GridviewDiv">
            <table style="overflow-x:scroll;" class="GridviewTable" id="gridviewtable" runat="server"
                visible="true">
                <tr><td> Search:
    <asp:TextBox ID="txtSearch" runat="server" />
    <asp:Button ID="BtnSearch" Text="Search" runat="server" OnClick="Search" /></td></tr>
                <tr>
                    <td style="width: 0px;">
                        Degree
                    </td>
                    <td style="width: 0px;">
                        Branch
                    </td>
                    <td style="width: 0px;">
                        10th marks
                    </td>
                    <td style="width: 0px;">
                        12th marks
                    </td>
                    <td style="width: 0px;">
                        GPA
                    </td>
                    <td style="width: 0px;">
                        No of Arrears
                    </td>
                     <td style="width: 0px;">
                        gender
                    </td>
                    <td style="width: 0px;">
                        1st attempt
                    </td>
                    <td style="width: 0px;">
                      placement option
                    </td>
                     <td style="width: 0px;">
                      core only
                    </td>
                    <td style="width: 0px;">
                     certficate availability
                    </td>
                    <td style="width: 0px;">
                     pan card
                    </td>
                    <td style="width: 0px;">
                     passport
                    </td>
                    <td style="width: 0px;">
                     aadhar
                    </td>
                </tr>
                <tr>
                    <td style="width: 0px;">
                        <asp:CheckBoxList ID="TxtDegree" runat="server" OnSelectedIndexChanged="filter_degree" AutoPostBack="false">
                            <asp:ListItem Value="B.E"></asp:ListItem>
                            <asp:ListItem Value="B.Tech"></asp:ListItem>
                        </asp:CheckBoxList>
                        <%--   <asp:TextBox ID="TxtDegree" runat="server" ></asp:TextBox>--%>
                    </td>
                    <td style="width: 0px;">
                        <asp:CheckBoxList ID="TxtBranch" runat="server"> <%--OnSelectedIndexChanged="filter_branch" AutoPostBack="true"--%>
                            <asp:ListItem Value="CSE"></asp:ListItem>
                            <asp:ListItem Value="IT"></asp:ListItem>
                        </asp:CheckBoxList>
                        <%--  <asp:TextBox ID="TxtBranch" runat="server" ></asp:TextBox>--%>
                    </td>
                    <td style="width: 0px;">
                        <asp:TextBox ID="TxtTenth" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 0px;">
                        <asp:TextBox ID="TxtTwelth" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 0px;">
                        <asp:TextBox ID="TxtAvg" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 0px;">  
                        <asp:TextBox ID="TxtArrears" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 0px;">
                        <asp:CheckBoxList ID="CBLGender" runat="server">
                        <asp:ListItem Value="Male"></asp:ListItem>
                        <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                    <td style="width: 0px;">
                        <asp:CheckBoxList ID="CBLIstAttempt" runat="server"> <%--OnSelectedIndexChanged="filter_attempt" AutoPostBack="true">--%>
                        <asp:ListItem Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                     <td style="width: 0px;">
                        <asp:CheckBoxList ID="cblPO" runat="server"> <%--OnSelectedIndexChanged="filter_PO" AutoPostBack="true">--%>
                        <asp:ListItem Value="Placements"></asp:ListItem>
                        <asp:ListItem Value="Higher Studies"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                     <td style="width: 0px;">
                        <asp:CheckBoxList ID="cblCO" runat="server"><%-- OnSelectedIndexChanged="filter_CO" AutoPostBack="true">--%>
                        <asp:ListItem Value="All Companies "></asp:ListItem>
                        <asp:ListItem Value="Core Only"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                     <td style="width: 0px;">
                        <asp:CheckBoxList ID="cblCertAvailability" runat="server"> <%--OnSelectedIndexChanged="filter_CF" AutoPostBack="true">--%>
                        <asp:ListItem Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                     <td style="width: 0px;">
                        <asp:CheckBoxList ID="cblpan" runat="server"> <%--OnSelectedIndexChanged="filter_pan" AutoPostBack="true">--%>
                        <asp:ListItem Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                     <td style="width: 0px;">
                        <asp:CheckBoxList ID="cblpassport" runat="server"> <%--OnSelectedIndexChanged="filter_passport" AutoPostBack="true">--%>
                        <asp:ListItem Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                     <td style="width: 0px;">
                        <asp:CheckBoxList ID="cblaadhar" runat="server"> <%--OnSelectedIndexChanged="filter_aadhar" AutoPostBack="true">--%>
                        <asp:ListItem Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                        
                   
                </tr>
                <tr>
                    <td style="background-color: White">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="width: 50px;">
                        <asp:Button ID="BtnFilter" runat="server" Text="Filter" OnClick="BtnFilter_Click" />
                    </td>
                </tr>

                <tr>
                    <td colspan="14">
                        <script type = "text/javascript">
                            function checkAll(objRef) {
                                var GridView = objRef.parentNode.parentNode.parentNode;
                                var inputList = GridView.getElementsByTagName("input");
                                for (var i = 0; i < inputList.length; i++) {
                                    var row = inputList[i].parentNode.parentNode;
                                    if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                                        inputList[i].checked = objRef.checked;
                                    }
                                }
                            }

                            function Check_Click(objRef) {
                                //Get the Row based on checkbox
                                var row = objRef.parentNode.parentNode;

                                //Get the reference of GridView
                                var GridView = row.parentNode;

                                //Get all input elements in Gridview
                                var inputList = GridView.getElementsByTagName("input");

                                for (var i = 0; i < inputList.length; i++) {
                                    //The First element is the Header Checkbox
                                    var headerCheckBox = inputList[0];

                                    //Based on all or none checkboxes
                                    //are checked check/uncheck Header Checkbox
                                    var checked = true;
                                    if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                                        if (!inputList[i].checked) {
                                            checked = false;
                                            break;
                                        }
                                    }
                                }
                                headerCheckBox.checked = checked;

                            }
    </script> 
                        <asp:GridView runat="server" ID="gvDetails" ShowHeader="true" AllowPaging="false"
                            PageSize="10" AutoGenerateColumns="false" Width="1570px" CssClass="Gridview" DataKeyNames="Degree" OnRowDataBound="OnRowDataBound" OnPageIndexChanging = "OnPaging">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" onclick = "checkAll(this)"/>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="slno" runat="server" Width="40px" onclick = "Check_Click(this)" /></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Degree" HeaderText="Degree" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Regno" HeaderText="Registration Number" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="first_name" HeaderText="First Name" ItemStyle-Width="120px" />
                                 <asp:BoundField DataField="mid_name" HeaderText="Middle Name" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="last_name" HeaderText="Last Name" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="father_name" HeaderText="father name" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="DOB" HeaderText="Date of Birth" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="tenth" HeaderText="tenth" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="yop_1" HeaderText="yop_1" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="twelth" HeaderText="twelth" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="yop_2" HeaderText="yop_2" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Diplamo" HeaderText="Diploma" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="yop_3" HeaderText="yop_3" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem1" HeaderText="Sem1" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem2" HeaderText="Sem2" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem3" HeaderText="Sem3" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem4" HeaderText="Sem4" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem5" HeaderText="Sem5" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem6" HeaderText="Sem6" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem7" HeaderText="Sem7" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Sem8" HeaderText="Sem8" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Avg" HeaderText="Avg" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Ist_Attempt" HeaderText="1st_Attempt" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Arrears" HeaderText="Arrears" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="city" HeaderText="city" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="district" HeaderText="district" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="state" HeaderText="state" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="pincode" HeaderText="pincode" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="full_address" HeaderText="full_address" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="res_phone" HeaderText="res_phone" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="mobile_no" HeaderText="mobile_no" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="email_id" HeaderText="email_id" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="placement_option" HeaderText="placement_option" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="core_only" HeaderText="core_only" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="hoste_dascholar" HeaderText="hostel/dascholar" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="section" HeaderText="section" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="nationality" HeaderText="nationality" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-Width="120px" />
                               <asp:BoundField DataField="cert_availability" HeaderText="cert_availability" ItemStyle-Width="120px" />
                               <asp:BoundField DataField="skill_set" HeaderText="skill_set" ItemStyle-Width="120px" />
                               <asp:BoundField DataField="duration" HeaderText="duration" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Company" HeaderText="Company" ItemStyle-Width="120px" />
                              <asp:BoundField DataField="pancard" HeaderText="pancard" ItemStyle-Width="120px" />
                               <asp:BoundField DataField="passport" HeaderText="passport" ItemStyle-Width="120px" />
                               <asp:BoundField DataField="aadhar" HeaderText="aadhar" ItemStyle-Width="120px" />
                               <asp:BoundField DataField="resume" HeaderText="resume" ItemStyle-Width="120px" />
                               <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Resume">
            <ItemTemplate>
                <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="View" CommandArgument='<%# Eval("regno") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                           </Columns></asp:GridView> </td>    </tr>
                <tr>
                    <td>
                    
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Download Complete Data" OnClick="btnExportAll_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Download Selected Data" OnClick="btnExportExcel_Click"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnCompose" runat="server" Text="COMPOSE MAIL"/>
                    </td>
                </tr>
                
                 
                       
    </table> </div></center><div>

    </div> <div style="position:absolute">   <asp:Literal ID="ltEmbed" runat="server" />
</div>
</asp:Content>
