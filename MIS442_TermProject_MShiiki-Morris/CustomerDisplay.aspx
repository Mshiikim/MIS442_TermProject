<%@ Page Title="Customer Display" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.CustomerDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Customer display provides information for each customer, pulling from a local database file -->
    <br />
    <div class="container">
        <div class="col"><h4>Select a customer:</h4> 
            <!-- Drop down list control to list all available customers in database file -->
            <asp:DropDownList class="form-control" ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True" Width="25%"></asp:DropDownList>
            <!-- SQL data source information for the ddlCustomres drop down list -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AspectConnectionString %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        </div>
        <!-- Uses custom card to display customer information selected in the ddlCustomers drop down list control -->
        <div class="card">
            <div class="text-center">
                <h4>Customer Information</h4>
                <label class="card-text">Address:</label>
                <asp:label runat="server" ID="lblAddress"></asp:label><br />    
                <label class="card-text">&nbsp;</label>
                <asp:label runat="server" ID="lblAddress2"></asp:label><br />
                <label class="card-text">Phone:</label>
                <asp:label runat="server" ID="lblPhone"></asp:label><br />
                <label class="card-text">Email:</label>
                <asp:label runat="server" ID="lblEmail"></asp:label>
            </div>
            <br />
            <!-- Button controls to call various functions, see code behind for details -->
            <div class="text-center">
                <asp:Button ID="btnAddContact" class="aspectbutton" runat="server" text="Add to List" OnClick="btnAddContact_Click"/><br /><br />          
                <asp:Button ID="btnContactList" runat="server" class="aspectbutton" text="Contact List" OnClick="btnContactList_Click"/>
                <asp:Button ID="btnCustomerIncident" runat="server" class="aspectbutton" Text ="Incidents" OnClick="btnCustomerIncident_Click"  />
                <br /> <br />
            </div>
       </div>
    <br />
        <!-- Error label, see code behind for details -->
        <div class="row">
        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>   
</asp:Content>