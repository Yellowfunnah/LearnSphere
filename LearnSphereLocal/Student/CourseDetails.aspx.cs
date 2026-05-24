using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Student
{
    public partial class CourseDetails : Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LearnSphereDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                int courseID;
                if (!int.TryParse(Request.QueryString["courseID"], out courseID))
                {
                    Response.Redirect("~/Student/Courses.aspx");
                    return;
                }

                LoadCourse(courseID);
                LoadQuiz(courseID);
            }
        }

        private void LoadCourse(int courseID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT Title, Description FROM Courses WHERE CourseID = @CourseID", con);
            cmd.Parameters.AddWithValue("@CourseID", courseID);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblCourseTitle.InnerText = reader["Title"].ToString();
                lblCourseDesc.InnerText = reader["Description"].ToString();
            }
            else
            {
                Response.Redirect("~/Student/Courses.aspx");
            }

            reader.Close();
            con.Close();
        }

        private void LoadQuiz(int courseID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT QuizID, Title, Description FROM Quizzes WHERE CourseID = @CourseID", con);
            cmd.Parameters.AddWithValue("@CourseID", courseID);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblQuizTitle.InnerText = reader["Title"].ToString();
                lblQuizDesc.InnerText = reader["Description"].ToString();
                lnkStartQuiz.NavigateUrl = "~/Student/Quiz.aspx?quizID=" + reader["QuizID"].ToString();
                pnlQuiz.Visible = true;
                pnlNoQuiz.Visible = false;
            }
            else
            {
                pnlQuiz.Visible = false;
                pnlNoQuiz.Visible = true;
            }

            reader.Close();
            con.Close();
        }
    }
}