using System;
using System.Web.UI;

namespace LearnSphereLocal.Account
{
    public partial class Logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session data and redirect to login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}