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
    public partial class Register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);


            // Get user input from form fields
            string name = txtName.Text.Trim();
            string password = txtPassword.Text.Trim();
            string gender = ddlGender.SelectedValue;
            int contactNumber = int.Parse(txtContactNumber.Text);
            string email = txtEmail.Text.Trim();
            string deliveryAddress = txtDeliveryAddress.Text.Trim();
            string joinedDate = txtJoinedDate.Text.Trim();

            // Save user data to the database
            bool registrationSuccess = RegisterUser(name, password, gender, contactNumber, email, deliveryAddress, joinedDate);

            if (registrationSuccess)
            {
                // Registration successful, redirect to login page
                Response.Redirect("Login1.aspx");
            }
            else
            {
                // Registration failed, show error message
                lblMessage.Text = "Registration failed. Please try again later.";
                lblMessage.Visible = true;
            }
        }

        private bool RegisterUser(string name, string password, string gender, int contactNumber, string email, string deliveryAddress, string joinedDate)
        {
            // Modify the connection string to match your database settings
            //string connectionString = "Your_Connection_String_Here";
            //string connectionString = "Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;";
            //string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|Database1.mdf;Integrated Security=True;";

            //string connectionString = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = \"C:\\Users\\Tang Chun Xuan\\Downloads\\webApplicationAssignment\\Assignment\\Assignment\\App_Data\\foodie.mdf\"; Integrated Security = True";

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|
            //\NORTHWIND.mdf;Integrated Security=True");

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    // Construct SQL query
                    string query = "INSERT INTO [User] (custID, custName, custPassword, custGender, custPhone, custEmail, custAddress, custJoinedDate) VALUES (@custId, @custName, @custPassword, @custGender, @custPhone, @custEmail, @custAddress, @custJoinedDate)";
                    connection.Open();
                    // Create command and parameters
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        string userId = Guid.NewGuid().ToString(); //auto generate random ID
                        //do ID, its missing right now
                        command.Parameters.AddWithValue("@custId", userId);
                        command.Parameters.AddWithValue("@custName", name);
                        command.Parameters.AddWithValue("@custPassword", password);
                        command.Parameters.AddWithValue("@custGender", gender);
                        command.Parameters.AddWithValue("@custPhone", contactNumber);
                        command.Parameters.AddWithValue("@custEmail", email);
                        command.Parameters.AddWithValue("@custAddress", deliveryAddress);
                        command.Parameters.AddWithValue("@custJoinedDate", joinedDate);

                        // Open connection and execute command
                        
                        command.ExecuteNonQuery();

                        // Check if user registration was successful
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {

                System.Diagnostics.Debug.WriteLine("Error opening connection: " + ex.Message);
                // Handle the exception, log it, or display an error message
                // For simplicity, we're just returning false here
                return false;
            }
        }
    }
}