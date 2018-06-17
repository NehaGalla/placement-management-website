<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master"
    AutoEventWireup="true" CodeFile="Placement Records.aspx.cs" Inherits="home_Placement_Records" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phtitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phlinks" runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phcontent" runat="Server">
<div class="container-fluid" style="padding-top:200px">
<Center><h1 style="font-family:Copperplate Gothic Light;color:#228cc9;padding-top:25px">PLACEMENT RECORDS</h1></Center>
<h2>Year : 2015-2016</h2>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white"/>
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>

    <h2>Year : 2014-2015</h2>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white"/>
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>
    <h2>Year : 2013-2014</h2>
<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white"/>
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>
    <h2>Year : 2012-2013</h2>
<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white"/>
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>
    <h2>Year : 2011-2012</h2>
<asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white" />
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>
    <h2>Year : 2010-2011</h2>
<asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white" />
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>
    <h2>Year : 2009-2010</h2>
<asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="false" 
                        Style='width: 100%;' ShowHeader="false">
 <Columns>
                           <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" ItemStyle-BackColor="#7bc6e5" ItemStyle-ForeColor="white"/>
        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                                   
                            
 </Columns>
    </asp:GridView>
</div>
    
</asp:Content>