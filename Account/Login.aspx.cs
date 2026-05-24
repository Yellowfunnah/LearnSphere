using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WAPPAssignment.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["WAPPConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"SELECT UserID, FullName, Email, Role 
                                 FROM Users 
                                 WHERE Email=@Email AND Password=@Password";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["UserID"] = reader["UserID"].ToString();
                    Session["FullName"] = reader["FullName"].ToString();
                    Session["Email"] = reader["Email"].ToString();
                    Session["Role"] = reader["Role"].ToString().Trim();

                    if (Session["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("~/Admin/AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Student/Dashboard.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }
}