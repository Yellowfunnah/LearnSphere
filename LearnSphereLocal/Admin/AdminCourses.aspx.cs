using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearnSphereLocal.Admin
{
    public partial class AdminCourses : Page
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
                LoadCourses();
        }

        private void LoadCourses()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT CourseID, Title, Description FROM Courses ORDER BY CourseID", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvCourses.DataSource = dt;
            gvCourses.DataBind();

            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                ShowMessage("Course title is required.", false);
                return;
            }

            int courseID = int.Parse(hfCourseID.Value);

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            if (courseID == 0)
            {
                // INSERT
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Courses (Title, Description) VALUES (@Title, @Desc)", con);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
                cmd.ExecuteNonQuery();
                ShowMessage("Course added successfully!", true);
            }
            else
            {
                // UPDATE
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Courses SET Title=@Title, Description=@Desc WHERE CourseID=@ID", con);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@ID", courseID);
                cmd.ExecuteNonQuery();
                ShowMessage("Course updated successfully!", true);
            }

            con.Close();
            ClearForm();
            LoadCourses();
        }

        protected void gvCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int courseID = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditCourse")
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Courses WHERE CourseID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", courseID);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfCourseID.Value = courseID.ToString();
                    txtTitle.Text = reader["Title"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    lblFormTitle.InnerText = "Edit Course";
                    btnSave.Text = "Update Course";
                }
                reader.Close();
                con.Close();
            }
            else if (e.CommandName == "DeleteCourse")
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Courses WHERE CourseID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", courseID);
                cmd.ExecuteNonQuery();

                con.Close();
                ShowMessage("Course deleted.", true);
                LoadCourses();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            hfCourseID.Value = "0";
            txtTitle.Text = string.Empty;
            txtDescription.Text = string.Empty;
            lblFormTitle.InnerText = "Add New Course";
            btnSave.Text = "Add Course";
            lblMessage.Visible = false;
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