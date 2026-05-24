<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="LearnSphereLocal.Student.Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Courses - LearnSphere</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .courses-wrapper { max-width: 900px; margin: 0 auto; padding: 0 15px 40px; }
        .course-card a   { text-decoration: none; color: inherit; }
        .course-badge    { font-size: 0.75rem; background: #212529; color: #fff;
                           padding: 2px 8px; border-radius: 12px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="ls-navbar navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="../Default.aspx">LearnSphere</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="../Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Courses.aspx">Courses</a></li>
                        <li class="nav-item"><a class="nav-link" href="Result.aspx">My Results</a></li>
                        <li class="nav-item"><a class="nav-link" href="Dashboard.aspx">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="../Account/Logout.aspx">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="page-header">
            <div class="container">
                <h1>All Courses</h1>
                <p>Browse and start learning at your own pace</p>
            </div>
        </header>

        <main>
            <div class="courses-wrapper">

                <asp:Label ID="lblNoCourses" runat="server" Visible="false"
                    CssClass="alert alert-info d-block"
                    Text="No courses available yet. Check back soon!" />

                <asp:Repeater ID="rptCourses" runat="server">
                    <ItemTemplate>
                        <div class="course-card">
                            <div style="display: flex; justify-content: space-between; align-items: flex-start;">
                                <div>
                                    <h5><%# Eval("Title") %></h5>
                                    <p class="text-muted" style="font-size: 0.9rem; margin-bottom: 12px;">
                                        <%# Eval("Description") %>
                                    </p>
                                </div>
                                <span class="course-badge">Course</span>
                            </div>
                            <a href='CourseDetails.aspx?courseID=<%# Eval("CourseID") %>'
                                class="btn btn-dark btn-sm">View Course</a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University</p>
        </footer>

    </form>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
