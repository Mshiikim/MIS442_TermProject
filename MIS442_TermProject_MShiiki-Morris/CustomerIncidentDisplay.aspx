<%@ Page Title="Customer Incident Display" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.CustomerIncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container">
        <!-- This page is a requirement for the final project. -->
        <!-- It displays information from a provided database about closed incidents for customers -->
        <!-- Would require proper updating depending upon business needs -->
        <!-- This page pulls data from three tables in the database file and displays some of the data -->
        <div class="col-offset-3"><h4>Select a customer: </h4>
            <!-- Basic instructions for when no display is listed -->
            <p> If blank the customer has had no prior incidents.</p>
            <br />
            <asp:DropDownList class="col-sm-6 form-control" ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True" Width="25%"></asp:DropDownList>
        </div>
        <!-- SQL datasource for drop down list selection (ddlCustomers) -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AspectConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        <br />
        <br />
    </div>
    <div class="container">
        <div class="col-12 col-offset-1">
            <!-- Data list control information, used to display information pulled from database file -->
            <!-- Auto Style used for datalist (dlIncidents) -->
            <!-- Change from datalist into listview scheduled for future date and will provide a cleaner interface - requirement to use datalist -->
            <asp:DataList ID="dlIncidents" runat="server" DataSourceID="SqlDataSource2" DataKeyFIeld="CustomerID" BackColor="WhiteSmoke" 
                BorderColor="#CCCCCC" BorderStyle="solid" BorderWidth="1px" CellPadding="0" CssClass="table table-bordered table-condensed">
                <HeaderTemplate>
                    <tr>
                        <th>ProductCode</th>
                        <th>IncidentID</th>
                        <th>Description</th>
                        <th>TechnicianID</th>
                    </tr>
                </HeaderTemplate>
                <ItemStyle ForeColor="#000066" />
                <ItemTemplate>
                    <tbody>
                    <tr>
                        <td><asp:Label ID="lblIncidentID" runat="server" Text='<%# Eval("IncidentID") %>' CssClass="col-3"></asp:Label></td>
                        <td><asp:Label ID="lblProdCode" runat="server" Text='<%# Eval("ProductCode") %>' CssClass="col-3"></asp:Label></td>
                        <td><asp:Label ID="lblDesc" runat="server" Text='<%# Eval("Description") %>' CssClass="col-3 text-right"></asp:Label></td>
                        <td><asp:Label ID="lblTechID" runat="server" Text='<%# Eval("TechID") %>' CssClass="col-3 text-right"></asp:Label></td>
                    </tr>
                    </tbody>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SeparatorStyle BorderStyle="None" />
            </asp:DataList>
      </div>
        <!-- SQL data source for datalist (dlIncidents), pulls from three tables (Incidents, Products & Customers -->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AspectConnectionString %>" 
            SelectCommand="SELECT Customers.CustomerID, Customers.Name, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email, Incidents.IncidentID, 
            Incidents.CustomerID AS Expr1, Incidents.ProductCode, Incidents.TechID, Incidents.DateOpened, Incidents.DateClosed, Incidents.Title, Incidents.Description, Products.ProductCode AS Expr2, 
            Products.Name AS Expr3, Products.Version, Products.ReleaseDate FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID INNER JOIN Products 
            ON Incidents.ProductCode = Products.ProductCode WHERE (Customers.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
</asp:Content>
