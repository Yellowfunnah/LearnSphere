<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LearnSphereLocal.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LearnSphere - Digital Learning Platform</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .hero            { background: #212529; color: #ffffff; padding: 70px 0; text-align: center; }
        .hero h1         { font-size: 2.8rem; font-weight: 700; margin-bottom: 15px; }
        .hero p          { font-size: 1.1rem; color: #adb5bd; margin-bottom: 30px; }
        .features-wrap   { max-width: 900px; margin: 0 auto; padding: 50px 15px; }
        .feature-card    { background: #ffffff; border: 1px solid #dee2e6; border-radius: 8px;
                           padding: 25px; text-align: center; height: 100%; }
        .feature-icon    { font-size: 2.5rem; margin-bottom: 12px; }
        .feature-card h5 { font-weight: 600; margin-bottom: 8px; }
        .feature-card p  { font-size: 0.9rem; color: #6c757d; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="ls-navbar navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">LearnSphere</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Account/Login.aspx">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="Account/Register.aspx">Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <%-- Hero section --%>
        <section class="hero">
            <div class="container">
                <h1>Welcome to LearnSphere</h1>
                <p>A structured digital learning platform for students who want to learn on their own terms</p>
                <%-- Inline style on CTA buttons --%>
                <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
                    <a href="Account/Register.aspx" class="btn btn-light btn-lg">Get Started</a>
                    <a href="Account/Login.aspx"    class="btn btn-outline-light btn-lg">Login</a>
                </div>
            </div>
        </section>

        <%-- Features --%>
        <main>
            <section class="features-wrap" aria-label="Platform features">
                <h2 style="text-align:center; font-weight:700; margin-bottom:35px;">What LearnSphere Offers</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="feature-icon">📚</div>
                            <h5>Organised Courses</h5>
                            <p>Access structured course content broken down into easy-to-follow lessons.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="feature-icon">✅</div>
                            <h5>Online Quizzes</h5>
                            <p>Test your knowledge with multiple-choice quizzes and get instant feedback.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="feature-icon">📊</div>
                            <h5>Track Progress</h5>
                            <p>View your quiz history and monitor your learning progress over time.</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University of Technology and Innovation</p>
        </footer>

    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
