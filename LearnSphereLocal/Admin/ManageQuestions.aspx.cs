using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearnSphereLocal.Admin
{
    public partial class ManageQuestions : Page
    {
        private string connStr = ConfigurationManager
            .ConnectionStrings["LearnSphereDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // --- Guard: Admin only ---
            if (Session["UserID"] == null || Session["Role"]?.ToString() != "Admin")
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadQuizDropdown();
            }
        }

        // Populate the quiz selector from the Quizzes table
        private void LoadQuizDropdown()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT QuizID, Title FROM Quizzes ORDER BY QuizID", conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlQuiz.Items.Clear();
                    ddlQuiz.Items.Add(new ListItem("-- Select a Quiz --", "0"));
                    foreach (DataRow row in dt.Rows)
                        ddlQuiz.Items.Add(new ListItem(row["Title"].ToString(), row["QuizID"].ToString()));
                }
            }
        }

        // Re-load questions whenever a different quiz is selected
        protected void ddlQuiz_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadQuestions();
            ClearForm();
        }

        // SELECT: load questions belonging to the selected quiz
        private void LoadQuestions()
        {
            int quizID;
            if (!int.TryParse(ddlQuiz.SelectedValue, out quizID) || quizID == 0)
            {
                gvQuestions.DataSource = null;
                gvQuestions.DataBind();
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT QuestionID, QuestionText, CorrectAnswer
                      FROM Questions WHERE QuizID = @QuizID ORDER BY QuestionID", conn))
                {
                    cmd.Parameters.AddWithValue("@QuizID", quizID);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvQuestions.DataSource = dt;
                    gvQuestions.DataBind();
                }
            }
        }

        // INSERT or UPDATE depending on hfQuestionID value
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int quizID;
            if (!int.TryParse(ddlQuiz.SelectedValue, out quizID) || quizID == 0)
            {
                ShowMessage("Please select a quiz before adding a question.", false);
                return;
            }

            // --- Server-side validation (in addition to ASP.NET validators) ---
            if (string.IsNullOrWhiteSpace(txtQuestion.Text) ||
                string.IsNullOrWhiteSpace(txtOptionA.Text) ||
                string.IsNullOrWhiteSpace(txtOptionB.Text) ||
                string.IsNullOrWhiteSpace(txtOptionC.Text) ||
                string.IsNullOrWhiteSpace(txtOptionD.Text))
            {
                ShowMessage("All fields are required.", false);
                return;
            }

            int questionID = int.Parse(hfQuestionID.Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                if (questionID == 0)
                {
                    // --- INSERT new question ---
                    using (SqlCommand cmd = new SqlCommand(@"
                        INSERT INTO Questions
                            (QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
                        VALUES
                            (@QuizID, @QText, @A, @B, @C, @D, @Correct)", conn))
                    {
                        cmd.Parameters.AddWithValue("@QuizID", quizID);
                        cmd.Parameters.AddWithValue("@QText", txtQuestion.Text.Trim());
                        cmd.Parameters.AddWithValue("@A", txtOptionA.Text.Trim());
                        cmd.Parameters.AddWithValue("@B", txtOptionB.Text.Trim());
                        cmd.Parameters.AddWithValue("@C", txtOptionC.Text.Trim());
                        cmd.Parameters.AddWithValue("@D", txtOptionD.Text.Trim());
                        cmd.Parameters.AddWithValue("@Correct", ddlCorrect.SelectedValue);
                        cmd.ExecuteNonQuery();
                    }
                    ShowMessage("Question added successfully!", true);
                }
                else
                {
                    // --- UPDATE existing question ---
                    using (SqlCommand cmd = new SqlCommand(@"
                        UPDATE Questions SET
                            QuestionText  = @QText,
                            OptionA       = @A,
                            OptionB       = @B,
                            OptionC       = @C,
                            OptionD       = @D,
                            CorrectAnswer = @Correct
                        WHERE QuestionID = @QID", conn))
                    {
                        cmd.Parameters.AddWithValue("@QText", txtQuestion.Text.Trim());
                        cmd.Parameters.AddWithValue("@A", txtOptionA.Text.Trim());
                        cmd.Parameters.AddWithValue("@B", txtOptionB.Text.Trim());
                        cmd.Parameters.AddWithValue("@C", txtOptionC.Text.Trim());
                        cmd.Parameters.AddWithValue("@D", txtOptionD.Text.Trim());
                        cmd.Parameters.AddWithValue("@Correct", ddlCorrect.SelectedValue);
                        cmd.Parameters.AddWithValue("@QID", questionID);
                        cmd.ExecuteNonQuery();
                    }
                    ShowMessage("Question updated successfully!", true);
                }
            }

            ClearForm();
            LoadQuestions();
        }

        // Handles Edit and Delete button clicks inside the GridView
        protected void gvQuestions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int questionID = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditQuestion")
            {
                // --- Load question data into the form for editing ---
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM Questions WHERE QuestionID = @QID", conn))
                    {
                        cmd.Parameters.AddWithValue("@QID", questionID);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            hfQuestionID.Value = questionID.ToString();
                            txtQuestion.Text = reader["QuestionText"].ToString();
                            txtOptionA.Text = reader["OptionA"].ToString();
                            txtOptionB.Text = reader["OptionB"].ToString();
                            txtOptionC.Text = reader["OptionC"].ToString();
                            txtOptionD.Text = reader["OptionD"].ToString();
                            ddlCorrect.SelectedValue = reader["CorrectAnswer"].ToString().Trim();
                            lblFormTitle.InnerText = "Edit Question";
                            btnSave.Text = "Update Question";
                        }
                    }
                }
            }
            else if (e.CommandName == "DeleteQuestion")
            {
                // --- DELETE question ---
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(
                        "DELETE FROM Questions WHERE QuestionID = @QID", conn))
                    {
                        cmd.Parameters.AddWithValue("@QID", questionID);
                        cmd.ExecuteNonQuery();
                    }
                }
                ShowMessage("Question deleted.", true);
                LoadQuestions();
            }
        }

        // Cancel edit mode and reset form
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        // Reset form fields to default (Add mode)
        private void ClearForm()
        {
            hfQuestionID.Value = "0";
            txtQuestion.Text = string.Empty;
            txtOptionA.Text = string.Empty;
            txtOptionB.Text = string.Empty;
            txtOptionC.Text = string.Empty;
            txtOptionD.Text = string.Empty;
            ddlCorrect.SelectedValue = "A";
            lblFormTitle.InnerText = "Add New Question";
            btnSave.Text = "Add Question";
            lblMessage.Visible = false;
        }

        // Display a styled alert message
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