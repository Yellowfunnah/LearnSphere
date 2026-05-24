using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Account
{
    public partial class Register : Page
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Server-side validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                ShowMessage("All fields are required.", false);
                return;
            }

            if (txtPassword.Text.Length < 6)
            {
                ShowMessage("Password must be at least 6 characters.", false);
                return;
            }

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            // Check if email already exists
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Email = @Email", con);
            checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            int count = (int)checkCmd.ExecuteScalar();

            if (count > 0)
            {
                ShowMessage("An account with this email already exists.", false);
                con.Close();
                return;
            }

            // Insert new user
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Users (Name, Email, Password, Role) VALUES (@Name, @Email, @Password, @Role)", con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
            cmd.ExecuteNonQuery();

            con.Close();

            ShowMessage("Account created successfully! Redirecting to login...", true);

            // Redirect to login after short delay
            Response.AddHeader("REFRESH", "2;URL=Login.aspx");
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