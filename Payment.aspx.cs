using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Payment : System.Web.UI.Page
    {
        // Connection string to your database
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            paymentForm.Visible = false;
            if (!IsPostBack)
            {
                // Check if TotalPrice exists in session state
                if (Session["TotalSubtotal"] != null)
                {
                    // Display the total price
                    TotalPriceLabel.Text = Session["TotalSubtotal"].ToString();
                }

            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Session["UserName"] = Address.Text;
            // Clear any previous error messages
            errorLabel.Text = "";

            // List to store error messages
            List<string> errorMessages = new List<string>();

            // Perform form validation here if needed
            // Validate card number

            long cardNumber;
            if (!long.TryParse(card.Text.Replace(" ", ""), out cardNumber) || cardNumber < 0 || cardNumber.ToString().Length != 16)
            {
                // Card number is not in a valid format or length
                // Handle the error, maybe show a message to the user
                errorMessages.Add("Invalid card number. Please enter a valid 16-digit card number.");
            }


            // Validate expiration date
            DateTime expirationDate;
            if (!DateTime.TryParseExact(expiry.Text, "MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out expirationDate) || expirationDate < DateTime.Now)
            {
                // Expiration date is not in a valid format or it's in the past
                // Handle the error, maybe show a message to the user
                errorMessages.Add("Invalid expiration date. Please enter a future expiration date in MM/YYYY format.");
            }

            // If there are any error messages, concatenate and display them
            if (errorMessages.Any())
            {

                Response.Redirect("Payment.aspx");
                errorLabel.Text = string.Join("<br>", errorMessages);
            }

            // Validate CVV
            int cvv;
            if (!int.TryParse(cvc.Text, out cvv))
            {
                // CVV is not a valid integer
                // Handle the error, maybe show a message to the user
                errorMessages.Add("Invalid CVV. Please enter a 3 or 4 digit CVV number.");
            }

            // Store total price in session
            Session["TotalPrice"] = TotalPriceLabel.Text;

            // Retrieve cart items from session
            List<CartItem> cartItems = (List<CartItem>)Session["CartItems"];

            // Create a new order in the Orders table
            string orderId = CreateOrder(GenerateUniqueOrderId());

            // Insert order details into OrderDetails table
            foreach (var item in cartItems)
            {
                InsertOrderDetails(orderId, item.ProductID, item.Quantity);
            }

            // Now, insert card details into the database
            InsertCardDetails(cardNumber, expirationDate, cvv);

            // After creating the order and inserting it into the database
            Session["OrderId"] = orderId;


            // Redirect to the PaymentSuccessful.aspx page
            Response.Redirect("PaymentSuccessful.aspx");

        }

        // Method to generate a unique cart ID
        private string GenerateCartID(string cartID)
        {
            return Guid.NewGuid().ToString().Substring(0, 5); // Generate a 5-character unique ID
        }

        // Method to create a new order in the Orders table
        private string CreateOrder(string cartID)
        {
            string orderId = GenerateUniqueOrderId();
            string cartId = GenerateUniqueCartId(); // Generate unique cart ID
            double totalPrice = Convert.ToDouble(Session["TotalPrice"]);
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Insert the new cart into the Cart table
            using (SqlConnection cartConnection = new SqlConnection(connectionString))
            {
                string cartQuery = "INSERT INTO Cart (cartID, totalPrice) VALUES (@cartId, @totalPrice)";
                using (SqlCommand cartCmd = new SqlCommand(cartQuery, cartConnection))
                {
                    cartCmd.Parameters.AddWithValue("@cartId", cartId);
                    cartCmd.Parameters.AddWithValue("@totalPrice", totalPrice); // Set the total price accordingly
                    cartConnection.Open();
                    cartCmd.ExecuteNonQuery();
                }
            }

            // Generate a random delivery fee
            Random random = new Random();
            double deliveryFee = random.Next(5, 20); // Assuming delivery fee range is between $5 and $20

            // Insert the order with the new cart ID
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [Order] (orderID, cartID, orderDate, orderStatus, orderAddress, deliveryFee) " +
                                "VALUES (@orderId, @cartId, @orderDate, @orderStatus, @orderAddress, @deliveryFee)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@orderId", orderId);
                    cmd.Parameters.AddWithValue("@cartId", cartId);
                    cmd.Parameters.AddWithValue("@orderDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@orderStatus", "Pending");
                    cmd.Parameters.AddWithValue("@orderAddress", Address.Text); // Add user's address here
                    cmd.Parameters.AddWithValue("@deliveryFee", deliveryFee); // Add randomly generated delivery fee
                    cmd.ExecuteNonQuery();
                }
            }

            return orderId;
        }

        // Method to insert order details into OrderItem table
        private void InsertOrderDetails(string orderId, string productId, int quantity)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO [dbo].[OrderItem] (orderID, productID, quantity) VALUES (@orderID, @productID, @quantity)";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Retrieve the order ID based on the cart ID

                    cmd.Parameters.AddWithValue("@orderID", orderId);
                    cmd.Parameters.AddWithValue("@productID", productId);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Method to retrieve the order ID based on the cart ID
        private int GetOrderIdByCartId(string cartId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT orderID FROM [dbo].[Order] WHERE cartID = @cartID";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@cartID", cartId);
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        private string GenerateUniqueOrderId()
        {
            // Generate a unique alphanumeric order ID
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, 5)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private string GenerateUniqueCartId()
        {
            // Generate a unique alphanumeric order ID
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, 5)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }


        long LongRandom(long min, long max, Random rand)
        {
            long result = rand.Next((Int32)(min >> 32), (Int32)(max >> 32));
            result = (result << 32);
            result = result | (long)rand.Next((Int32)min, (Int32)max);
            return result;
        }

        private void InsertCardDetails(long cardNumber, DateTime expirationDate, int cvv)
        {
            // Use the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                // Insert card details into the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Card (CardNo, expiryDate, cvv) VALUES (@cardNo, @expiryDate, @cvv)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@cardNo", LongRandom(0,9999999999999999, new Random()));
                        command.Parameters.AddWithValue("@expiryDate", expirationDate);
                        command.Parameters.AddWithValue("@cvv", cvv);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                // Check if the exception is due to a duplicate key violation (error code 2627)
                if (ex.Number == 2627)
                {
                    // Handle the duplicate card number error here
                    // For example, you can display a message to the user
                    // or log the error for further investigation
                }
                else
                {
                    // Handle other SQL Server exceptions here if needed
                    throw; // Rethrow the exception for further handling
                }
            }
        }





        protected void CashPaymentButton_Click(object sender, EventArgs e)
        {
            cashPaymentMessage.Visible = true;
            paymentForm.Visible = false;
        }



        protected void CreditCardPaymentButton_Click(object sender, EventArgs e)
        {
            cashPaymentMessage.Visible = false;
            paymentForm.Visible = true;
        }



    }
}