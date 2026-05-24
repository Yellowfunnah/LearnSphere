<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="LearnSphereLocal.Student.Quiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quiz - LearnSphere</title>

    <%-- 1. EXTERNAL CSS: Bootstrap --%>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <%-- 2. EXTERNAL CSS: Our own custom stylesheet --%>
    <link href="../CSS/quiz-style.css" rel="stylesheet" />

    <%-- 3. INTERNAL CSS: page-specific overrides --%>
    <style type="text/css">
        .quiz-wrapper   { max-width: 760px; margin: 0 auto; padding: 0 15px 40px; }
        .quiz-progress  { font-size: 0.85rem; color: #6c757d; margin-bottom: 20px; }
        .error-msg      { color: #dc3545; font-weight: 500; margin-bottom: 15px; }
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
                <h1 id="lblQuizTitle" runat="server">Quiz</h1>
                <p id="lblQuizDesc" runat="server"></p>
            </div>
        </header>

        <%-- MAIN CONTENT --%>
        <main>
            <div class="quiz-wrapper">

                <%-- Error shown if a question is skipped (server-side catch) --%>
                <asp:Label ID="lblError" runat="server" CssClass="error-msg" Visible="false" />

                <%-- Questions loaded dynamically from the database --%>
                <asp:Repeater ID="rptQuestions" runat="server">
                    <ItemTemplate>
                        <div class="question-card">
                            <div class="question-text">
                                <%-- 4. INLINE STYLE: question number badge --%>
                                <span style="background-color: #212529; color: #fff; padding: 2px 9px; border-radius: 12px; font-size: 0.8rem; margin-right: 8px;">
                                    Q<%# Container.ItemIndex + 1 %>
                                </span>
                                <%# Eval("QuestionText") %>
                            </div>
                            <label class="option-label">
                                <input type="radio" name="question_<%# Eval("QuestionID") %>" value="A" />
                                A) <%# Eval("OptionA") %>
                            </label>
                            <label class="option-label">
                                <input type="radio" name="question_<%# Eval("QuestionID") %>" value="B" />
                                B) <%# Eval("OptionB") %>
                            </label>
                            <label class="option-label">
                                <input type="radio" name="question_<%# Eval("QuestionID") %>" value="C" />
                                C) <%# Eval("OptionC") %>
                            </label>
                            <label class="option-label">
                                <input type="radio" name="question_<%# Eval("QuestionID") %>" value="D" />
                                D) <%# Eval("OptionD") %>
                            </label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <%-- Hidden fields to carry data through postback --%>
                <asp:HiddenField ID="hfQuizID"      runat="server" />
                <asp:HiddenField ID="hfQuestionIDs" runat="server" />

                <%-- 5. INLINE STYLE: submit button area --%>
                <div style="margin-top: 10px; padding-top: 20px; border-top: 1px solid #dee2e6;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Quiz"
                        CssClass="btn btn-dark btn-lg"
                        OnClick="btnSubmit_Click"
                        OnClientClick="return validateQuiz();" />
                    <a href="Courses.aspx" class="btn btn-outline-secondary btn-lg ms-2">Cancel</a>
                </div>

            </div>
        </main>

        <%-- FOOTER --%>
        <footer class="ls-footer">
            <p style="margin: 0;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University</p>
        </footer>

    </form>

    <%-- CLIENT-SIDE VALIDATION: ensures every question has been answered before submit --%>
    <script type="text/javascript">
        function validateQuiz() {
            var hiddenIDs = document.getElementById('<%= hfQuestionIDs.ClientID %>');
            if (!hiddenIDs || !hiddenIDs.value) return true;

            var ids = hiddenIDs.value.split(',');
            for (var i = 0; i < ids.length; i++) {
                var radios = document.querySelectorAll('input[name="question_' + ids[i] + '"]');
                var answered = false;
                for (var j = 0; j < radios.length; j++) {
                    if (radios[j].checked) { answered = true; break; }
                }
                if (!answered) {
                    alert('Please answer Question ' + (i + 1) + ' before submitting.');
                    return false;
                }
            }
            return true;
        }
    </script>

    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
