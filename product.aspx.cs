using Assignment.Models;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsUserLoggedIn())
            {
                Response.Redirect("Login1.aspx?error=You must be logged in to buy our products. Thank you for your cooperation!");

            }
            else
            {
                if (!string.IsNullOrEmpty(Request.QueryString["categoryID"]))
                {
                    string categoryID = Request.QueryString["categoryID"];

                    // Assuming you have a method to get the category name based on its ID
                    string categoryName = GetCategoryName(categoryID);

                    // Set the text of lblMeal to the categoryName
                    lblMeal.Text = categoryName;
                }
            }

           

        }

        private bool IsUserLoggedIn()
        {
            return Session["UserEmail"] != null; // Assuming you set UserEmail in session after successful login
        }

        private string GetCategoryName(string categoryID)
        {
            string categoryName = ""; // Initialize with empty string
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Define the SQL query to retrieve the category name
            string query = "SELECT categoryName FROM Category WHERE categoryID = @categoryID";

            // Establish a connection and execute the query
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@categoryID", categoryID);

                    // Open the connection
                    connection.Open();

                    // Execute the command and retrieve the category name
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        categoryName = result.ToString(); // Assign the retrieved category name
                    }
                }
            }

            return categoryName;
        }

        protected void redirectToProductDetails(object sender, EventArgs e)
        {
            // Get the product ID from the CommandArgument of the clicked LinkButton
            LinkButton clickedButton = (LinkButton)sender;
            string productId = clickedButton.CommandArgument;

            // Redirect to the product details page with the product ID as a query string parameter
            Response.Redirect($"productDetails.aspx?productId={productId}");
        }

    }
}
