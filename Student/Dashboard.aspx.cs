using System;
using System.Web.UI;

namespace LearnSphere.Studnet
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            // Check if user is Student
            if (Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            // Display user info
            lblName.Text = Session["FullName"].ToString();
            lblRole.Text = Session["Role"].ToString();
        }
    }
}