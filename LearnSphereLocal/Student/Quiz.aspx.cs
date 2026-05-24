using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Student
{
    public partial class Quiz : System.Web.UI.Page
    {
        // Hardcoded connection string — matches the pattern used by the rest of the team
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
                // quizID must be passed in the URL: Quiz.aspx?quizID=1
                int quizID;
                if (!int.TryParse(Request.QueryString["quizID"], out quizID))
                {
                    Response.Redirect("~/Studnet/Courses.aspx");
                    return;
                }

                hfQuizID.Value = quizID.ToString();
                LoadQuiz(quizID);
            }
        }

        // Loads quiz title, description, and questions from the database
        private void LoadQuiz(int quizID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            // Load quiz title and description
            SqlCommand cmdQuiz = new SqlCommand(
                "SELECT Title, Description FROM Quizzes WHERE QuizID = @QuizID", con);
            cmdQuiz.Parameters.AddWithValue("@QuizID", quizID);
            SqlDataReader readerQuiz = cmdQuiz.ExecuteReader();

            if (readerQuiz.Read())
            {
                lblQuizTitle.InnerText = readerQuiz["Title"].ToString();
                lblQuizDesc.InnerText = readerQuiz["Description"].ToString();
            }
            readerQuiz.Close();

            // Load questions for this quiz
            SqlCommand cmdQ = new SqlCommand(
                "SELECT QuestionID, QuestionText, OptionA, OptionB, OptionC, OptionD " +
                "FROM Questions WHERE QuizID = @QuizID ORDER BY QuestionID", con);
            cmdQ.Parameters.AddWithValue("@QuizID", quizID);

            SqlDataAdapter da = new SqlDataAdapter(cmdQ);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptQuestions.DataSource = dt;
            rptQuestions.DataBind();

            // Build a comma-separated list of QuestionIDs for client-side JS validation
            List<string> ids = new List<string>();
            foreach (DataRow row in dt.Rows)
                ids.Add(row["QuestionID"].ToString());
            hfQuestionIDs.Value = string.Join(",", ids);

            con.Close();
        }

        // Fires when student clicks Submit Quiz
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int quizID = int.Parse(hfQuizID.Value);
            string[] qids = hfQuestionIDs.Value.Split(',');

            // Server-side check: all questions must be answered
            foreach (string qid in qids)
            {
                string answer = Request.Form["question_" + qid];
                if (string.IsNullOrEmpty(answer))
                {
                    lblError.Text = "Please answer all questions before submitting.";
                    lblError.Visible = true;
                    LoadQuiz(quizID); // re-bind so questions still appear
                    return;
                }
            }

            // Calculate the score by checking each answer against the DB
            int score = 0;
            int total = qids.Length;

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            foreach (string qid in qids)
            {
                string selected = Request.Form["question_" + qid];

                SqlCommand cmd = new SqlCommand(
                    "SELECT CorrectAnswer FROM Questions WHERE QuestionID = @QID", con);
                cmd.Parameters.AddWithValue("@QID", int.Parse(qid));

                string correct = cmd.ExecuteScalar().ToString().Trim();
                if (selected == correct)
                    score++;
            }

            // Save the result to the Results table
            int userID = int.Parse(Session["UserID"].ToString());

            SqlCommand cmdInsert = new SqlCommand(
                "INSERT INTO Results (UserID, QuizID, Score, TotalQuestions, DateTaken) " +
                "VALUES (@UserID, @QuizID, @Score, @Total, GETDATE())", con);

            cmdInsert.Parameters.AddWithValue("@UserID", userID);
            cmdInsert.Parameters.AddWithValue("@QuizID", quizID);
            cmdInsert.Parameters.AddWithValue("@Score", score);
            cmdInsert.Parameters.AddWithValue("@Total", total);
            cmdInsert.ExecuteNonQuery();

            con.Close();

            // Pass score to the Result page via Session and redirect
            Session["LastScore"] = score;
            Session["LastTotal"] = total;
            Session["LastQuizID"] = quizID;

            Response.Redirect("~/Student/Result.aspx");
        }
    }
}