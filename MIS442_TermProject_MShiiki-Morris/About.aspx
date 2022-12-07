<%@ Page Title="Who We Are" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- About page for Aspect Shop -->
    <div class="container text-center">
        <!-- Overview about the shop -->
        <h4>We are a small board shop located in beautiful Bend, Oregon.</h4>
        <h4>We created this business to provide a small town vibe focused on helping out the locals, </h4>
        <h4>providing rentals and lower prices compared to our competitors.</h4>
        <!-- Images of the first Aspect shop location (formerly RDCShop, located in Bend, Or.) -->
        <img class="aboutImages" src="Images/shopfloorF.jpeg" />
        <img class="aboutImages" src="Images/shopfloorE.jpeg" />
        <img class="aboutImages" src="Images/shopfloorB.jpeg" />
        <img class="aboutImages" src="Images/shopfloorA.jpeg" />
        <br />
        <!-- Additional information for our customers and contact information -->
        <h4>With our steady growth we continue to expand our product selection</h4>
        <h4>and look forward to providing you with the best customer service Bend has to offer.</h4>
        <h4>If you need to get in touch with us give us a call at: 541-867-5309, or send us an email at:
        <!-- Email contact information, link to default email client for customers -->
        <asp:HyperLink ID="contactLink" runat="server" NavigateUrl="mailto:AspectShop@aspect.com">AspectShop@aspect.com</asp:HyperLink></h4>
        </div>
</asp:Content>
