using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Student
{
    public partial class Dashboard : Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LearnSphereDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Guard: must be logged in as Student
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (Session["Role"].ToString() == "Admin")
            {
                Response.Redirect("~/Admin/AdminDashboard.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblName.Text = Session["Name"].ToString();
                lblRole.Text = Session["Role"].ToString();
                LoadStats();
                LoadRecentResults();
            }
        }

        private void LoadStats()
        {
            int userID = int.Parse(Session["UserID"].ToString());

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            // Total quizzes taken
            SqlCommand cmdCount = new SqlCommand(
                "SELECT COUNT(*) FROM Results WHERE UserID = @UserID", con);
            cmdCount.Parameters.AddWithValue("@UserID", userID);
            int quizCount = (int)cmdCount.ExecuteScalar();
            lblQuizCount.Text = quizCount.ToString();

            // Average score percentage
            if (quizCount > 0)
            {
                SqlCommand cmdAvg = new SqlCommand(
                    "SELECT AVG(CAST(Score AS FLOAT) / NULLIF(TotalQuestions, 0) * 100) FROM Results WHERE UserID = @UserID", con);
                cmdAvg.Parameters.AddWithValue("@UserID", userID);
                double avg = (double)cmdAvg.ExecuteScalar();
                lblAvgScore.Text = avg.ToString("F1") + "%";
            }
            else
            {
                lblAvgScore.Text = "N/A";
            }

            con.Close();
        }

        private void LoadRecentResults()
        {
            int userID = int.Parse(Session["UserID"].ToString());

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT TOP 5 q.Title AS QuizTitle, r.Score, r.TotalQuestions, " +
                "CAST(r.Score AS FLOAT) / NULLIF(r.TotalQuestions, 0) * 100 AS Percentage, " +
                "r.DateTaken " +
                "FROM Results r " +
                "INNER JOIN Quizzes q ON r.QuizID = q.QuizID " +
                "WHERE r.UserID = @UserID " +
                "ORDER BY r.DateTaken DESC", con);
            cmd.Parameters.AddWithValue("@UserID", userID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvRecent.DataSource = dt;
            gvRecent.DataBind();

            con.Close();
        }
    }
}