<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="selection criteria.aspx.cs" Inherits="home_selection_criteria" %>

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
    <div class="table-responsive" style="padding-left: 300px; padding-top: 200px">
        <table class="table" id="criteria" style="width: 1003px; border: 2px">
            <tr style="height: 100px">
                <td style="width: 1003px; border: 3px; border-style: solid; border-color: Gray; background-color: Gray"
                    colspan="2">
                    <p style="color: White">
                        <h2>
                            SET SELECTION CRITERIA</h2>
                    </p>
                </td>
            </tr>
            <tr>
            <td>
                    <center><asp:Label ID="Label8" runat="server" Text="JOB ID"></asp:Label></center>
                </td>
                <td>
                    <asp:Label ID="lblJobId" runat="server" Text="Label"></asp:Label>
                </td></tr>
            <tr style="border-color: Black;">
                <script type="text/javascript">
                    $(function () {
                        $("#form1").validationEngine('attach', { promptPosition: "topRight" });
                    });
                    function DateFormat(field, rules, i, options) {
                        var regex = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
                        if (!regex.test(field.val())) {
                            return "Please enter date in dd/MM/yyyy format."
                        }
                    }
                   

                    
                </script>
                <td>
                    <center><asp:Label ID="Label1" runat="server" Text="COMPANY NAME"></asp:Label></center>
                </td>
                <td>
                    <asp:TextBox ID="TxtCmpName" runat="server"></asp:TextBox>
                </td></tr>
                <tr>
                 <td> 
                    <center><asp:Label ID="Label2" runat="server" Text="DATE AND TIME"></asp:Label></center>
                </td>
                <td>
                   <div> <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox><img src="images/calendar.png" />
                <script src="images/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="images/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="images/calendar-en.min.js" type="text/javascript"></script>
