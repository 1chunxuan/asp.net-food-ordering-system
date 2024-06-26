using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check for error message in query string
                string errorMessage = Request.QueryString["error"];
                if (!string.IsNullOrEmpty(errorMessage))
                {
                    errorlbl.Text = errorMessage;
                }
            }
            btnLogin.ServerClick += BtnLogin_Click;

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
           // string connectionString = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = \"C:\\Users\\Tang Chun Xuan\\Downloads\\webApplicationAssignment\\Assignment\\Assignment\\App_Data\\foodie.mdf\"; Integrated Security = True";

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string email = txtEmail.Value;
            string password = txtPassword.Value;
            string userType = ddlUserType.SelectedValue; // Retrieve the selected user type


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(1) FROM [dbo].[User] WHERE custEmail = @Email AND custPassword = @Password AND role = @Role"; // Include role in the query
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@Role", userType); // Add role parameter

                connection.Open();
                int count = (int)command.ExecuteScalar();
                connection.Close();

                if (count == 1)
                {
                    Session["UserEmail"] = email;
                    if (userType == "Customer")
                    {
                        // Redirect to user profile page
                        Response.Redirect("Profile.aspx");
                    }
                    else if (userType == "Staff")
                    {
                        // Redirect to admin home page
                        Response.Redirect("adminHome.aspx");
                    }
                }
                else
                {
                    // User not authenticated, redirect to home page
                    errorlbl.Text = "Password or email incorrect. Please try again";
                    Response.Redirect("Login1.aspx");
                }
            }
        }


    }
}