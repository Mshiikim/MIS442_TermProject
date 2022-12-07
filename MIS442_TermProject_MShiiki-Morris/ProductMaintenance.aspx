<%@ Page Title="Product Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="MIS442_TermProject_MShiiki_Morris.ProductMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- This page controls all products to add, delete, and edit for the business -->
    <!-- Data provided in a gridview with templates used for primary and edit displays -->
    <!-- Would need further customization based on business requirements and database schema -->
    <br />
    <div class="container text-center">
        <!-- Autostyle slightly modified to match page colors -->
        <!-- Will default time entered to 12:00am if not provided when updating or creating new product -->
        <!-- Field validation requiring data in all fields on edit -->
        <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" OnPreRender="grdViewPreRender" onrowdeleted="grdProductsDeleted" OnRowUpdated="grdProductsUpdated" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="white" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                <asp:TemplateField HeaderText="ProductCode" SortExpression="ProductCode">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditProductCode" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblProductCode" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required." ControlToValidate="tbName"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ErrorMessage="Version is required." ControlToValidate="tbVersion"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblVersion" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbReleaseDate" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRDate" runat="server" ErrorMessage="ReleaseDate is required." ControlToValidate="tbReleaseDate"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblReleaseDate" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Orange" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="Orange" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="WhiteSmoke" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    </div>
    <!-- Label for eception error messages  -->
    <div class="container col-offset-1">
        <asp:Label class="col-offset-1" ID="lblError" runat="server"></asp:Label>
    </div>
    <!-- SQL data source for grdProducts view, includes insert, update, and delete commands -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AspectConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" 
        InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" 
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]" 
        UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <!-- Section for new products to be entered. Simply interface was required to handle large amounts of new products -->
    <!-- Field validation added to prevent server side errors, less traffic to database servers -->
    <div class=" container col-offset-1">
        <br />
        <p>To add a new product, enter the product information and click Add Product</p>
        <asp:Label runat="server" Width="150px">Product code: </asp:Label>
        <asp:TextBox  runat="server" ID="tbNewProductCode"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNewProductCode" runat="server" ControlToValidate="tbNewProductCode" ValidationGroup="vgrpAdd"  ErrorMessage="Product code is a required field" CssClass="text-danger" EnableViewState="False"></asp:RequiredFieldValidator>
        <br />
        <asp:Label runat="server" Width="150px" >Name:  </asp:Label>
        <asp:TextBox  runat="server" ID="tbNewName" Width="250px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNewProduct" runat="server" ControlToValidate="tbNewName" ValidationGroup="vgrpAdd"  ErrorMessage="Name is a required field" CssClass="text-danger" EnableViewState="False"></asp:RequiredFieldValidator>
        <br />
        <asp:Label runat="server" Width="150px" >Version: </asp:Label>
        <asp:TextBox  runat="server" ID="tbNewVersion"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNewVersion" runat="server" ControlToValidate="tbNewVersion" ValidationGroup="vgrpAdd"  ErrorMessage="Version is a required field" CssClass="text-danger" EnableViewState="False"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvNewVersion" runat="server" ControlToValidate="tbNewVersion" ErrorMessage="Version must be a decimal value" Operator="DataTypeCheck" Type="Double" ValidateGroup="Add" CssClass="text-danger" EnableViewState="False"></asp:CompareValidator>
        <br />
        <asp:Label runat="server" Width="150px" >Release Date: </asp:Label>
        <asp:TextBox  runat="server" ID="tbNewReleaseDate"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNewReleaseDate" runat="server" ControlToValidate="tbNewReleaseDate" ValidationGroup="vgrpAdd"  ErrorMessage="Release Date is a required field" CssClass="text-danger" EnableViewState="False"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvNewReleaseDate" runat="server" ErrorMessage="Date format incorrect, dd/mm/yyyy please" ControlToValidate="tbNewReleaseDate" CssClass="text-danger" EnableViewState="False" Operator="DataTypeCheck" Type="Date" ValidationGroup="Edit"></asp:CompareValidator>
        <br />
        <br />
        <!-- Button control for submitting new products -->
        <asp:button runat="server" ID="btnAdd" class="aspectbutton" Text="Add Product" OnClick="btnAdd_Click"  CausesValidation="true" ValidationGroup="vgrpAdd" />
        <br />
    </div>
</asp:Content>
