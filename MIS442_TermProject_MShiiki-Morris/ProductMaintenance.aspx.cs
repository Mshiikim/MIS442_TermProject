using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS442_TermProject_MShiiki_Morris
{
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Function to populate the grid view
        protected void grdViewPreRender(object sender, EventArgs e)
        {
            grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        // Function call for add button, inserts new product information
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Assigns data to insert parameters
            SqlDataSource1.InsertParameters["ProductCode"].DefaultValue = tbNewProductCode.Text;
            SqlDataSource1.InsertParameters["Name"].DefaultValue = tbNewName.Text;
            SqlDataSource1.InsertParameters["Version"].DefaultValue = tbNewVersion.Text;
            SqlDataSource1.InsertParameters["ReleaseDate"].DefaultValue = tbNewReleaseDate.Text;
            // Try statement to catch exceptions, displays success message if valid, otherwise will display exception message
            try
            {
                SqlDataSource1.Insert();
                tbNewProductCode.Text = "";
                tbNewName.Text = "";
                tbNewVersion.Text = "";
                tbNewReleaseDate.Text = "mm/dd/yy";
                lblError.Text = "New Product Created Successfully.";
            }
            catch (Exception ex)
            {
                lblError.Text = "Error!" + "Message: " + ex.Message;
            }
        }

        // Function call for delete button, checks for exceptions and displays error message accordingly
        protected void grdProductsDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "Error! " + " Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Another user may have already updated the product, try again later.";
            }
        }

        // Function call for Update button, checks for exceptions and displays error message accordingly
        protected void grdProductsUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "Error in entry " + " Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Another user may already updated the product, try again later.";
            }
        }
    }
}