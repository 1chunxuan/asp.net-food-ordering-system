using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*protected void btnLogin_Click(object sender, EventArgs e)
        {
            Add your login logic here
            Code to validate login credentials
            Redirect to the user details page after successful login
            Response.Redirect("UserDetails.aspx"); //- admin page
            homepage - client page
        }
        */

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            // Redirect to ForgotPassword.aspx when the "Forgot Password?" link is clicked
            Response.Redirect("ForgotPassword.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get user input
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Validate email and password
            if (IsValidEmail(email) && IsValidPassword(password))
            {
                // Check if the email and password are correct by querying the database
                if (AuthenticateUser(email, password))
                {
                    // Authentication successful, redirect to appropriate page based on user type
                    if (ddlUserType.SelectedValue == "Client")
                    {
                        // Redirect to client/customer dashboard or profile page
                        //Response.Redirect("~/ClientDashboard.aspx");
                        Response.Redirect("Profile.aspx");
                    }
                    else if (ddlUserType.SelectedValue == "Admin")
                    {
                        // Redirect to admin/staff dashboard
                        //Response.Redirect("~/AdminDashboard.aspx");
                        Response.Redirect("UserDetails.aspx");
                    }
                }
                else
                {
                    // Authentication failed, display error message
                    lblMessage.Text = "Invalid email or password.";
                }
            }
            else
            {
                // Invalid email or password format, display error message
                lblMessage.Text = "Invalid email or password format.";
            }
        }

        private bool IsValidEmail(string email)
        {
            // Implement email validation logic here (e.g., regular expression)
            // Example: return System.Text.RegularExpressions.Regex.IsMatch(email, yourRegexPattern);
            // For simplicity, let's assume any non-empty string is considered a valid email
            return !string.IsNullOrWhiteSpace(email);
        }

        private bool IsValidPassword(string password)
        {
            // Implement password validation logic here (e.g., minimum length)
            // For simplicity, let's assume any non-empty string is considered a valid password
            return !string.IsNullOrWhiteSpace(password);
        }

        private bool AuthenticateUser(string email, string password)
        {
            // Replace the placeholders with your actual database connection details
            //string connectionString = "Data Source=myServerAddress;Initial Catalog=myDatabase;User Id=myUsername;Password=myPassword;";
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|Database1.mdf;Integrated Security=True;";
            // Implement logic to authenticate user by querying the database
            // Here you would check if the provided email and password match a record in your database
            // Replace the connection string and query with your actual database details
            string query = "SELECT COUNT(*) FROM Customer WHERE custEmail = @custEmail AND custPassword = @custPassword";
            //this is column name                     //this can be anyname i think
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@custEmail", email);
                    cmd.Parameters.AddWithValue("@custPassword", password);

                    try
                    {
                        con.Open();
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                        // Handle the exception (e.g., log it, display an error message)
                        Console.WriteLine("Error opening connection: " + ex.Message);
                        return false; // Return false indicating authentication failure
                    }
                }
            }
        }



    }
}