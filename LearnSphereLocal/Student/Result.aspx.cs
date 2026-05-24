using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Student
{
    public partial class Result : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LearnSphereDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if not logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ShowLatestResult();
                LoadHistory();
            }
        }

        // Shows the score from the quiz that was just completed
        private void ShowLatestResult()
        {
            // If the student arrived here directly (not from Quiz page), show a message
            if (Session["LastScore"] == null)
            {
                lblScore.Text = "-";
                lblMessage.Text = "No recent quiz found.";
                lblQuizName.Text = "";
                return;
            }

            int score = (int)Session["LastScore"];
            int total = (int)Session["LastTotal"];
            int quizID = (int)Session["LastQuizID"];

            lblScore.Text = score + " / " + total;

            // Feedback message based on percentage
            double pct = total > 0 ? (double)score / total * 100 : 0;

            if (pct >= 80) lblMessage.Text = "Excellent! Great job!";
            else if (pct >= 60) lblMessage.Text = "Good job! Keep it up.";
            else if (pct >= 40) lblMessage.Text = "Not bad. Keep studying!";
            else lblMessage.Text = "Don't give up. Try again!";

            // Get the quiz name from DB
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT Title FROM Quizzes WHERE QuizID = @QuizID", con);
            cmd.Parameters.AddWithValue("@QuizID", quizID);

            object result = cmd.ExecuteScalar();
            lblQuizName.Text = "Quiz: " + (result != null ? result.ToString() : "Unknown");

            con.Close();

            // Clear session so refreshing the page does not re-show the same result
            Session.Remove("LastScore");
            Session.Remove("LastTotal");
            Session.Remove("LastQuizID");
        }

        // Loads all quiz attempts made by this student
        private void LoadHistory()
        {
            int userID = int.Parse(Session["UserID"].ToString());

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT q.Title AS QuizTitle, " +
                "       r.Score, " +
                "       r.TotalQuestions, " +
                "       CAST(r.Score AS FLOAT) / NULLIF(r.TotalQuestions, 0) * 100 AS Percentage, " +
                "       r.DateTaken " +
                "FROM Results r " +
                "INNER JOIN Quizzes q ON r.QuizID = q.QuizID " +
                "WHERE r.UserID = @UserID " +
                "ORDER BY r.DateTaken DESC", con);

            cmd.Parameters.AddWithValue("@UserID", userID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvHistory.DataSource = dt;
            gvHistory.DataBind();

            con.Close();
        }
    }
}