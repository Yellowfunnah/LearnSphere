using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace LearnSphere.Account
{
    public partial class Register : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["WAPPConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string role = ddlRole.SelectedValue;

            if (username == "" || email == "" || password == "" || confirmPassword == "")
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            if (!IsStrongPassword(password))
            {
                lblMessage.Text = "Weak password. Use at least 8 characters, uppercase, lowercase, number, and symbol.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username OR Email = @Email";

                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@Username", username);
                checkCmd.Parameters.AddWithValue("@Email", email);

                int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (exists > 0)
                {
                    lblMessage.Text = "Username or email already exists.";
                    return;
                }

                string insertQuery = @"INSERT INTO Users
                    (Username, Email, Password, Role, IsActive, CreatedAt)
                    VALUES
                    (@Username, @Email, @Password, @Role, 1, GETDATE())";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Role", role);

                cmd.ExecuteNonQuery();

                Response.Redirect("~/Account/Login.aspx");
            }
        }

        private bool IsStrongPassword(string password)
        {
            return password.Length >= 8 &&
                   Regex.IsMatch(password, "[A-Z]") &&
                   Regex.IsMatch(password, "[a-z]") &&
                   Regex.IsMatch(password, "[0-9]") &&
                   Regex.IsMatch(password, "[^a-zA-Z0-9]");
        }
    }
}