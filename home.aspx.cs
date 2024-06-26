using System;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Method to handle the click event of category link buttons
        protected void redirectToProduct(object sender, EventArgs e)
        {
            // Get the category ID from the command argument of the clicked link button
            LinkButton clickedButton = (LinkButton)sender;
            string categoryId = clickedButton.CommandArgument;

            // Redirect to the product page with the category ID as query string parameter
            Response.Redirect($"product.aspx?categoryId={categoryId}");
        }
    }
}
