<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="Registered students.aspx.cs" Inherits="home_Registered_students" EnableEventValidation="false" %>

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
            <li><a href="All%20registered%20students.aspx" style="color: White">All_registered_students.aspx</a></li>
        </ul>
    </div>
    <div class="container-fluid" style="padding-left: 0px; padding-top: 210px; position:relative; width:100%; ">
       <center> <div class="GridviewDiv">
            <table style="overflow-x:scroll;" class="GridviewTable" id="gridviewtable" runat="server"
                visible="true">
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
                     
                </tr>
                <tr>
                    <td style="width: 0px;">
                        <asp:CheckBoxList ID="TxtDegree" runat="server" OnSelectedIndexChanged="Degree_Selected" AutoPostBack="false">
                            <asp:ListItem Value="B.E"></asp:ListItem>
                            <asp:ListItem Value="B.Tech"></asp:ListItem>
                        </asp:CheckBoxList>
                        <%--   <asp:TextBox ID="TxtDegree" runat="server" ></asp:TextBox>--%>
                    </td>
                    <td style="width: 0px;">
                        <asp:CheckBoxList ID="TxtBranch" runat="server" AutoPostBack="false" >
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
                        <asp:CheckBoxList ID="CBLIstAttempt" runat="server">
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
                    <td colspan="8">
                        <asp:GridView runat="server" ID="gvDetails" ShowHeader="true" AllowPaging="false"
                            PageSize="10" AutoGenerateColumns="false" Width="1570px" CssClass="Gridview" DataKeyNames="Degree" >
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true"  Checked="false" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="slno" runat="server" Width="40px" /></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Degree" HeaderText="Degree" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Regno" HeaderText="Registration Number" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile Number" ItemStyle-Width="130px" />
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lnkEmail" runat="server" Text='<%# Eval("Email") %>' NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="tenth" HeaderText="10th marks" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="twelth" HeaderText="12/diploma marks" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Avg" HeaderText="GPA" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Arrears" HeaderText="No Of Arrears" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-Width="130px" />
                                 <asp:BoundField DataField="Ist_Attempt" HeaderText="Ist_Attempt" ItemStyle-Width="130px" />
                            </Columns>
                        </asp:GridView>
                        <script type="text/javascript">
                            function Check_Click(objRef) {
                                //Get the Row based on checkbox
                                var row = objRef.parentNode.parentNode;
                                if (objRef.checked) {
                                    //If checked change color to Aqua
                                    row.style.backgroundColor = "aqua";
                                }
                                else {
                                    //If not checked change back to original color
                                    if (row.rowIndex % 2 == 0) {
                                        //Alternating Row Color
                                        row.style.backgroundColor = "#C2D69B";
                                    }
                                    else {
                                        row.style.backgroundColor = "white";
                                    }
                                }

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
                        <script type="text/javascript">
                            function checkAll(objRef) {
                                var GridView = objRef.parentNode.parentNode.parentNode;
                                var inputList = GridView.getElementsByTagName("input");
                                for (var i = 0; i < inputList.length; i++) {
                                    //Get the Cell To find out ColumnIndex
                                    var row = inputList[i].parentNode.parentNode;
                                    if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                                        if (objRef.checked) {
                                            //If the header checkbox is checked
                                            //check all checkboxes
                                            //and highlight all rows
                                            row.style.backgroundColor = "aqua";
                                            inputList[i].checked = true;
                                        }
                                        else {
                                            //If the header checkbox is checked
                                            //uncheck all checkboxes
                                            //and change rowcolor back to original
                                            if (row.rowIndex % 2 == 0) {
                                                //Alternating Row Color
                                                row.style.backgroundColor = "#C2D69B";
                                            }
                                            else {
                                                row.style.backgroundColor = "white";
                                            }
                                            inputList[i].checked = false;
                                        }
                                    }
                                }
                            }
                        </script>
                        <script type="text/javascript">
                            function CheckAllEmp(Checkbox) {
                                var GridVwHeaderChckbox = document.getElementById("<%=gvDetails.ClientID %>");
                                for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                                    GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
                                }
                            }
                        </script>
                    </td>
                </tr>
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
                        <asp:Button ID="Button1" runat="server" Text="Download Complete Data" OnClick="ExportToExcel" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Download Selected Data" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="insert selected data" OnClick="btnInsert_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="fuAttachment" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnCompose" runat="server" Text="COMPOSE MAIL" OnClick="composeMail" />
                    </td>
                    <td>
                        <asp:Button ID="mail" runat="server" Text="SEND MAIL" />
                    </td>
                </tr>
                <tr><td>
                                            <asp:TextBox ID="TxtTable" runat="server"></asp:TextBox></td><td>
                                            <asp:TextBox ID="TxtColumn" runat="server"></asp:TextBox></td><td>
                                                <asp:Button ID="Btncreate" runat="server" Text="Save to table" OnClick="Btncreate_Click" /></td></tr>
                <tr>
                    <td>
                        <div class="model2">
                            <!-- admin popup-->
                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel2"
                                TargetControlID="Button2" CancelControlID="Close" BackgroundCssClass="modalBackground">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup2" align="center" Style="display: none">
                                <div class="table-responsive table-condensed">
                                    <table class="table" id="Table3" runat="server" style="width: 480px; height: 400px;
                                        border-collapse: collapse;">
                                        <tr style="background-color: #0095EB">
                                            <td style="height: 50px; width: 470px; font-family: Fertigo; font-size: 30px; color: White;"
                                                colspan="2">
                                                <center> Admin Login</center>
                                            </td>
                                            <td style="float: right">
                                                <asp:ImageButton ID="Close" ImageUrl="~/home/closed.png" Height="45px" Width="45px"
                                                    runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="gvTranferRows" AutoGenerateColumns="false" CellPadding="5" runat="server"
                                                    EmptyDataText="No Records Found">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="UserId" DataField="UserId" />
                                                        <asp:BoundField HeaderText="UserName" DataField="UserName" />
                                                        <asp:BoundField HeaderText="Education" DataField="Education" />
                                                        <asp:BoundField HeaderText="Location" DataField="Location" />
                                                    </Columns>
                                                    <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                                </asp:GridView>
                                            </td>
                                            <td colspan="2">
                                                <asp:ImageButton ID="BtnCancel" ImageUrl="~/home/CANCEL.png" Height="80px" Width="100px"
                                                    runat="server" PostBackUrl="~/home/Home.aspx" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="forgotpwd" Text="forgot password" runat="server"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        
            </table>
        </div>
        </asp:Panel>
    </div>
    </td></tr> </table> </div></center>
  <%--  <div class="Mail" style="padding-left: 0px; padding-top: 0px">
        <table id="mailTable" runat="server" style="width: 100%;" visible="false">
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </div>--%>
    </div>
</asp:Content>
