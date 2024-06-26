using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;

namespace Assignment
{
    public partial class productDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the productID query string parameter is present
                if (Request.QueryString["productID"] != null)
                {
                    // Get the productID from the query string
                    string productID = Request.QueryString["productID"];

                    // Retrieve and display product details based on productID
                    DisplayProductDetails(productID);
                }
                else
                {
                    // Redirect to another page or display an error message
                    Response.Redirect("ErrorPage.aspx");
                }
            }
        }

        private void DisplayProductDetails(string productID)
        {
            try
            {
                // Construct the connection string
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Query to retrieve product details based on productID
                string query = "SELECT Product.*, Category.categoryName FROM Product INNER JOIN Category ON Product.categoryID = Category.categoryID WHERE Product.productID = @productID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@productID", productID);

                        // Open the connection
                        connection.Open();

                        // Execute the query and retrieve the data
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            // Display product details on the page
                            lblProductName.Text = reader["productName"].ToString();
                            lblPrice.Text = "RM" + Convert.ToDouble(reader["productPrice"]).ToString("0.00");
                            lblDesc.Text = reader["productDesc"].ToString();
                            lblCategoryName.Text = reader["categoryName"].ToString();

                            // Get the productPhoto URL
                            string productPhoto = reader["productPhoto"].ToString();
                            // Set the productImage URL
                            productImage.ImageUrl = productPhoto;

                            // Set the size of the image
                            productImage.Width = 500; // Set the width to 200 pixels
                            productImage.Height = 600; // Set the height to 200 pixels
                        }
                        else
                        {
                            // Handle the case when no product with the specified ID is found
                            // Redirect to an error page or display an error message
                            Response.Redirect("ErrorPage.aspx");
                        }

                        // Close the reader and connection
                        reader.Close();
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Response.Redirect("ErrorPage.aspx");
            }
        }

        private void AddProductToCart(string productId)
        {
            // Retrieve the cart items from session or initialize if null
            List<CartItem> cartItems = Session["CartItems"] as List<CartItem>;
            if (cartItems == null)
            {
                cartItems = new List<CartItem>();
            }

            // Check if the product is already in the cart
            CartItem existingItem = cartItems.FirstOrDefault(item => item.ProductID == productId);
            if (existingItem != null)
            {
                // If the product is already in the cart, increase its quantity
                existingItem.Quantity++;
            }
            else
            {
                // If the product is not in the cart, fetch its details from the database and add it to the cart with an initial quantity of 1
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT [productName], [productDesc], [productPrice], [productPhoto] FROM [Product] WHERE [productID] = @ProductId";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ProductId", productId);
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            // Create a new CartItem object with product details
                            CartItem newItem = new CartItem
                            {
                                ProductID = productId,
                                ProductName = reader["productName"].ToString(),
                                ProductPrice = Convert.ToDecimal(reader["productPrice"]),
                                Quantity = 1, // Initial quantity is 1
                                ProductPhoto = reader["productPhoto"].ToString()
                            };

                            // Add the new item to the cart
                            cartItems.Add(newItem);

                            // Update session with modified cart items
                            Session["CartItems"] = cartItems;
                        }

                        reader.Close();
                    }
                }
            }

            // Redirect to the Cart page to display the updated cart
            Response.Redirect("Cart.aspx");
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Get the product ID from the query string
            string productId = Request.QueryString["productId"];

            // Add the product to the cart (You will implement this logic later)
            AddProductToCart(productId);

            decimal totalSubtotal = 0;
            List<CartItem> cartItems = Session["CartItems"] as List<CartItem>;
            if (cartItems != null)
            {
                foreach (CartItem item in cartItems)
                {
                    totalSubtotal += item.Subtotal;
                }
                Session["TotalSubtotal"] = totalSubtotal;
            }

            // Redirect to Cart.aspx
            Response.Redirect("~/Cart.aspx");
        }
    }
}
