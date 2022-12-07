using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS442_TermProject_MShiiki_Morris
{
    public partial class CustomerMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Function to check for and display exceptions when the delete button is clicked
        protected void grdCustomersDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                // Since page was not required I decided to have fun with the displayed message
                lblError.Text = "You broke the database! " + " Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Another user already updated the product, try again later.";
            }
        }

        // Function to check for and display exceptions when the udpate button is selected
        protected void grdCustomersUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                // Since page was not required I used a label to display the most common errors
                lblError.Text = "Missing information! No field can be left blank and/or state code must be in two digits. ";
                lblErrorLine2.Text= " Error Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Another user may have already updated the product, try again later.";
            }
        }

    }
}