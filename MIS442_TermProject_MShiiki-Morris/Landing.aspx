<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.Landing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Initial landing page for Aspect Shop -->
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-4">
        <h3 >Welcome to Aspect!</h3>
            </div>
        <h4>Check out our selection of some of the hottest brands in the industry! </h4>
        </div>
        <!-- Images displayed on landing page, located in image folder -->
        <div class="container-fluid">
            <img src="Images/Skateboard-Brands.jpg" />
            <img src="Images/snowboardbrands.jpeg" />
        </div>
    </div>
</asp:Content>
