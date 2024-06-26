using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if cart items exist in session
                if (Session["CartItems"] != null)
                {
                    // Retrieve cart items from session
                    List<CartItem> cartItems = (List<CartItem>)Session["CartItems"];

                    // Bind cart items to GridView
                    gvCartItems.DataSource = cartItems;
                    gvCartItems.DataBind();

                    // Calculate unique types of products
                    var uniqueProducts = cartItems.Select(item => item.ProductName).Distinct().Count();

                    // Calculate wait time based on the number of unique types of products
                    int waitTime = 0;
                    if (uniqueProducts == 1)
                    {
                        waitTime = 15;
                    }
                    else if (uniqueProducts >= 2 && uniqueProducts <= 3)
                    {
                        waitTime = 25;
                    }
                    else if (uniqueProducts >= 4)
                    {
                        waitTime = 30;
                    }

                    // Display wait time
                    lblWaitTime.Text = $"Expected wait time: {waitTime} minutes";
                }

                // Check if total price exists in session
                if (Session["TotalPrice"] != null)
                {
                    // Display total price on the page
                    lblTotalPrice.Text = Session["TotalPrice"].ToString();
                }

                // Check if order ID exists in session
                if (Session["OrderId"] != null)
                {
                    string orderId = Session["OrderId"].ToString();
                    // Fetch order details from the database using the order ID
                    FetchOrderDetails(orderId);
                }

                // Calculate real total price
                CalculateRealTotalPrice();

            }
        }

        // Method to calculate the real total price
        private void CalculateRealTotalPrice()
        {
            if (!string.IsNullOrEmpty(lblTotalPrice.Text) && !string.IsNullOrEmpty(lblDeliveryFee.Text))
            {
                decimal totalPrice = Convert.ToDecimal(lblTotalPrice.Text);
                decimal deliveryFee = Convert.ToDecimal(lblDeliveryFee.Text);
                // Calculate real total price
                decimal realTotalPrice = totalPrice + deliveryFee;
                // Display real total price
                realTotalPricelbl.Text = realTotalPrice.ToString("C");
            }
        }
        private void FetchOrderDetails(string orderId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT  DeliveryFee, OrderAddress, OrderStatus, OrderDate FROM [Order] WHERE OrderID = @OrderId";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@OrderId", orderId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        lblDeliveryFee.Text = reader["DeliveryFee"].ToString();
                        lblOrderAddress.Text = reader["OrderAddress"].ToString();
                        lblOrderStatus.Text = reader["OrderStatus"].ToString();
                        lblOrderDate.Text = ((DateTime)reader["OrderDate"]).ToString("MM/dd/yyyy");
                    }
                }
            }
        }

    }
}