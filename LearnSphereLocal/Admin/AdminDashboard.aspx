<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="LearnSphereLocal.Admin.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard - LearnSphere</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .admin-wrapper  { max-width: 900px; margin: 0 auto; padding: 0 15px 40px; }
        .admin-card     { background: #ffffff; border: 1px solid #dee2e6; border-radius: 8px;
                          padding: 25px; text-align: center; transition: box-shadow 0.15s; }
        .admin-card:hover { box-shadow: 0 3px 10px rgba(0,0,0,0.1); }
        .admin-card h5  { font-weight: 600; margin: 12px 0 6px; }
        .admin-card p   { font-size: 0.85rem; color: #6c757d; margin-bottom: 16px; }
        .admin-icon     { font-size: 2.5rem; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="ls-navbar navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="../Default.aspx">
                    LearnSphere
                    <span style="font-size:0.65rem; background:#dc3545; color:#fff; padding:1px 6px; border-radius:3px; margin-left:6px; vertical-align:middle;">ADMIN</span>
                </a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="../Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="AdminDashboard.aspx">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="AdminCourses.aspx">Courses</a></li>
                        <li class="nav-item"><a class="nav-link" href="ManageQuestions.aspx">Questions</a></li>
                        <li class="nav-item"><a class="nav-link" href="../Account/Logout.aspx">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="page-header">
            <div class="container">
                <h1>Admin Dashboard</h1>
                <p>Welcome, <asp:Label ID="lblName" runat="server" /> — manage your platform here</p>
            </div>
        </header>

        <main>
            <div class="admin-wrapper">

                <%-- Stats --%>
                <div class="row mb-4">
                    <div class="col-md-4 mb-3">
                        <div class="stat-card">
                            <div class="stat-number"><asp:Label ID="lblTotalUsers" runat="server">0</asp:Label></div>
                            <div class="stat-label">Total Users</div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="stat-card">
                            <div class="stat-number"><asp:Label ID="lblTotalCourses" runat="server">0</asp:Label></div>
                            <div class="stat-label">Total Courses</div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="stat-card">
                            <div class="stat-number"><asp:Label ID="lblTotalQuizzes" runat="server">0</asp:Label></div>
                            <div class="stat-label">Total Quizzes</div>
                        </div>
                    </div>
                </div>

                <%-- Quick access cards --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="admin-card">
                            <div class="admin-icon">📚</div>
                            <h5>Manage Courses</h5>
                            <p>Add, edit, or delete courses available to students</p>
                            <a href="AdminCourses.aspx" class="btn btn-dark">Go to Courses</a>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="admin-card">
                            <div class="admin-icon">❓</div>
                            <h5>Manage Questions</h5>
                            <p>Add, edit, or delete quiz questions for each course</p>
                            <a href="ManageQuestions.aspx" class="btn btn-dark">Go to Questions</a>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere Admin &mdash; Asia Pacific University</p>
        </footer>

    </form>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
