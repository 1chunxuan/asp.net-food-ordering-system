using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Assignment
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if session contains email information
                if (Session["UserEmail"] != null)
                {
                    string email = Session["UserEmail"] as string;

                    // Populate user details using retrieved email
                    //string connectionString = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = \"C:\\Users\\Tang Chun Xuan\\Downloads\\webApplicationAssignment\\Assignment\\Assignment\\App_Data\\foodie.mdf\"; Integrated Security = True";

                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    PopulateUserDetails(connectionString, email);
                }
                else
                {
                    // If session doesn't contain email information, redirect to login page
                    Response.Redirect("Login1.aspx");
                }
            }
        }


        private void PopulateUserDetails(string connectionString, string email)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT custName, custPassword, custGender, custPhone, custEmail, custAddress, custJoinedDate FROM [dbo].[User] WHERE custEmail = @Email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                connection.Open();
                adapter.Fill(dataTable);
                connection.Close();

                if (dataTable.Rows.Count > 0)
                {
                    DataRow row = dataTable.Rows[0];
                    lblName.Text = row["custName"].ToString();
                    lblPassword.Text = row["custPassword"].ToString();
                    lblGender.Text = row["custGender"].ToString();
                    lblContactNumber.Text = row["custPhone"].ToString();
                    lblEmail.Text = row["custEmail"].ToString();
                    lblDeliveryAddress.Text = row["custAddress"].ToString();
                    lblJoinedDate.Text = Convert.ToDateTime(row["custJoinedDate"]).ToString("yyyy-MM-dd");
                }
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            // Update user profile
            UpdateUserProfile();
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            // Your btnEditProfile_Click logic here
        }

        protected void btnDeleteProfile_Click(object sender, EventArgs e)
        {
            // Your btnDeleteProfile_Click logic here
        }

        private void LoadUserProfile()
        {
            // Load user profile data from database and populate the form fields
            // Example:
            // Implement your logic here to populate the form fields with user profile data
        }

        private void UpdateUserProfile()
        {
            // Update user profile data in the database
            // Example:
            // Implement your logic here to update the user profile data in the database
        }

        private void DeleteUserProfile()
        {
            // Delete user profile data from the database
            // Example:
            // Implement your logic here to delete the user profile data from the database
        }
    }
}