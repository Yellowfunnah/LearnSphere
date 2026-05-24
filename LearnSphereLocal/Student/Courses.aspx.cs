using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LearnSphereLocal.Student
{
    public partial class Courses : Page
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

            if (dt.Rows.Count == 0)
            {
                lblNoCourses.Visible = true;
                rptCourses.Visible = false;
            }
            else
            {
                rptCourses.DataSource = dt;
                rptCourses.DataBind();
            }

            con.Close();
        }
    }
}