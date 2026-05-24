<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="LearnSphere.Admin.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body class="main-dashboard-page">
    <form id="form1" runat="server">

        <div class="top-nav">
            <div class="logo">LearnSphere</div>

            <div class="nav-links">
                <asp:HyperLink runat="server" NavigateUrl="~/Admin/AdminDashboard.aspx" Text="Dashboard" />
                <asp:HyperLink runat="server" NavigateUrl="~/Admin/AdminCourses.aspx" Text="Manage Courses" />
                <asp:HyperLink runat="server" NavigateUrl="~/Admin/AddCourse.aspx" Text="Add Course" />
                <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageQuestions.aspx" Text="Manage Questions" />
                <asp:HyperLink runat="server" NavigateUrl="~/Account/Logout.aspx" Text="Logout" CssClass="logout-link" />
            </div>
        </div>

        <div class="dashboard-hero">
            <div class="hero-text">
                <h1>Welcome, <asp:Label ID="lblName" runat="server"></asp:Label></h1>
                <p>You are logged in as <strong><asp:Label ID="lblRole" runat="server"></asp:Label></strong>.</p>
                <p>Manage courses, learning content, and quiz questions from the admin dashboard.</p>

                <asp:Button ID="btnManageCourses" runat="server"
                    Text="Manage Courses"
                    CssClass="hero-btn"
                    PostBackUrl="~/Admin/AdminCourses.aspx" />
            </div>

            <div class="hero-card">
                <h3>Admin Panel</h3>
                <p>Control course content and manage learning resources.</p>
                <p class="small-text">Connected to Person B and Person C pages.</p>
            </div>
        </div>

    </form>
</body>
</html>