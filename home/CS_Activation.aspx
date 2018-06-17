<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="CS_Activation.aspx.cs" Inherits="CS_Activation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
    <div class="container" style="position: absolute; padding-top: 200px;">
    <h1><asp:Literal ID="ltMessage" runat="server" /></h1>
      <table class="table borderless" id="verification" runat="server" width="1003PX" height="100%"
                        style="background-color: Transparent;" visible="false">
                        <tr style="height: 80px; width: 1003px; background-color: #f1c614; color: White;
                            border: 0px; border-collapse: collapse">
                            <td colspan="2" style="border-collapse: collapse; border: none; outline: 0px">
                                <center><h1 style="font-family:Copperplate Gothic Light">PLACEMENT REGISTRATION FORM </h1></center>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtDate" runat="server" Visible="false"></asp:TextBox></td>
                                <td>
                                <asp:TextBox ID="cmpDate" runat="server" Visible="false"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="color: White">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td style="border-collapse: collapse; border: none">
                                <h3 style="color: White;">
                                    <asp:Label ID="lblCourse" runat="server" Text="Course"></asp:Label></h3>
                            </td>
                            <td style="border-collapse: collapse; border: none">
                                <asp:DropDownList ID="DDLCourse" runat="server" Width="100px" OnSelectedIndexChanged="DDLCourse_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem> Please Select</asp:ListItem>
                                    <asp:ListItem Text="U.G"></asp:ListItem>
                                    <asp:ListItem Text="P.G"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>--%>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lbldegree" runat="server" Text="degree"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:DropDownList ID="DDLDegree" runat="server" ValidationGroup="g1">
                                    <asp:ListItem Text="Please Select" Value="0"> </asp:ListItem>
                                    <asp:ListItem Text="B.E" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="B.Tech" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="B.Arch" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="B.D.S" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Arts and Science" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="M.B.A" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="M.E" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="M.Tech" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="M.Arch" Value="9"></asp:ListItem>
                                </asp:DropDownList>
                            
                           <%-- <asp:RequiredFieldValidator InitialValue="1" ID="Req_ID" Display="Dynamic" 
    ValidationGroup="g1" runat="server" ControlToValidate="DDLDegree"
    Text="*" ErrorMessage="required" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
    <script type="text/javascript">

        // javascript to add to your aspx page
        function ValidatecblMtechlist(source, args) {
            var chkListModules = document.getElementById('<%= DDLDegree.ClientID %>');
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
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblbranch" runat="server" Text="branch"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:DropDownList ID="DDLBranch" runat="server">
                                    <asp:ListItem> Please Select</asp:ListItem>
                                    <asp:ListItem Value="1">CSE</asp:ListItem>
                                    <asp:ListItem Value="2">Electrical and Electronics Engineering </asp:ListItem>
                                    <asp:ListItem Value="3">Electronics and Communication Engineering </asp:ListItem>
                                    <asp:ListItem Value="4">Electronics and Telecommunication Engineering </asp:ListItem>
                                    <asp:ListItem Value="5"> Electronics and Control Engineering </asp:ListItem>
                                    <asp:ListItem Value="6"> Electronics and Instrumentation Engineering </asp:ListItem>
                                    <asp:ListItem Value="7">Mechanical Engineering  </asp:ListItem>
                                    <asp:ListItem Value="8"> Automobile Engineering</asp:ListItem>
                                    <asp:ListItem Value="9"> Mechanical & Production Engineering</asp:ListItem>
                                    <asp:ListItem Value="10"> Aeronautical Engineering</asp:ListItem>
                                    <asp:ListItem Value="11"> Civil Engineering</asp:ListItem>
                                    <asp:ListItem Value="12">Information Technology</asp:ListItem>
                                    <asp:ListItem Value="13">Chemical Engineering</asp:ListItem>
                                    <asp:ListItem Value="14"> Biotechnology</asp:ListItem>
                                    <asp:ListItem Value="15">Bioinformatics</asp:ListItem>
                                    <asp:ListItem Value="16">Biomedical Engineering</asp:ListItem>
                                    <asp:ListItem Value="17">Bachelor of Education(B.Ed)</asp:ListItem>
                                    <asp:ListItem Value="18">Bachelor of Commerce(B.Com)</asp:ListItem>
                                    <asp:ListItem Value="19">Computer Science(B.Sc)</asp:ListItem>
                                    <asp:ListItem Value="20">Visual Communication(B.Sc)</asp:ListItem>
                                    <asp:ListItem Value="21"> BioTechnology(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="22"> Master of Education(M.Ed)</asp:ListItem>
                                    <asp:ListItem Value="23">Master of Computer Applications(MCA)</asp:ListItem>
                                    <asp:ListItem Value="24">Visual Communication(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="25">Physics(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="26">Mathematics(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="27"> Chemistry(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="28">Computer Science(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="29">Energy Science(M.Sc)</asp:ListItem>
                                    <asp:ListItem Value="30"> Planning(M.Plan)</asp:ListItem>
                                    <asp:ListItem Value="31">Power Electronics and Industrial Drives</asp:ListItem>
                                    <asp:ListItem Value="32"> Embedded Systems</asp:ListItem>
                                    <asp:ListItem Value="33"> Applied Electronics</asp:ListItem>
                                    <asp:ListItem Value="34">Electronics and Control </asp:ListItem>
                                    <asp:ListItem Value="35"> Thermal Engineering</asp:ListItem>
                                    <asp:ListItem Value="36"> Computer Aided Design</asp:ListItem>
                                    <asp:ListItem Value="37"> Structural Engineering</asp:ListItem>
                                    <asp:ListItem Value="38"> Environmental Engineering</asp:ListItem>
                                    <asp:ListItem Value="39"> Aeronautical Engineering</asp:ListItem>
                                    <asp:ListItem Value="40">Communication Systems</asp:ListItem>
                                    <asp:ListItem Value="41">Engineering Design</asp:ListItem>
                                    <asp:ListItem Value="42"> Manufacturing Engineering</asp:ListItem>
                                    <asp:ListItem Value="43"> Cloud Computing</asp:ListItem>
                                    <asp:ListItem Value="44"> Power Systems</asp:ListItem>
                                    <asp:ListItem Value="45">VLSI</asp:ListItem>
                                    <asp:ListItem Value="46"> Wind Energy Technology</asp:ListItem>
                                    <asp:ListItem Value="47">Green Engineering & Technology</asp:ListItem>
                                    <asp:ListItem Value="48"> Nanotechnology</asp:ListItem>
                                    <asp:ListItem Value="49"> Remote Sensing & Geo Informatics </asp:ListItem>
                                    <asp:ListItem Value="50"> Robotics & Artificial Intelligence</asp:ListItem>
                                    <asp:ListItem Value="51"> Biotechnology</asp:ListItem>
                                    <asp:ListItem Value="52">Marine Biotechnology</asp:ListItem>
                                    <asp:ListItem Value="53">Bioinformatics</asp:ListItem>
                                    <asp:ListItem Value="54"> Naval Engineering</asp:ListItem>
                                    <asp:ListItem Value="55">Medical Instrumentation</asp:ListItem>
                                    <asp:ListItem Value="56"> Material Science</asp:ListItem>
                                    <asp:ListItem Value="57">Chemical Engineering</asp:ListItem>
                                    <asp:ListItem Value="58">Systems Biology</asp:ListItem>
                                    <asp:ListItem Value="59">Data Engineering</asp:ListItem>
                                    <asp:ListItem Value="60">Building Management</asp:ListItem>
                                    <asp:ListItem Value="61">Sustainable Architecture</asp:ListItem>
                                </asp:DropDownList>
                                 <%-- <asp:CustomValidator runat="server" ID="CustomValidator4" ClientValidationFunction="ValidatecblMtechlist"
                    ErrorMessage="Please Select Atleast one Branch" ForeColor="Red" SetFocusOnError="true" ></asp:CustomValidator>--%>
                <script type="text/javascript">

                    // javascript to add to your aspx page
                    function ValidatecblMtechlist(source, args) {
                        var chkListModules = document.getElementById('<%= DDLBranch.ClientID %>');
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
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblregno" runat="server" Text="Register No"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtRegno" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rqdregno" runat="server" ErrorMessage="register number is required" ControlToValidate="TxtRegno" ValidationGroup="validations" ForeColor="Red" Font-Bold="true"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <div id="checkusername" runat="server">
                        <asp:Label ID="lblStatus" runat="server" ForeColor="red"></asp:Label>
                    </div></td>

                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblsec" runat="server" Text="Section"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtSection" runat="server"></asp:TextBox>
                            </td><td><asp:RequiredFieldValidator ID="rqdsec" runat="server" ErrorMessage="section is required" ControlToValidate="DDLDegree" ValidationGroup="validations" ForeColor="Red" Font-Bold="true"
                                SetFocusOnError="true"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h2 style="color: Black; font-family: Copperplate Gothic Light">
                                    PERSONAL DETAILS</h2>
                            </td>
                        </tr>
                    
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblfstname" runat="server" Text="First Name"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtFname" runat="server"></asp:TextBox>
                            </td><td><asp:RequiredFieldValidator ID="rqdfname" runat="server" ErrorMessage="first name is required" ControlToValidate="DDLDegree" ValidationGroup="validations" ForeColor="Red" Font-Bold="true"
                                SetFocusOnError="true"></asp:RequiredFieldValidator></td>
                        </tr>
                            <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblmidname" runat="server" Text="Middle Name"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtMidname" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lbllstname" runat="server" Text="Last Name"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtLname" runat="server"></asp:TextBox>
                            </td><td><asp:RequiredFieldValidator ID="rqdlname" runat="server" ErrorMessage="lastname is required" ControlToValidate="DDLDegree" ValidationGroup="validations" ForeColor="Red" Font-Bold="true"
                                SetFocusOnError="true"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblfname" runat="server" Text="Father Name"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtFaname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="section is required" ControlToValidate="DDLDegree" ValidationGroup="validations" ForeColor="Red" Font-Bold="true"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblDOB" runat="server" Text="Date of Birth"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtDOB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label></h3>
                            </td><%--<td>
                                <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox><asp:LinkButton ID="cngGender"
                                    runat="server" OnClick="cngGender_Click">Change</asp:LinkButton></td>--%>
                       <td style="color: Black; border: none">
                                <asp:RadioButtonList ID="RBLGender" runat="server" Visible="true" AutoPostBack="true">
                                    <asp:ListItem Text="Male" Value=1>Male</asp:ListItem>
                                    <asp:ListItem Text="Female" Value=2>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                           </tr>
                        <tr>
                            <td style="color: Black; border: none">
                                <h3>
                                    <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblDistrict" runat="server" Text="District"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtDistrict" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtPincode" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblFull" runat="server" Text="Full Adress"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtAddr" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblRph" runat="server" Text="Residence Phone"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtRph" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblMobNo" runat="server" Text="Mobile No."></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtMob" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email ID"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtMail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h2 style="color: Black">
                                    PLACEMENT DETAILS</h2>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblPO" runat="server" Text="Placement Option"></asp:Label></h3>
                            </td>
                            
                            <td style="border: none; color: Black">
                                <asp:RadioButtonList ID="RBLPo" runat="server">
                                    <asp:ListItem Value=1> Placements </asp:ListItem>
                                    <asp:ListItem Value=2> Higher Studies </asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblCO" runat="server" Text="Core Only"></asp:Label></h3>
                            </td>
                            <td style="border: none; color: Black">
                               
                                <asp:RadioButtonList ID="RBLCO" runat="server">
                                    <asp:ListItem Value=1>All Companies  </asp:ListItem>
                                    <asp:ListItem Value=2>Core Only </asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblhs" runat="server" Text="Hostel/Dayscholar"></asp:Label></h3>
                            </td>
                            <td style="border: none; color: Black">
                               
                            <asp:RadioButtonList ID="RBLHostel" runat="server">
                                    <asp:ListItem Value=1> Hostel </asp:ListItem>
                                    <asp:ListItem Value=2>Dayscholar</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblnat" runat="server" Text="Nationality"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtNationality" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblAC" runat="server" Text="Admission Category"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtAC" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="Label1" runat="server" Text="certification course"></asp:Label></h3>
                            </td>
                            <td style="border: none; color: Black">
                                
                             <asp:RadioButtonList ID="RblCf" runat="server">
                                    <asp:ListItem Value=1> Yes </asp:ListItem>
                                    <asp:ListItem Value=2>No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblSS" runat="server" Text="Name of the Skill set/Course "></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtSkillset" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lbldur" runat="server" Text="Duration of course in months"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtDur" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblvendor" runat="server" Text="Certification vendor/Authority/Agency"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtVendor" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblpan" runat="server" Text="Availability of Pan Card "></asp:Label></h3>
                            </td>
                            <td style="color: Black; border: none">
                                
                                  <asp:RadioButtonList ID="RBLPan" runat="server">
                                    <asp:ListItem Value=1>Yes</asp:ListItem>
                                    <asp:ListItem Value=2>No</asp:ListItem>
                                </asp:RadioButtonList>                            </td>
                        </tr>
                        <%-- <tr>
                            <td style="border: none">
                                <h3 style="color: White">
                                    <asp:Label ID="LblPanNo" runat="server" Text="If Yes,Pan Card Number" Visible="false"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtPanNo" runat="server" Visible="false"></asp:TextBox>
                            </td>
                        </tr>--%>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lblpas" runat="server" Text="Availablity of Passport"></asp:Label></h3>
                            </td>
                            <td style="color: Black; border: none">
                                
                                <asp:RadioButtonList ID="RBLPassport" runat="server">
                                    <asp:ListItem Value=1>Yes</asp:ListItem>
                                    <asp:ListItem Value=2>No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td style="border: none">
                                <h3 style="color: White">
                                    <asp:Label ID="LblPassportNo" runat="server" Text="If Yes,Passport Number" Visible="false"></asp:Label></h3>
                            </td>
                            <td style="border: none">
                                <asp:TextBox ID="TxtPassportNo" runat="server" Visible="false"></asp:TextBox>
                            </td>
                        </tr>--%>
                        <tr>
                            <td style="border: none">
                                <h3 style="color: Black">
                                    <asp:Label ID="lbladr" runat="server" Text="Availablity of Aadhar card"></asp:Label></h3>
                            </td>
                            <td style="color: Black; border: none">
                               
                                <asp:RadioButtonList ID="RBLAadhar" runat="server">
                                    <asp:ListItem Value=1>Yes</asp:ListItem>
                                    <asp:ListItem Value=2>No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td style="border: none">
                                <h3 style="color: White">
                                    <asp:Label ID="LblAadharNo" runat="server" Text="If Yes,Aadhar Card Number" Visible="false"></asp:Label></h3>
                            </td>
                           <td style="border: none">
                                <asp:TextBox ID="TxtAadharNo" runat="server" Visible="false"></asp:TextBox>
                            </td>
                        </tr>--%>
                        <tr><td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />

<%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="File Name" />
        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="View" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<hr />
<div>
    <asp:Literal ID="ltEmbed" runat="server" />
</div>
--%>                        </td></tr>
                        <tr>
                            <td style="border: none">
                                <asp:Button ID="BtnSubmit" runat="server" Text="SUBMIT" OnClick="BtnSubmit_Click" CausesValidation="true">
                                </asp:Button>
                            </td>
                       </tr>
                    </table>
   </div>
   </asp:Content>