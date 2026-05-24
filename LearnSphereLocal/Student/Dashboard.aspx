<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LearnSphereLocal.Student.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard - LearnSphere</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .dashboard-wrapper { max-width: 900px; margin: 0 auto; padding: 0 15px 40px; }
        .stat-card { background: #ffffff; border: 1px solid #dee2e6; border-radius: 8px;
                     padding: 20px; text-align: center; }
        .stat-number { font-size: 2rem; font-weight: bold; color: #212529; }
        .stat-label  { font-size: 0.85rem; color: #6c757d; margin-top: 4px; }
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
                <h1>Welcome, <asp:Label ID="lblName" runat="server" /></h1>
                <p>Here's your learning overview</p>
            </div>
        </header>

        <main>
            <div class="dashboard-wrapper">

                <%-- Stats row --%>
                <div class="row mb-4">
                    <div class="col-md-4 mb-3">
                        <div class="stat-card">
                            <div class="stat-number">
                                <asp:Label ID="lblQuizCount" runat="server">0</asp:Label>
                            </div>
                            <div class="stat-label">Quizzes Taken</div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="stat-card">
                            <div class="stat-number">
                                <asp:Label ID="lblAvgScore" runat="server">-</asp:Label>
                            </div>
                            <div class="stat-label">Average Score</div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="stat-card">
                            <%-- Inline style to highlight the role badge --%>
                            <div class="stat-number" style="font-size: 1.2rem;">
                                <asp:Label ID="lblRole" runat="server" />
                            </div>
                            <div class="stat-label">Account Role</div>
                        </div>
                    </div>
                </div>

                <%-- Recent quiz results --%>
                <section aria-label="Recent results">
                    <h4 style="font-size: 1.1rem; font-weight: 600; margin-bottom: 15px;">Recent Quiz Results</h4>
                    <asp:GridView ID="gvRecent" runat="server"
                        CssClass="table table-bordered table-hover"
                        AutoGenerateColumns="false"
                        EmptyDataText="You haven't taken any quizzes yet. Go to Courses to get started!">
                        <HeaderStyle BackColor="#212529" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="QuizTitle"      HeaderText="Quiz" />
                            <asp:BoundField DataField="Score"          HeaderText="Score" ItemStyle-Width="70" />
                            <asp:BoundField DataField="TotalQuestions" HeaderText="Total" ItemStyle-Width="70" />
                            <asp:BoundField DataField="Percentage"     HeaderText="%" DataFormatString="{0:F1}%" ItemStyle-Width="70" />
                            <asp:BoundField DataField="DateTaken"      HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
                        </Columns>
                    </asp:GridView>
                </section>

                <div style="margin-top: 20px;">
                    <a href="Courses.aspx" class="btn btn-dark">Browse Courses</a>
                </div>

            </div>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University</p>
        </footer>

    </form>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
