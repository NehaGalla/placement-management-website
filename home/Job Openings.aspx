<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true"
    CodeFile="Job Openings.aspx.cs" Inherits="home_Job_Openings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
    <div class="container" style="position: absolute; padding-top: 200px;">
        <div class="row">
            <%-- <div class="jobopenings" ></div><div>--%>
            <center>  <h1 style="color:White;padding-top:0px">JOB OPENINGS</h1></center>
            <table style="overflow-x: scroll;" class="Gridview" id="gvtable" runat="server" visible="true">
                <tr>
                    <td colspan="8">
                       <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>--%>
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" ID="gvVenue" ShowHeader="true" AllowPaging="false" PageSize="10"
                                    AutoGenerateColumns="false" Width="1570px" CssClass="Gridview" DataKeyNames="job_id" OnRowCommand="GridView1_RowCommand">
                                
                                    <Columns>
                                        <asp:BoundField DataField="job_id" HeaderText="JOB ID" ItemStyle-Width="120px" Visible="TRUE" />
                                        <asp:BoundField DataField="company_name" HeaderText="COMPANY NAME" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="interview_date_time" HeaderText="REPORTING TIME" ItemStyle-Width="130px" />
                                        <asp:BoundField DataField="venue" HeaderText="VENUE" ItemStyle-Width="120px" />
                                        <asp:BoundField DataField="exp_date" HeaderText="LAST DATE TO APPLY" ItemStyle-Width="130px" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:TextBox ID="Txtregno" runat="server"></asp:TextBox>
                                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>">LinkButton</asp:LinkButton> 
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="lblexception" runat="server" Text=""></asp:Label>
                              <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none">
                                    <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="Registration status"></asp:Label>
                                    <br />
                                    <table align="center">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                            </td>
                                            </tr>
                                           <tr>
                                            <td>
                                                <asp:Button ID="btnSave" runat="server" Text="Okay" />
                                            </td>
                                            
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                                <asp:Panel ID="pnlexp" runat="server" CssClass="modalPopup" Style="display: none">
                                    <asp:Label Font-Bold="true" ID="Label3" runat="server" Text="Customer Details"></asp:Label>
                                    <br />
                                    <table align="center">
                                        
                                        <tr>
                                           
                                            <td>
                                                this job is expired
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button1" runat="server" Text="Save" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClientClick="return Hidepopup()" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                
                               
                                <asp:LinkButton ID="lnkExp" runat="server"></asp:LinkButton>
                                <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false" PopupControlID="pnlAddEdit"
                                    TargetControlID="lnkFake" BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>
                                 <cc1:ModalPopupExtender ID="popup2" runat="server" DropShadow="false" PopupControlID="pnlexp"
                                    TargetControlID="lnkExp" BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>
                                
                                
                                
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gvVenue" />
                                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
</asp:Content>
