<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCourses.aspx.cs" Inherits="LearnSphereLocal.Admin.AdminCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Courses - LearnSphere</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .admin-wrapper { max-width: 950px; margin: 0 auto; padding: 0 15px 40px; }
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
                <h1>Manage Courses</h1>
                <p>Add, edit, or delete courses</p>
            </div>
        </header>

        <main>
            <div class="admin-wrapper">

                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert d-block mb-3" />

                <%-- ADD / EDIT FORM --%>
                <div class="form-panel">
                    <h5 id="lblFormTitle" runat="server">Add New Course</h5>
                    <asp:HiddenField ID="hfCourseID" runat="server" Value="0" />

                    <div class="mb-3">
                        <label class="form-label">Course Title <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                            ControlToValidate="txtTitle" CssClass="text-danger" Display="Dynamic"
                            ErrorMessage="Title is required." ValidationGroup="CourseForm" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                            TextMode="MultiLine" Rows="3" />
                    </div>

                    <asp:Button ID="btnSave" runat="server" Text="Add Course"
                        CssClass="btn btn-dark me-2" OnClick="btnSave_Click" ValidationGroup="CourseForm" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                        CssClass="btn btn-outline-secondary" OnClick="btnCancel_Click" CausesValidation="false" />
                </div>

                <%-- COURSES GRID --%>
                <h5 style="font-size:1rem; font-weight:600; margin-bottom:12px;">All Courses</h5>
                <asp:GridView ID="gvCourses" runat="server"
                    CssClass="table table-bordered table-hover"
                    AutoGenerateColumns="false"
                    DataKeyNames="CourseID"
                    EmptyDataText="No courses yet. Add one above."
                    OnRowCommand="gvCourses_RowCommand">
                    <HeaderStyle BackColor="#212529" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CourseID"    HeaderText="#"           ItemStyle-Width="40" />
                        <asp:BoundField DataField="Title"       HeaderText="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="140">
                            <ItemTemplate>
                                <asp:Button CommandName="EditCourse"
                                    CommandArgument='<%# Eval("CourseID") %>'
                                    Text="Edit" CssClass="btn btn-sm btn-warning me-1"
                                    runat="server" CausesValidation="false" />
                                <asp:Button CommandName="DeleteCourse"
                                    CommandArgument='<%# Eval("CourseID") %>'
                                    Text="Delete" CssClass="btn btn-sm btn-danger"
                                    OnClientClick="return confirm('Delete this course?');"
                                    runat="server" CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere Admin &mdash; Asia Pacific University</p>
        </footer>

    </form>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
