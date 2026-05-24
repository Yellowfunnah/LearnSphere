<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LearnSphere.Studnet.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body class="main-dashboard-page">
    <form id="form1" runat="server">

        <div class="top-nav">
            <div class="logo">LearnSphere</div>

            <div class="nav-links">
                <asp:HyperLink runat="server" NavigateUrl="~/Student/Dashboard.aspx" Text="Dashboard" />
                <asp:HyperLink runat="server" NavigateUrl="~/Student/Courses.aspx" Text="Courses" />
                <asp:HyperLink runat="server" NavigateUrl="~/Student/CourseDetails.aspx" Text="Course Details" />
                <asp:HyperLink runat="server" NavigateUrl="~/Student/Quiz.aspx" Text="Quizzes" />
                <asp:HyperLink runat="server" NavigateUrl="~/Account/Logout.aspx" Text="Logout" CssClass="logout-link" />
            </div>
        </div>

        <div class="dashboard-hero">
            <div class="hero-text">
                <h1>Welcome, <asp:Label ID="lblName" runat="server"></asp:Label></h1>
                <p>You are logged in as <strong><asp:Label ID="lblRole" runat="server"></asp:Label></strong>.</p>
                <p>Continue learning, view courses, and access quizzes from your dashboard.</p>

                <asp:Button ID="btnCourses" runat="server"
                    Text="View Courses"
                    CssClass="hero-btn"
                    PostBackUrl="~/Student/Courses.aspx" />
            </div>

            <div class="hero-card">
                <h3>Student Panel</h3>
                <p>Access learning materials, courses, and quizzes.</p>
                <p class="small-text">Connected to Person B and Person C pages.</p>
            </div>
        </div>

    </form>
</body>
</html>