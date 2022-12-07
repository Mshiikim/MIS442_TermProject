<%@ Page Title="Customer Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.CustomerRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container col-offset-1">
        <!-- This page is used to register new customers and adds them to the database file -->
        <h4>Welcome!</h4>
        <!-- A friendly greeting on how the registration form works and contact information just in case a new customer makes a mistake -->
        <p>Our registration process is easy. Enter your information below and please make sure all fields are completed.</p>
        <p>This information allows our customer service team to provide the best experience possible for you.</p>
        <p>If you make a mistake or need your information updated, give us a call at: 541-867-5309 or send us an email (listed below).</p>
        <!-- Panel view used to provide information for customer registration, with a table used for formatting -->
        <!-- Each entry has required field validation to check if the field is empty, and displays a message if the field is empty -->
        <!-- Required field validators will trigger if another entry is selected. -->
        <asp:Panel ID="pnlRegistration" runat="server">
            <table>
                <tr>
                    <th colspan="2" style="background-color: orange;">Customer Information</th>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server" >Name: </asp:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required." ValidationGroup="vgrpRegistration" ControlToValidate="tbName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server">Address: </asp:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbAddress" TextMode="MultiLine" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required." ValidationGroup="vgrpRegistration" ControlToValidate="tbAddress"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server">City: </asp:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbCity"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required." ValidationGroup="vgrpRegistration" ControlToValidate="tbCity"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server">State: </asp:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateCode"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server">ZipCode: </asp:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbZip"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zipcode is required." ValidationGroup="vgrpRegistration" ControlToValidate="tbZip"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:label runat="server">Phone: </asp:label>
                    </td>
                     <td>
                        <asp:TextBox runat="server" ID="tbPhone"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone number is required." ValidationGroup="vgrpRegistration" ControlToValidate="tbPhone"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:label runat="server">Email: </asp:label>
                    </td>
                     <td>
                        <asp:TextBox runat="server" ID="tbEmail" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required." ValidationGroup="vgrpRegistration" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
    </div>
    <div class="container">
        <div class="col-offset-2">
            <!-- Onclick checks if all fields are valid prior to submitting, preventing traffic to SQL server -->
            <asp:Button OnClientClick="return ValidatePage();" class="aspectbutton" runat="server" ID="btnRegister" text="Register" OnClick="btnRegister_Click" ValidateRequestMode="Enabled" ValidationGroup="grpRegistration"/>
            <br />
            <!-- Label for exceptions and registration success -->
            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
            <br />
        </div>
    </div>
    <!-- SQL data source information containing for pnlRegistration, insert parameters only -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AspectConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
    <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <!-- SQL data source for drop down list (ddlState) --> 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AspectConnectionString %>" SelectCommand="SELECT [StateCode], [StateName] FROM [States]"></asp:SqlDataSource>
</asp:Content>

