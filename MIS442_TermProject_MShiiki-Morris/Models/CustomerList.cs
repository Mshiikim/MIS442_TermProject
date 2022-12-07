using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// List class for customers with custom functions
public class CustomerList
{
    // Declare list
    private List<Customer> customers;

    // Assignment of list object
    public CustomerList()
    {
        customers = new List<Customer>();
    }

    // Function to count total customers on list
    public int Count
    {
        get { return customers.Count; }
    }
    // Function to return selected customer at index position
    public Customer this[int index]
    {
        get { return customers[index]; }
        set { customers[index] = value; }
    }

    // Function to check if customer already exists
    public Customer this[string name]
    {
        get
        {
            foreach (Customer c in customers)
            {
                if (c.Name == name)
                    return c;
            }
            return null;
        }
    }

    // Function for adding customer to list
    public static CustomerList GetCustomers()
    {
        CustomerList customers = (CustomerList)HttpContext.Current.Session["Customers"];
        if (customers == null)
        {
            HttpContext.Current.Session.Add("customers", new CustomerList());
        }
        return (CustomerList)HttpContext.Current.Session["Customers"];
    }

    // Function for adding customer object to list
    public void AddItem(Customer customer)
    {
        customers.Add(customer);
    }

    // Function to remove customer object from list
    public void RemoveAt(int index)
    {
        customers.RemoveAt(index);
    }

    // Function to clear list
    public void Clear()
    {
        customers.Clear();
    }
}