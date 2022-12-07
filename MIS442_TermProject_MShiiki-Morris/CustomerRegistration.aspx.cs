using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS442_TermProject_MShiiki_Morris
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Function called when the registration button is clicked
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Checks the field validation group prior to submission, preventing incomplete forms creating traffic to sever
            Page.Validate("vgrpRegistration");
            // Runs if valid, otherwise validation error message will be displayed
            if (Page.IsValid)
            {
                // Pulls data to insert into database file. To prevent errors state entry provided through drop down list
                SqlDataSource1.InsertParameters["Name"].DefaultValue = tbName.Text;
                SqlDataSource1.InsertParameters["Address"].DefaultValue = tbAddress.Text;
                SqlDataSource1.InsertParameters["City"].DefaultValue = tbCity.Text;
                SqlDataSource1.InsertParameters["State"].DefaultValue = ddlState.SelectedValue;
                SqlDataSource1.InsertParameters["ZipCode"].DefaultValue = tbZip.Text;
                SqlDataSource1.InsertParameters["Phone"].DefaultValue = tbPhone.Text;
                SqlDataSource1.InsertParameters["Email"].DefaultValue = tbEmail.Text;
                // Try statement to catch exceptions, displays success message if valid, otherwise will provide exception error message
                try
                {
                    SqlDataSource1.Insert();
                    tbName.Text = "";
                    tbAddress.Text = "";
                    tbCity.Text = "";
                    ddlState.SelectedValue = ddlState.SelectedValue;
                    tbZip.Text = "";
                    tbPhone.Text = "";
                    tbEmail.Text = "";
                    lblErrorMessage.Text = "Registration successful!";
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "A database error has occurred. "
                        + "Message: " + ex.Message;
                }
            }
        }
    }
}