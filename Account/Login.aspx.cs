using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearnSphere.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LearnSphereDB.mdf;Integrated Security=True";

            SqlConnection con = new SqlConnection(connectionString);

            string query = "SELECT UserID, Name, Role FROM Users WHERE Email=@Email AND Password=@Password";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Session["UserID"] = reader["UserID"].ToString();
                Session["Name"] = reader["Name"].ToString();
                Session["Role"] = reader["Role"].ToString();

                Response.Redirect("~/Student/Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email or password.";
            }

            con.Close();

        }
    }
}