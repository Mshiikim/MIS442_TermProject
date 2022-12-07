<%@ Page Title="Aspect Site Map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.SiteMap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Custom site map for administrators that provides information on each pages purpose and links to each page -->
    <br />
    <div class="container">
        <!-- Table used for clean formatting -->
        <table class="adminTable">
            <thead>
                <tr>
                    <td class="adminHead">Link</td>
                    <td class="adminHead">Info</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="CustomerDisplay.aspx"> Customer Display </a> </td>
                    <td>Customer Information and allows for adding customers to the contact list.</td>
                </tr>
                
                <tr>
                    <td><a href="ContactDisplay.aspx"> Contact Display </a> </td>
                    <td>Customers we need to contact.</td>
                </tr>
                <tr>
                    <td><a href="CustomerIncidentDisplay.aspx"> Incident Display </a> </td>
                    <td>Lists prior customer service incidents we have closed.</td>
                </tr>
                
                <tr>
                    <td><a href="CustomerMaintenance.aspx"> Customer Maintenance </a> </td>
                    <td>Edit and/or delete customer information.</td>
                </tr>
                <tr>
                    <td><a href="CustomerRegistration.aspx"> Customer Registration </a> </td>
                    <td>Add new customers.</td>
                </tr>
                <tr>
                    <td><a href="ProductMaintenance.aspx"> Product Maintenance Display </a> </td>
                    <td>Add, edit, and remove products.</td>
                </tr>
            </tbody>
        </table>
    </div>
    <br />
</asp:Content>