<link href="images/calendar-blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=TxtDate.ClientID %>").dynDateTime({
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
             </div>   </td></tr>
                <tr>
                 <td>
                    <center><asp:Label ID="Label3" runat="server" Text="TIME"></asp:Label></center>
                </td>
                <td>
                    <asp:TextBox ID="TxtTime" runat="server"></asp:TextBox>
                </td></tr>
                <tr>
                 <td>
                    <center><asp:Label ID="Label4" runat="server" Text="VENUE"></asp:Label></center>
                </td>
                <td>
                    <asp:TextBox ID="TxtVenue" runat="server"></asp:TextBox>
                </td></tr>
                <tr>
                 <td>
                    <center><asp:Label ID="Label6" runat="server" Text="CATEGORY"></asp:Label></center>
                </td>
                <td>
                    <asp:TextBox ID="TxtCategory" runat="server"></asp:TextBox>
                </td></tr>
                <tr>
                 <td>
                    <center><asp:Label ID="Label7" runat="server" Text="JOB EXPIRY DATE"></asp:Label></center>
                </td>
                <td>
                <div>
                    <asp:TextBox ID="TxtExpDate" runat="server"></asp:TextBox><img src="images/calendar.png" />
               
                <script src="images/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="images/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="images/calendar-en.min.js" type="text/javascript"></script>
<link href="images/calendar-blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=TxtExpDate.ClientID %>").dynDateTime({
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
               </div> </td></tr>
          <tr>
                <td colspan="2" style="border: 1px; color: Black; border-style: solid">
                    <center>
                    <asp:Label ID="Label5" runat="server" Text="Eligibility Criteria" Font-Bold="true"></asp:Label></center>
                </td>
            </tr>
            <tr>
                <td>
                    <center> <asp:Label ID="Lbldegree" runat="server" Text="DEGREE"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList ID="cblDegree" runat="server">

                    </asp:CheckBoxList>
                </td>
           <%--     <td style="border-color: Blue" id="CheckBoxList" runat="server">
                    <asp:CheckBox ID="cbkBE" runat="server" Text="B.E" OnCheckedChanged="cbkBE_CheckedChanged"
                        AutoPostBack="true" class="required-one" /><br />
                    <asp:CheckBox ID="cbkBTech" runat="server" Text="B.Tech" OnCheckedChanged="cbkBTech_CheckedChanged"
                        AutoPostBack="true" class="required-one" /><br />
                    <asp:CheckBox ID="cbkBArch" runat="server" Text="B.Arch(Bachelor of Architecture)"
                        class="required-one" /><br />
                    <asp:CheckBox ID="cbkBDS" runat="server" Text="B.D.S(Bachelor of Dental Surgery)"
                        class="required-one" /><br />
                    <asp:CheckBox ID="cbkArts" runat="server" Text="Arts and Science" OnCheckedChanged="cbkArts_CheckedChanged"
                        AutoPostBack="true" class="required-one" /><br />
                    <asp:CheckBox ID="cbkMBA" runat="server" Text="M.B.A(Master Of Business Applications)"
                        class="required-one" /><br />
                    <asp:CheckBox ID="cbkME" runat="server" Text="M.E" OnCheckedChanged="cbkME_CheckedChanged"
                        AutoPostBack="true" class="required-one" /><br />
                    <asp:CheckBox ID="cbkMTech" runat="server" Text="M.Tech" OnCheckedChanged="cbkMTech_CheckedChanged"
                        AutoPostBack="true" class="required-one" /><br />
                    <asp:CheckBox ID="cbkMArch" runat="server" Text="M.Arch" OnCheckedChanged="cbkMArch_CheckedChanged"
                        AutoPostBack="true" class="required-one" /><br />
                    <asp:CheckBox ID="SelectAll1" runat="server" Text="Select All" OnCheckedChanged="SelectAll1_CheckedChanged"
                        AutoPostBack="true" />
                </td>--%>
            </tr>
            <tr>
                <td colspan="2" style="border: 1px; color: Black; border-style: solid">
                    <center>
                    <asp:Label ID="lblBranch" runat="server" Text="BRANCH" Font-Bold="true"></asp:Label></center>
                </td>
            </tr>
            <tr><td><center>select branch</center></td><td><asp:CheckBoxList ID="cblBranch" runat="server">

                    </asp:CheckBoxList></td></tr>
          <%--  <tr id="trBE" runat="server">
                <td>
                    <center>
                    <asp:Label ID="LblBE" runat="server" Text="B.E"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList runat="server" ID="cblBE">
                        <asp:ListItem>Computer Science and Engineering</asp:ListItem>
                        <asp:ListItem>Electrical and Electronics Engineering</asp:ListItem>
                        <asp:ListItem>Electronics and Communication Engineering</asp:ListItem>
                        <asp:ListItem>Electronics and Telecommunication Engineering</asp:ListItem>
                        <asp:ListItem> Electronics and Control Engineering</asp:ListItem>
                        <asp:ListItem> Electronics and Instrumentation Engineering</asp:ListItem>
                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                        <asp:ListItem> Automobile Engineering</asp:ListItem>
                        <asp:ListItem> Mechanical & Production Engineering</asp:ListItem>
                        <asp:ListItem> Aeronautical Engineering</asp:ListItem>
                        <asp:ListItem> Civil Engineering</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="SelectAll7" runat="server" AutoPostBack="True" Text="Select All"
                        OnCheckedChanged="SelectAll7_CheckedChanged" />
                    <asp:CustomValidator runat="server" ID="BranchBE" ClientValidationFunction="ValidateModuleList"
                        ErrorMessage="Please Select Atleast one Branch" ForeColor="Red"></asp:CustomValidator>
                    <script type="text/javascript">

                        // javascript to add to your aspx page
                        function ValidateModuleList(source, args) {
                            var chkListModules = document.getElementById('<%= cblBE.ClientID %>');
                            var chkListinputs = chkListModules.getElementsByTagName("input");
                            for (var i = 0; i < chkListinputs.length; i++) {
                                if (chkListinputs[i].checked) {
                                    args.IsValid = true;
                                    return;
                                }
                            }
                            args.IsValid = false;
                        } 
                    </script>
                </td>
            </tr>
            <tr id="btech" runat="server">
                <td>
                    <center>
                    <asp:Label ID="lblBTech" runat="server" Text="B.Tech"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList runat="server" ID="CblBtech">
                        <asp:ListItem>Information Technology</asp:ListItem>
                        <asp:ListItem>Chemical Engineering</asp:ListItem>
                        <asp:ListItem> Biotechnology</asp:ListItem>
                        <asp:ListItem>Bioinformatics</asp:ListItem>
                        <asp:ListItem>Biomedical Engineering</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="SelectAll2" runat="server" AutoPostBack="True" Text="Select All"
                        OnCheckedChanged="SelectAll2_CheckedChanged" />
                    <asp:CustomValidator runat="server" ID="CustomValidator1" ClientValidationFunction="ValidatecblBtechList"
                        ErrorMessage="Please Select Atleast one Branch" ForeColor="Red"></asp:CustomValidator>
                    <script type="text/javascript">

                        // javascript to add to your aspx page
                        function ValidatecblBtechList(source, args) {
                            var chkListModules = document.getElementById('<%= CblBtech.ClientID %>');
                            var chkListinputs = chkListModules.getElementsByTagName("input");
                            for (var i = 0; i < chkListinputs.length; i++) {
                                if (chkListinputs[i].checked) {
                                    args.IsValid = true;
                                    return;
                                }
                            }
                            args.IsValid = false;
                        } 
                    </script>
                </td>
            </tr>
            <tr id="arts" runat="server">
                <td>
                    <center>
                    <asp:Label ID="lblarts" runat="server" Text="Arts And Science"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList runat="server" ID="CblArts"> 
                        <asp:ListItem>Bachelor of Education(B.Ed)</asp:ListItem>
                        <asp:ListItem>Bachelor of Commerce(B.Com)</asp:ListItem>
                        <asp:ListItem>Computer Science(B.Sc)</asp:ListItem>
                        <asp:ListItem>Visual Communication(B.Sc)</asp:ListItem>
                        <asp:ListItem> BioTechnology(M.Sc)</asp:ListItem>
                        <asp:ListItem> Master of Education(M.Ed)</asp:ListItem>
                        <asp:ListItem>Master of Computer Applications(MCA)</asp:ListItem>
                        <asp:ListItem>Visual Communication(M.Sc)</asp:ListItem>
                        <asp:ListItem>Physics(M.Sc)</asp:ListItem>
                        <asp:ListItem>Mathematics(M.Sc)</asp:ListItem>
                        <asp:ListItem> Chemistry(M.Sc)</asp:ListItem>
                        <asp:ListItem>Computer Science(M.Sc)</asp:ListItem>
                        <asp:ListItem>Energy Science(M.Sc)</asp:ListItem>
                        <asp:ListItem> Planning(M.Plan)</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="SelectAll3" runat="server" AutoPostBack="True" Text="Select All"
                        OnCheckedChanged="SelectAll3_CheckedChanged" />
                    <asp:CustomValidator runat="server" ID="CustomValidator2" ClientValidationFunction="ValidatecblArtsList"
                        ErrorMessage="Please Select Atleast one Branch" ForeColor="Red"></asp:CustomValidator>
                    <script type="text/javascript">

                        // javascript to add to your aspx page
                        function ValidatecblArtsList(source, args) {
                            var chkListModules = document.getElementById('<%= CblArts.ClientID %>');
                            var chkListinputs = chkListModules.getElementsByTagName("input");
                            for (var i = 0; i < chkListinputs.length; i++) {
                                if (chkListinputs[i].checked) {
                                    args.IsValid = true;
                                    return;
                                }
                            }
                            args.IsValid = false;
                        } 
                    </script>
                </td>
            </tr>
            <tr id="trME" runat="server">
                <td>
                    <center>
                    <asp:Label ID="lblME" runat="server" Text="M.E"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList runat="server" ID="cblME">
                        <asp:ListItem>Computer Science and Engineering</asp:ListItem>
                        <asp:ListItem>Power Electronics and Industrial Drives</asp:ListItem>
                        <asp:ListItem> Embedded Systems</asp:ListItem>
                        <asp:ListItem> Applied Electronics</asp:ListItem>
                        <asp:ListItem>Electronics and Control </asp:ListItem>
                        <asp:ListItem> Thermal Engineering</asp:ListItem>
                        <asp:ListItem> Computer Aided Design</asp:ListItem>
                        <asp:ListItem> Structural Engineering</asp:ListItem>
                        <asp:ListItem> Environmental Engineering</asp:ListItem>
                        <asp:ListItem> Aeronautical Engineering</asp:ListItem>
                        <asp:ListItem>Communication Systems</asp:ListItem>
                        <asp:ListItem>Engineering Design</asp:ListItem>
                        <asp:ListItem> Manufacturing Engineering</asp:ListItem>
                        <asp:ListItem> Cloud Computing</asp:ListItem>
                        <asp:ListItem> Power Systems</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="SelectAll4" runat="server" AutoPostBack="True" Text="Select All"
                        OnCheckedChanged="SelectAll4_CheckedChanged" />
                    <asp:CustomValidator runat="server" ID="CustomValidator3" ClientValidationFunction="ValidatecblMeList"
                        ErrorMessage="Please Select Atleast one Branch" ForeColor="Red"></asp:CustomValidator>
                    <script type="text/javascript">

                        // javascript to add to your aspx page
                        function ValidatecblMeList(source, args) {
                            var chkListModules = document.getElementById('<%= cblME.ClientID %>');
                            var chkListinputs = chkListModules.getElementsByTagName("input");
                            for (var i = 0; i < chkListinputs.length; i++) {
                                if (chkListinputs[i].checked) {
                                    args.IsValid = true;
                                    return;
                                }
                            }
                            args.IsValid = false;
                        } 
                    </script>
                </td>
            </tr>
            <tr id="trMTech" runat="server">
                <td>
                    <center>
                    <asp:Label ID="lblMTech" runat="server" Text="M.Tech"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList runat="server" ID="cblMtech">
                        <asp:ListItem>Information Technology</asp:ListItem>
                        <asp:ListItem>VLSI</asp:ListItem>
                        <asp:ListItem> Wind Energy Technology</asp:ListItem>
                        <asp:ListItem>Green Engineering & Technology</asp:ListItem>
                        <asp:ListItem> Nanotechnology</asp:ListItem>
                        <asp:ListItem> Remote Sensing & Geo Informatics </asp:ListItem>
                        <asp:ListItem> Robotics & Artificial Intelligence</asp:ListItem>
                        <asp:ListItem> Biotechnology</asp:ListItem>
                        <asp:ListItem>Marine Biotechnology</asp:ListItem>
                        <asp:ListItem>Bioinformatics</asp:ListItem>
                        <asp:ListItem> Naval Engineering</asp:ListItem>
                        <asp:ListItem>Medical Instrumentation</asp:ListItem>
                        <asp:ListItem> Material Science</asp:ListItem>
                        <asp:ListItem>Chemical Engineering</asp:ListItem>
                        <asp:ListItem>Systems Biology</asp:ListItem>
                        <asp:ListItem>Data Engineering</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="SelectAll5" runat="server" AutoPostBack="True" Text="Select All"
                        OnCheckedChanged="SelectAll5_CheckedChanged" />
                    <asp:CustomValidator runat="server" ID="CustomValidator4" ClientValidationFunction="ValidatecblMtechlist"
                        ErrorMessage="Please Select Atleast one Branch" ForeColor="Red"></asp:CustomValidator>
                    <script type="text/javascript">

                        // javascript to add to your aspx page
                        function ValidatecblMtechlist(source, args) {
                            var chkListModules = document.getElementById('<%= cblMtech.ClientID %>');
                            var chkListinputs = chkListModules.getElementsByTagName("input");
                            for (var i = 0; i < chkListinputs.length; i++) {
                                if (chkListinputs[i].checked) {
                                    args.IsValid = true;
                                    return;
                                }
                            }
                            args.IsValid = false;
                        } 
                    </script>
                </td>
            </tr>
            <tr id="trMArch" runat="server">
                <td>
                    <center>
                    <asp:Label ID="lblMArch" runat="server" Text="M.Arch"></asp:Label>
                </center>
                </td>
                <td>
                    <asp:CheckBoxList runat="server" ID="cblMarch">
                        <asp:ListItem>Building Management</asp:ListItem>
                        <asp:ListItem>Sustainable Architecture</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="SelectAll6" runat="server" AutoPostBack="True" Text="Select All"
                        OnCheckedChanged="SelectAll6_CheckedChanged" />
                    <asp:CustomValidator runat="server" ID="CustomValidator5" ClientValidationFunction="ValidatecblMarchList"
                        ErrorMessage="Please Select Atleast one Branch" ForeColor="Red"></asp:CustomValidator>
                    <script type="text/javascript">

                        // javascript to add to your aspx page
                        function ValidatecblMarchList(source, args) {
                            var chkListModules = document.getElementById('<%= cblMarch.ClientID %>');
                            var chkListinputs = chkListModules.getElementsByTagName("input");
                            for (var i = 0; i < chkListinputs.length; i++) {
                                if (chkListinputs[i].checked) {
                                    args.IsValid = true;
                                    return;
                                }
                            }
                            args.IsValid = false;
                        } 
                    </script>
                </td>
            </tr>--%>
            <tr style="border-color: Black; border-style: solid; border-width: 1px">
                <td>
                    <center>
                    <asp:Label ID="lblGender" runat="server" Text="GENDER"></asp:Label></center>
                </td>
                <td>
                    <asp:CheckBoxList ID="cblGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CustomValidator ID="RequiredGender" ErrorMessage="Gender is required." ForeColor="Red"
                        ClientValidationFunction="ValidateCheckBoxList2" runat="server" />
                    <script type="text/javascript">
                        function ValidateCheckBoxList2(sender, args) {
                            var checkBoxList = document.getElementById("<%=cblGender.ClientID %>");
                            var checkboxes = checkBoxList.getElementsByTagName("input");
                            var isValid = false;
                            for (var i = 0; i < checkboxes.length; i++) {
                                if (checkboxes[i].checked) {
                                    isValid = true;
                                    break;
                                }
                            }
                            args.IsValid = isValid;
                        }
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="error" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr><td><center>History of arrears(1st attempt)</center></td>
            <td>
                    <asp:CheckBoxList ID="cbl1stattempt" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:CheckBoxList></td></tr>
            <tr>
                <td style="border: none">
                    <asp:Label ID="lbl10th" runat="server" Text="PERCENTAGE OF MARKS IN 10TH SHOULD BE GREATER THAN OR EQUAL TO"></asp:Label>
                </td>
                <td style="border: none">
                    <asp:TextBox ID="Txt10th" runat="server" CssClass="validate[required]"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: none">
                    <asp:Label ID="Lbl12th" runat="server" Text="PERCENTAGE OF MARKS IN 12TH OR DIPLOMA SHOULD BE GREATER THAN OR EQUAL TO"></asp:Label>
                </td>
                <td style="border: none">
                    <asp:TextBox ID="Txt12th" runat="server" CssClass="validate[required]"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: none">
                    <asp:Label ID="lblgpa" runat="server" Text="PRESENT DREGREE CGPA SHOULD BE GREATER THAN OR EQUAL TO"></asp:Label>
                </td>
                <td style="border: none">
                    <asp:TextBox ID="txtgpa" runat="server" CssClass="validate[required]"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: none">
                    <asp:Label ID="lblarrears" runat="server" Text="NUMBER OF STANDING ARREARS SHOULD BE LESS THAN OR EQUAL TO"></asp:Label>
                </td>
                <td style="border: none">
                    <asp:TextBox ID="TxtArr1" runat="server" CssClass="validate[required]"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: none">
                    <asp:Label ID="LblHis" runat="server" Text="HISTORY OF ARREARS SHOULD BE LESS THAN OR EQUAL TO"></asp:Label>
                </td>
                <td style="border: none">
                    <asp:TextBox ID="TxtHis" runat="server" CssClass="validate[required]"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none; background-color: #373737; height: 79.875px">
                    <center>
                    <asp:Button ID="Btngenerate" BorderWidth="20px" runat="server" Text="GENERATE FORM"
                        BorderColor="Navy" BorderStyle="Groove" BackColor="GhostWhite" ForeColor="Black"
                        Font-Bold="true" OnClick="Btngenerate_Click" />
                    <asp:Button ID="BtnReset" BorderWidth="20px" runat="server" Text="RESET" BorderColor="Navy"
                        BorderStyle="Groove" BackColor="GhostWhite" ForeColor="Black" 
                        Font-Bold="true" onclick="BtnReset_Click"></asp:Button></center>
                </td>
            </tr>
            <tr><td>
                <asp:Literal ID="ltrErr" runat="server"></asp:Literal></td></tr>
        </table>
    </div>
    <div class="registered_students" runat="server" visible="true" style="padding-left:300px;">
    <asp:GridView runat="server" ID="gvDetails" ShowHeader="true" AllowPaging="false"
                            PageSize="10" AutoGenerateColumns="false" Width="1570px" CssClass="Gridview" DataKeyNames="Degree" >
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="slno" runat="server" Width="40px" /></ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Regno" HeaderText="Registration Number" ItemStyle-Width="120px" />
                                
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lnkEmail" runat="server" Text='<%# Eval("Email") %>' NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Columns>
                        </asp:GridView>
    </div>
</asp:Content>
