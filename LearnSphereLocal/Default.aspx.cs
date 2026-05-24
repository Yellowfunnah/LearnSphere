using System;
using System.Web.UI;

namespace LearnSphereLocal
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, redirect to the right dashboard
            if (Session["UserID"] != null)
            {
                if (Session["Role"].ToString() == "Admin")
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
                else
                    Response.Redirect("~/Student/Dashboard.aspx");
            }
        }
    }
}