<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="LearnSphereLocal.Student.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Results - LearnSphere</title>

    <%-- 1. EXTERNAL CSS: Bootstrap --%>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <%-- 2. EXTERNAL CSS: Custom stylesheet --%>
    <link href="../CSS/quiz-style.css" rel="stylesheet" />

    <%-- 3. INTERNAL CSS: page-specific styles --%>
    <style type="text/css">
        .result-wrapper  { max-width: 720px; margin: 0 auto; padding: 0 15px 40px; text-align: center; }
        .result-message  { font-size: 1.2rem; font-weight: 500; color: #343a40; margin-top: 10px; }
        .quiz-name-label { color: #6c757d; font-size: 0.9rem; margin-top: 5px; }
        .history-section { text-align: left; margin-top: 40px; }
        .history-section h3 { font-size: 1.1rem; font-weight: 600; margin-bottom: 15px; }
        .action-buttons  { margin-top: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <%-- NAVIGATION --%>
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

        <%-- PAGE HEADER --%>
        <header class="page-header">
            <div class="container">
                <h1>Quiz Result</h1>
                <p>See how you did and review your quiz history</p>
            </div>
        </header>

        <%-- MAIN CONTENT --%>
        <main>
            <div class="result-wrapper">

                <%-- Score display --%>
                <section aria-label="Your score">
                    <div class="score-box">
                        <asp:Label ID="lblScore" runat="server" />
                    </div>
                    <div class="result-message">
                        <asp:Label ID="lblMessage" runat="server" />
                    </div>
                    <div class="quiz-name-label">
                        <asp:Label ID="lblQuizName" runat="server" />
                    </div>
                </section>

                <%-- Action buttons --%>
                <%-- 4. INLINE STYLE on button group --%>
                <div class="action-buttons" style="border-top: 2px solid #dee2e6; padding-top: 20px; margin-top: 20px;">
                    <a href="Courses.aspx"   class="btn btn-dark me-2">Back to Courses</a>
                    <a href="Dashboard.aspx" class="btn btn-outline-secondary">Dashboard</a>
                </div>

                <%-- Quiz history --%>
                <section class="history-section" aria-label="Quiz history">
                    <hr />
                    <h3>Your Quiz History</h3>
                    <asp:GridView ID="gvHistory" runat="server"
                        CssClass="table table-bordered table-hover"
                        AutoGenerateColumns="false"
                        EmptyDataText="No quiz attempts yet. Take a quiz to see your history here.">
                        <HeaderStyle BackColor="#212529" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="QuizTitle"      HeaderText="Quiz"  />
                            <asp:BoundField DataField="Score"          HeaderText="Score" ItemStyle-Width="70" />
                            <asp:BoundField DataField="TotalQuestions" HeaderText="Total" ItemStyle-Width="70" />
                            <asp:BoundField DataField="Percentage"     HeaderText="%" DataFormatString="{0:F1}%" ItemStyle-Width="70" />
                            <asp:BoundField DataField="DateTaken"      HeaderText="Date"  DataFormatString="{0:dd MMM yyyy HH:mm}" />
                        </Columns>
                    </asp:GridView>
                </section>

            </div>
        </main>

        <%-- FOOTER --%>
        <footer class="ls-footer">
            <%-- 5. INLINE STYLE on footer paragraph --%>
            <p style="margin: 0; font-size: 0.85rem;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University</p>
        </footer>

    </form>

    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
