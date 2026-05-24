<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="LearnSphereLocal.Student.CourseDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Course Details - LearnSphere</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .details-wrapper { max-width: 860px; margin: 0 auto; padding: 0 15px 40px; }
        .quiz-banner     { background: #212529; color: #fff; border-radius: 8px;
                           padding: 25px; margin-top: 30px; text-align: center; }
        .quiz-banner h4  { margin-bottom: 8px; }
        .quiz-banner p   { color: #adb5bd; margin-bottom: 16px; font-size: 0.9rem; }
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
                <h1 id="lblCourseTitle" runat="server">Course</h1>
                <p><a href="Courses.aspx" style="color:#adb5bd;">&#8592; Back to Courses</a></p>
            </div>
        </header>

        <main>
            <div class="details-wrapper">

                <section aria-label="Course description">
                    <div class="ls-card">
                        <h4 style="font-weight:600; margin-bottom:12px;">About This Course</h4>
                        <p id="lblCourseDesc" runat="server" class="text-muted"></p>
                    </div>
                </section>

                <%-- Quiz section --%>
                <section aria-label="Course quiz">
                    <asp:Panel ID="pnlQuiz" runat="server" Visible="false">
                        <div class="quiz-banner">
                            <h4 id="lblQuizTitle" runat="server"></h4>
                            <p id="lblQuizDesc" runat="server"></p>
                            <asp:HyperLink ID="lnkStartQuiz" runat="server"
                                CssClass="btn btn-light btn-lg">
                                Start Quiz
                            </asp:HyperLink>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlNoQuiz" runat="server" Visible="false">
                        <div class="alert alert-info mt-3">
                            No quiz available for this course yet.
                        </div>
                    </asp:Panel>
                </section>

            </div>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University</p>
        </footer>

    </form>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
