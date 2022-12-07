using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MIS442_TermProject_MShiiki_Morris
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {
        // Uses customer class in the models folder
        private Customer selectedCustomer;

        // Function and calls to get customers upon page loading
        protected void Page_Load(object sender, EventArgs e)
        {
            // Droop down list autopostback = true allowing for the selected customers information to automatically populate
            if (!IsPostBack)
            {
                // Assigns the customer selected in the drop down list control
                ddlCustomers.DataBind();
            }
            // Call to run GetSelectedCustomer and DisplayCustomer functions
            selectedCustomer = GetselectedCustomer();
            DisplayCustomer();
        }

        // Function to populate information about the selected customer
        private Customer GetselectedCustomer()
        {
            DataView customerTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter = "CustomerID = " + ddlCustomers.SelectedValue;
            DataRowView row = customerTable[0];

            // Assign and return  the required information for the selected customer and convert to appropriate datatypes
            Customer customer = new Customer();
            customer.CustomerID = Convert.ToInt32(row["CustomerID"]);
            customer.Name = row["Name"].ToString();
            customer.Address = row["Address"].ToString();
            customer.City = row["City"].ToString();
            customer.State = row["State"].ToString();
            customer.ZipCode = row["ZipCode"].ToString();
            customer.Phone = row["Phone"].ToString();
            customer.Email = row["Email"].ToString();
            return customer;
        }

        // Function to display selected customer information in the card display
        private void DisplayCustomer()
        {
            lblAddress.Text = selectedCustomer.Address;
            lblAddress2.Text = selectedCustomer.City + ", " + selectedCustomer.State + " " + selectedCustomer.ZipCode;
            lblPhone.Text = selectedCustomer.Phone;
            lblEmail.Text = selectedCustomer.Email;
        }

        // Function to add the selected customer to the contacts list
        protected void btnAddContact_Click(object sender, EventArgs e)
        {
            // Variable assignment and function calls
            CustomerList contacts = CustomerList.GetCustomers();
            Customer customer = contacts[selectedCustomer.Name];
            // checks to make sure current customer is not already on the list, if not it adds them and takes you to contact display page
            if (customer == null)
            {
                contacts.AddItem(selectedCustomer);
                Response.Redirect("~/ContactDisplay.aspx");
            }
            else
            {
                // Error message displayed if customer is already on the list
                lblErrorMsg.Text = "Customer already added to the contact list.";
            }
        }

        // Function for button click, takes user to contact display page
        protected void btnContactList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ContactDisplay.aspx");
        }

        // Function for button click, takes user to the customer incident page
        protected void btnCustomerIncident_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerIncidentDisplay");
        }
    }
}