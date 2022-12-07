<%@ Page Title="Contact Display" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.ContactDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Contact Display is used for displaying customers that need to be contacted for any number of reasons -->
    <div class="container-fluid">
        <div class="text-center">
            <h4>Contact List:</h4>
            <!-- List that displays any customers added from the customer display page -->
            <asp:ListBox ID="lsbContacts" runat="server" BackColor="whitesmoke" Width="40%"></asp:ListBox>
            <div class="row">
                <!-- Button controls for the contact display, see code behind for details on each function call -->
                <asp:Button class="aspectbutton" ID="btnAdditional" runat="server" Text="Add Additional Customers" OnClick="btnAdditional_Click" /> 
                <asp:Button class="aspectbutton" ID="btnRemove" runat="server" Text="Remove Contact" OnClick="btnRemove_Click1" />
                <asp:Button class="aspectbutton" ID="btnEmpty" runat="server" Text="Clear Contact List" OnClick="btnEmpty_Click" />
            </div>
        </div>
    </div>
</asp:Content>
