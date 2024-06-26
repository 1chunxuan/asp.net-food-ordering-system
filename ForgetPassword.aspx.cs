using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;
using System.Configuration;

namespace Assignment
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //string connectionString = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = \"C:\\Users\\Tang Chun Xuan\\Downloads\\webApplicationAssignment\\Assignment\\Assignment\\App_Data\\foodie.mdf\"; Integrated Security = True";

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string custPhone = txtCustPhone.Text;
            string custAddress = txtCustAddress.Text;
            string custName = txtCustName.Text;
            string custEmail = txtCustEmail.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(1) FROM [dbo].[User] WHERE custPhone = @Phone AND custAddress = @Address AND custName = @Name AND custEmail = @Email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Phone", custPhone);
                command.Parameters.AddWithValue("@Address", custAddress);
                command.Parameters.AddWithValue("@Name", custName);
                command.Parameters.AddWithValue("@Email", custEmail);

                connection.Open();
                int count = (int)command.ExecuteScalar();
                string password = string.Empty;

                if (count == 1)
                {
                    query = "SELECT custPassword FROM [dbo].[User] WHERE custPhone = @Phone AND custAddress = @Address AND custName = @Name AND custEmail = @Email";
                    command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Phone", custPhone);
                    command.Parameters.AddWithValue("@Address", custAddress);
                    command.Parameters.AddWithValue("@Name", custName);
                    command.Parameters.AddWithValue("@Email", custEmail);
                    password = (string)command.ExecuteScalar();
                }
                connection.Close();

                if (count == 1 && !string.IsNullOrEmpty(password))
                {
                    lblPassword.Text = "Your password is: " + password;
                    lblPassword.Visible = true;
                    lnkLogin.Visible = true; // Show the link to Login1.aspx
                }
                else
                {
                    lblMessage.Text = "Invalid user information. Please try again.";
                }
            }
        }
    }
}