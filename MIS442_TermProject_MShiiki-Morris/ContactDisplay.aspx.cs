using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS442_TermProject_MShiiki_Morris
{
    public partial class ContactDisplay : System.Web.UI.Page
    {
        // Uses customer list class under models folder
        private CustomerList contacts;

        // Function and calls to get customers upon page loading
        protected void Page_Load(object sender, EventArgs e)
        {
            contacts = CustomerList.GetCustomers();
            if (!IsPostBack)
                // Call to run DisplayContacts function
                DisplayContacts();
        }

        // Function that displays each customer added from customer display
        private void DisplayContacts()
        {
            // Clear the list and assign customer
            lsbContacts.Items.Clear();
            Customer customer;
            // Loop through all customers and adds them to the display
            for (int i = 0; i < contacts.Count; i++)
            {
                customer = contacts[i];
                lsbContacts.Items.Add(customer.ContactDisplay());
            }
        }

        // Function for button click, takes user back to customer display
        protected void btnAdditional_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerDisplay.aspx");
        }

        // Function for the remove button
        protected void btnRemove_Click1(object sender, EventArgs e)
        {
            // selects the proper array index for the selected customer to be removed and checks to make sure array is not empty
            if (lsbContacts.SelectedIndex > -1 && contacts.Count > 0)
            {
                // removes selected customer from contact list and calls DisplayContacts function to repopulate display
                contacts.RemoveAt(lsbContacts.SelectedIndex);
                DisplayContacts();
            }
        }
        
        // Function to clear the entire contact list
        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            // clear the array and all customers displayed
            contacts.Clear();
            lsbContacts.Items.Clear();
        }
    }

}