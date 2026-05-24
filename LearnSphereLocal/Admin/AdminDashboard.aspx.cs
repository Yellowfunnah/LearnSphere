using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Admin
{
    public partial class AdminDashboard : Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LearnSphereDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblName.Text = Session["Name"].ToString();
                LoadStats();
            }
        }

        private void LoadStats()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", con);
            lblTotalUsers.Text = cmdUsers.ExecuteScalar().ToString();

            SqlCommand cmdCourses = new SqlCommand("SELECT COUNT(*) FROM Courses", con);
            lblTotalCourses.Text = cmdCourses.ExecuteScalar().ToString();

            SqlCommand cmdQuizzes = new SqlCommand("SELECT COUNT(*) FROM Quizzes", con);
            lblTotalQuizzes.Text = cmdQuizzes.ExecuteScalar().ToString();

            con.Close();
        }
    }
}