using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Account
{
    public partial class Login : Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LearnSphereDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, redirect away
            if (Session["UserID"] != null)
            {
                if (Session["Role"].ToString() == "Admin")
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
                else
                    Response.Redirect("~/Student/Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Server-side validation
            if (string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                ShowMessage("Please enter your email and password.", false);
                return;
            }

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT UserID, Name, Role FROM Users WHERE Email = @Email AND Password = @Password", con);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                // Store user info in session
                Session["UserID"] = reader["UserID"].ToString();
                Session["Name"] = reader["Name"].ToString();
                Session["Role"] = reader["Role"].ToString();

                reader.Close();
                con.Close();

                // Redirect based on role
                if (Session["Role"].ToString() == "Admin")
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
                else
                    Response.Redirect("~/Student/Dashboard.aspx");
            }
            else
            {
                reader.Close();
                con.Close();
                ShowMessage("Invalid email or password. Please try again.", false);
            }
        }

        private void ShowMessage(string msg, bool success)
        {
            lblMessage.Text = msg;
            lblMessage.CssClass = success
                ? "alert alert-success d-block mb-3"
                : "alert alert-danger d-block mb-3";
            lblMessage.Visible = true;
        }
    }
}